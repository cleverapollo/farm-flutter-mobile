import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/auth_bloc/auth_bloc.dart';
import 'package:cmo/state/entity_cubit.dart';
import 'package:cmo/state/settings_cubit.dart';
import 'package:cmo/ui/screen/splash_screen.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:path_provider/path_provider.dart';

import 'di.dart';

late FlutterSecureStorage secureStorage;
final GlobalKey<ScaffoldMessengerState> snackbarKey = GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(AppTheme.uiOverlayStyle);

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  AndroidOptions getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  secureStorage = FlutterSecureStorage(aOptions: getAndroidOptions());

  await registerGetIt();

  EasyLocalization.logger.enableLevels = [];
  await EasyLocalization.ensureInitialized();

  Bloc.observer = CmoGlobalObserver();

  runApp(
    EasyLocalization(
      supportedLocales: AppLocale.all,
      path: 'assets/l10n',
      fallbackLocale: AppLocale.fallback,
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
        BlocProvider(create: (_) => AuthBloc()),
      ],
      child: MaterialApp(
        title: 'CMO',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.create(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: const SplashScreen(),
        scaffoldMessengerKey: snackbarKey,
      ),
    );
  }
}
