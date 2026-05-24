import 'package:flutter/material.dart';
import '../../pijek_theme.dart';

class DriverRegisterScreen extends StatelessWidget {
  const DriverRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PijekTheme.background,
      appBar: AppBar(
        title: const Text("Pendaftaran Driver", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), 
        backgroundColor: PijekTheme.secondary, 
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Lengkapi Dokumen Pendaftaran", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 8),
            const Text("Mohon upload foto dokumen asli Anda untuk verifikasi.", style: TextStyle(color: PijekTheme.textSecondary)),
            const SizedBox(height: 32),
            
            _buildUploadItem("KTP", "Foto Kartu Tanda Penduduk"),
            _buildUploadItem("SIM", "Foto Surat Izin Mengemudi"),
            _buildUploadItem("STNK", "Foto Surat Tanda Nomor Kendaraan"),
            _buildUploadItem("Selfie", "Foto Diri dengan Dokumen"),
            
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Kirim Pendaftaran"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadItem(String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: PijekTheme.cardColor,
        border: Border.all(color: Colors.white10), 
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.cloud_upload_outlined, color: PijekTheme.primary, size: 30),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                Text(subtitle, style: const TextStyle(color: PijekTheme.textSecondary, fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.check_circle_outline, color: PijekTheme.textSecondary),
        ],
      ),
    );
  }
}
