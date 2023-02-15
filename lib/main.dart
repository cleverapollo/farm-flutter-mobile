import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CMO',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.create(context),
      home: const SplashScreen(),
    );
  }
}
