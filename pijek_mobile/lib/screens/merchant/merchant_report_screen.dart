import 'package:flutter/material.dart';
import '../../pijek_theme.dart';

class MerchantReportScreen extends StatelessWidget {
  const MerchantReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PijekTheme.background,
      appBar: AppBar(
        title: const Text("Laporan Penjualan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: PijekTheme.secondary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Ringkasan Pendapatan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [PijekTheme.primary, Colors.deepOrange]), 
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Total Omzet Bulan Ini", style: TextStyle(color: Colors.white70)),
                  SizedBox(height: 8),
                  Text("Rp 12.450.000", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text("Statistik Harian", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 16),
            // Chart placeholder styled for dark theme
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(color: PijekTheme.cardColor, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white10)),
              child: const Center(child: Text("Grafik Penjualan (Mingguan)", style: TextStyle(color: PijekTheme.textSecondary))),
            ),
            const SizedBox(height: 32),
            _buildReportRow("Total Order", "156"),
            _buildReportRow("Rata-rata Order", "Rp 45.000"),
            _buildReportRow("Produk Terlaris", "Ayam Geprek"),
          ],
        ),
      ),
    );
  }

  Widget _buildReportRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: PijekTheme.textSecondary, fontSize: 15)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)),
        ],
      ),
    );
  }
}
