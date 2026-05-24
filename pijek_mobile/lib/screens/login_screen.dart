import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pijek_theme.dart';
import 'main_layout.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  bool _otpSent = false;
  bool _isLoading = false;

  void _sendOTP() {
    if (_phoneController.text.isEmpty) {
      Get.snackbar("Error", "Nomor HP tidak boleh kosong",
          backgroundColor: PijekTheme.error, colorText: Colors.white);
      return;
    }
    setState(() => _isLoading = true);
    // Simulate sending OTP via WhatsApp
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
        _otpSent = true;
      });
      Get.snackbar("Sukses", "OTP berhasil dikirim via WhatsApp ke ${_phoneController.text}",
          backgroundColor: PijekTheme.success, colorText: Colors.white);
    });
  }

  void _verifyOTPAndLogin() {
    if (_otpController.text.isEmpty) {
      Get.snackbar("Error", "Kode OTP wajib diisi",
          backgroundColor: PijekTheme.error, colorText: Colors.white);
      return;
    }
    setState(() => _isLoading = true);
    // Simulate verification
    Future.delayed(const Duration(seconds: 1), () {
      setState(() => _isLoading = false);
      Get.offAll(() => const MainLayout());
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
              "Masuk ke PIJEK",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: PijekTheme.textPrimary),
            ),
            const SizedBox(height: 8),
            const Text(
              "Masuk dengan nomor HP aktif untuk akses transportasi Morowali.",
              style: TextStyle(fontSize: 16, color: PijekTheme.textSecondary),
            ),
            const SizedBox(height: 40),
            
            // Phone Number Input
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              enabled: !_otpSent,
              style: const TextStyle(color: PijekTheme.textPrimary),
              decoration: const InputDecoration(
                labelText: "Nomor HP (WhatsApp)",
                prefixIcon: Icon(Icons.phone_android, color: PijekTheme.primary),
              ),
            ),
            const SizedBox(height: 20),

            if (_otpSent) ...[
              // OTP Input
              TextField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: PijekTheme.textPrimary),
                decoration: const InputDecoration(
                  labelText: "Masukkan Kode OTP",
                  prefixIcon: Icon(Icons.lock_outline, color: PijekTheme.primary),
                  hintText: "6 Digit angka",
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _isLoading ? null : () => setState(() => _otpSent = false),
                  child: const Text("Ganti Nomor HP?", style: TextStyle(color: PijekTheme.primary)),
                ),
              ),
              const SizedBox(height: 20),
            ],
            
            // Login / Send OTP Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isLoading 
                    ? null 
                    : (_otpSent ? _verifyOTPAndLogin : _sendOTP),
                child: _isLoading
                    ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                    : Text(_otpSent ? "Verifikasi & Masuk" : "Kirim OTP via WhatsApp"),
              ),
            ),
            
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Belum punya akun? ", style: TextStyle(color: PijekTheme.textSecondary)),
                GestureDetector(
                  onTap: () => Get.to(() => const RegisterScreen()),
                  child: const Text("Daftar di sini", style: TextStyle(color: PijekTheme.primary, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Row(
              children: [
                Expanded(child: Divider(color: Colors.white10)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Atau masuk dengan", style: TextStyle(color: PijekTheme.textSecondary, fontSize: 13)),
                ),
                Expanded(child: Divider(color: Colors.white10)),
              ],
            ),
            const SizedBox(height: 24),
            
            // Google Login Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                onPressed: () {
                  // Simulate Google Auth
                  Get.offAll(() => const MainLayout());
                },
                icon: const Icon(Icons.g_mobiledata, size: 30),
                label: const Text("Google"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
