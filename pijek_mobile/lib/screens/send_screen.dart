import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pijek_theme.dart';

class SendScreen extends StatelessWidget {
  const SendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PijekTheme.background,
      appBar: AppBar(
        title: const Text("Pijek Send", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: PijekTheme.secondary,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Get.back()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Detail Pengiriman Barang", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 24),
            
            // Sender Info
            _buildInfoCard(
              title: "Alamat Pengirim",
              icon: Icons.my_location,
              color: PijekTheme.primary,
              hint: "Titik Jemput Barang",
            ),
            const SizedBox(height: 16),
            
            // Receiver Info
            _buildInfoCard(
              title: "Alamat Penerima",
              icon: Icons.location_on,
              color: Colors.red,
              hint: "Titik Tujuan Pengiriman",
            ),
            
            const SizedBox(height: 24),
            const Text("Detail Paket", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 12),
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Deskripsi barang (misal: Suku cadang / berkas)",
                prefixIcon: Icon(Icons.inventory_2_outlined, color: PijekTheme.primary),
              ),
            ),
            const SizedBox(height: 32),
            
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: PijekTheme.cardColor, 
                borderRadius: BorderRadius.circular(12), 
                border: Border.all(color: Colors.white10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Estimasi Ongkir", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white70)),
                  Text("Rp 15.000", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: PijekTheme.primary)),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    "Pencarian Kurir",
                    "Sedang mencocokkan dengan kurir terdekat...",
                    backgroundColor: PijekTheme.primary,
                    colorText: Colors.white,
                  );
                },
                child: const Text("Cari Driver Sekarang"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({required String title, required IconData icon, required Color color, required String hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 14, color: PijekTheme.textSecondary, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: PijekTheme.cardColor,
            border: Border.all(color: Colors.white10), 
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 12),
              Expanded(child: Text(hint, style: const TextStyle(color: Colors.white60))),
              const Icon(Icons.edit, size: 16, color: PijekTheme.textSecondary),
            ],
          ),
        ),
      ],
    );
  }
}
