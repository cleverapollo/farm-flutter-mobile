import 'package:cmo/ui/screen/auth/login_screen.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cmo/l10n/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(AppTheme.uiOverlayStyle);

  EasyLocalization.logger.enableLevels = [];
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: AppLocale.all,
    path: 'assets/l10n',
    fallbackLocale: AppLocale.fallback,
    child: const CmoApp(),
  ));
}

class CmoApp extends StatelessWidget {
  const CmoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CMO',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.create(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const LoginScreen(),
    );
  }
}
