import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'package:cmo/di.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';

late FlutterSecureStorage secureStorage;
final snackbarKey = GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(AppTheme.uiOverlayStyle);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await hideInputMethod();

  EasyLocalization.logger.enableLevels = [];
  await EasyLocalization.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  AndroidOptions getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);
  secureStorage = FlutterSecureStorage(aOptions: getAndroidOptions());

  await registerGetIt();
  await deviceInfoService.init();
  await cmoDatabaseService.db;

  Bloc.observer = CmoGlobalObserver();

  runApp(
    EasyLocalization(
      supportedLocales: AppLocale.all,
      path: 'assets/l10n',
      fallbackLocale: AppLocale.fallback,
      useOnlyLangCode: true,
      child: const CmoApp(),
    ),
  );
}

class CmoApp extends StatelessWidget {
  const CmoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SettingsCubit(locale: context.locale)),
        BlocProvider(create: (_) => EntityCubit()),
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => UserInfoCubit()),
        BlocProvider(create: (_) => UserDeviceCubit()),
        BlocProvider(create: (_) => AssessmentListCubit()),
        BlocProvider(create: (_) => AssessmentCubit()),
        BlocProvider(create: (_) => AssessmentQuestionCubit()),
        BlocProvider(create: (_) => AuditCubit()),
        BlocProvider(create: (_) => AuditListCubit()),
        BlocProvider(create: (_) => AuditListQuestionsCubit()),
      ],
      child: MaterialApp(
        title: 'CMO',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.create(),
        localizationsDelegates: [
          FormBuilderLocalizations.delegate,
          ...context.localizationDelegates,
        ],
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: const SplashScreen(),
        scaffoldMessengerKey: snackbarKey,
      ),
    );
  }
}
