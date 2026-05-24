import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pijek_theme.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const PijekApp());
}

class PijekApp extends StatelessWidget {
  const PijekApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PIJEK',
      debugShowCheckedModeBanner: false,
      theme: PijekTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}
