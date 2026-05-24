import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pijek_theme.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PijekTheme.background,
      appBar: AppBar(
        title: const Text("Profil Saya", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: PijekTheme.secondary,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: PijekTheme.primary, width: 2),
              ),
              child: const CircleAvatar(
                radius: 48, 
                backgroundColor: PijekTheme.cardColor, 
                child: Icon(Icons.person, size: 48, color: PijekTheme.primary),
              ),
            ),
            const SizedBox(height: 16),
            const Text("Budi Santoso", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            const Text("+62 812 3456 7890", style: TextStyle(color: PijekTheme.textSecondary)),
            const SizedBox(height: 32),
            
            _buildProfileItem(Icons.person_outline, "Edit Profil"),
            _buildProfileItem(Icons.location_on_outlined, "Alamat Tersimpan"),
            _buildProfileItem(Icons.payment_outlined, "Metode Pembayaran"),
            _buildProfileItem(Icons.help_outline, "Bantuan & Dukungan"),
            _buildProfileItem(Icons.privacy_tip_outlined, "Ketentuan Layanan"),
            
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                width: double.infinity,
                child: TextButton.icon(
                  onPressed: () {
                    Get.offAll(() => const LoginScreen());
                  },
                  icon: const Icon(Icons.logout, color: PijekTheme.error),
                  label: const Text("Keluar Akun", style: TextStyle(color: PijekTheme.error, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: PijekTheme.primary),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white)),
      trailing: const Icon(Icons.chevron_right, color: PijekTheme.textSecondary),
      onTap: () {},
    );
  }
}
