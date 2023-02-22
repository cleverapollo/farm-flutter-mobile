import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/entity_cubit.dart';
import 'package:cmo/state/settings_cubit.dart';
import 'package:cmo/ui/screen/splash_screen.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(AppTheme.uiOverlayStyle);

  await registerGetIt();

  EasyLocalization.logger.enableLevels = [];
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: AppLocale.all,
    path: 'assets/l10n',
    fallbackLocale: AppLocale.en,
    child: const CmoApp(),
  ));
}

class CmoApp extends StatelessWidget {
  const CmoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SettingsCubit(locale: context.locale)),
        BlocProvider(create: (_) => EntityCubit()),
      ],
      child: MaterialApp(
        title: 'CMO',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.create(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: const SplashScreen(),
      ),
    );
  }
}
