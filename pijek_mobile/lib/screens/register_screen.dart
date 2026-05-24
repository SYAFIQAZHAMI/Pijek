import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pijek_theme.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _refController = TextEditingController();
  bool _isLoading = false;

  void _handleRegister() {
    if (_nameController.text.isEmpty || _phoneController.text.isEmpty || _emailController.text.isEmpty) {
      Get.snackbar("Error", "Semua data wajib diisi",
          backgroundColor: PijekTheme.error, colorText: Colors.white);
      return;
    }
    setState(() => _isLoading = true);
    // Simulate register
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => _isLoading = false);
      Get.snackbar("Sukses", "Registrasi berhasil! Silakan masuk.",
          backgroundColor: PijekTheme.success, colorText: Colors.white);
      Get.off(() => const LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PijekTheme.background,
      appBar: AppBar(
        backgroundColor: PijekTheme.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: PijekTheme.textPrimary),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Daftar Akun PIJEK",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: PijekTheme.textPrimary),
            ),
            const SizedBox(height: 8),
            const Text(
              "Lengkapi form untuk bergabung bersama kami di Morowali.",
              style: TextStyle(fontSize: 16, color: PijekTheme.textSecondary),
            ),
            const SizedBox(height: 40),
            
            // Name Input
            TextField(
              controller: _nameController,
              style: const TextStyle(color: PijekTheme.textPrimary),
              decoration: const InputDecoration(
                labelText: "Nama Lengkap",
                prefixIcon: Icon(Icons.person_outline, color: PijekTheme.primary),
              ),
            ),
            const SizedBox(height: 16),
            
            // Phone Input
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: PijekTheme.textPrimary),
              decoration: const InputDecoration(
                labelText: "Nomor HP (WhatsApp)",
                prefixIcon: Icon(Icons.phone_android, color: PijekTheme.primary),
              ),
            ),
            const SizedBox(height: 16),
            
            // Email Input
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: PijekTheme.textPrimary),
              decoration: const InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email_outlined, color: PijekTheme.primary),
              ),
            ),
            const SizedBox(height: 16),
            
            // Referral Input
            TextField(
              controller: _refController,
              style: const TextStyle(color: PijekTheme.textPrimary),
              decoration: const InputDecoration(
                labelText: "Kode Referral (Opsional)",
                prefixIcon: Icon(Icons.card_giftcard, color: PijekTheme.primary),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Register Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _handleRegister,
                child: _isLoading
                    ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                    : const Text("Daftar Sekarang"),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Sudah memiliki akun? ", style: TextStyle(color: PijekTheme.textSecondary)),
                GestureDetector(
                  onTap: () => Get.off(() => const LoginScreen()),
                  child: const Text("Masuk", style: TextStyle(color: PijekTheme.primary, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
