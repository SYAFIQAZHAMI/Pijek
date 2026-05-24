import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pijek_theme.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate loading and redirect to Onboarding
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const OnboardingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PijekTheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Styled Industrial Logo Icon
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: PijekTheme.primary.withOpacity(0.1),
                shape: BoxShape.circle,
                border: Border.all(color: PijekTheme.primary.withOpacity(0.2), width: 2),
              ),
              child: const Icon(
                Icons.bolt,
                size: 80,
                color: PijekTheme.primary,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'PIJEK',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: PijekTheme.textPrimary,
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Transportasi Morowali',
              style: TextStyle(
                fontSize: 16,
                color: PijekTheme.textSecondary,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 60),
            const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(PijekTheme.primary),
                strokeWidth: 2.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
