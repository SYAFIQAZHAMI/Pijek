import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pijek_theme.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PijekTheme.background,
      appBar: AppBar(
        title: const Text("Dompet PIJEK", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: PijekTheme.secondary,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Get.back()),
      ),
      body: Column(
        children: [
          // Balance Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: PijekTheme.secondary,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32)),
            ),
            child: Column(
              children: [
                const Text("Saldo Pijek Anda", style: TextStyle(color: PijekTheme.textSecondary, fontSize: 14)),
                const SizedBox(height: 8),
                const Text("Rp 125.000", style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildWalletAction(Icons.add_circle_outline, "Top Up"),
                    _buildWalletAction(Icons.qr_code_scanner, "Bayar"),
                    _buildWalletAction(Icons.history, "Riwayat"),
                  ],
                )
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Transaksi Terakhir", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                Text("Lihat Semua", style: TextStyle(color: PijekTheme.primary, fontSize: 14)),
              ],
            ),
          ),
          
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(24),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12), 
                        decoration: const BoxDecoration(color: PijekTheme.cardColor, shape: BoxShape.circle), 
                        child: const Icon(Icons.shopping_bag_outlined, color: PijekTheme.primary),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Pijek Food - Warung Lezat", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                            Text("9 Mei 2026 • 12:30", style: TextStyle(color: PijekTheme.textSecondary, fontSize: 12)),
                          ],
                        ),
                      ),
                      const Text("- Rp 35.000", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildWalletAction(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12), 
          decoration: BoxDecoration(
            color: PijekTheme.primary.withOpacity(0.12), 
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: PijekTheme.primary.withOpacity(0.2), width: 1.5),
          ), 
          child: Icon(icon, color: PijekTheme.primary, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
