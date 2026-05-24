import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pijek_theme.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Ride Cepat",
      "subtitle": "Pesan layanan transportasi PIJEK Ride atau Car, siap antar ke IMIP, Huabao, dan sekitarnya dengan aman.",
      "icon": "motorcycle"
    },
    {
      "title": "Pesan Makanan",
      "subtitle": "Lapar? Pijek Food siap antar makanan favoritmu langsung ke kos atau mess pekerja.",
      "icon": "restaurant"
    },
    {
      "title": "Kirim Barang",
      "subtitle": "Kirim paket atau dokumen pentingmu dengan cepat dan aman pakai Pijek Send.",
      "icon": "local_shipping"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PijekTheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) => OnboardingContent(
                  title: onboardingData[index]["title"]!,
                  subtitle: onboardingData[index]["subtitle"]!,
                  icon: onboardingData[index]["icon"]!,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onboardingData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => const LoginScreen());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: PijekTheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Masuk",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {
                          Get.to(() => const RegisterScreen());
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: PijekTheme.primary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Daftar",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: PijekTheme.primary),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: _currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? PijekTheme.primary : Colors.grey.shade700,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title, subtitle, icon;

  IconData getIcon(String iconName) {
    switch (iconName) {
      case 'motorcycle': return Icons.motorcycle;
      case 'restaurant': return Icons.restaurant;
      case 'local_shipping': return Icons.local_shipping;
      default: return Icons.star;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: PijekTheme.primary.withOpacity(0.05),
            shape: BoxShape.circle,
          ),
          child: Icon(
            getIcon(icon),
            size: 120,
            color: PijekTheme.primary,
          ),
        ),
        const Spacer(),
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: PijekTheme.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: PijekTheme.textSecondary,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
