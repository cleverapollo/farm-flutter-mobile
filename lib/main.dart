import 'package:cmo/ui/screen/auth/login_screen.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(AppTheme.uiOverlayStyle);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CMO',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.create(),
      home: const LoginScreen(),
    );
  }
}
