import 'package:flutter/material.dart';
import '../pijek_theme.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PijekTheme.background,
      appBar: AppBar(
        title: const Text("Riwayat Pesanan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: PijekTheme.secondary,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              labelColor: PijekTheme.primary,
              unselectedLabelColor: Colors.grey,
              indicatorColor: PijekTheme.primary,
              indicatorWeight: 3.0,
              tabs: [
                Tab(text: "Berlangsung"),
                Tab(text: "Selesai"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildHistoryList(isActive: true),
                  _buildHistoryList(isActive: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryList({required bool isActive}) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: isActive ? 1 : 5,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: PijekTheme.cardColor,
            border: Border.all(color: Colors.white10), 
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8), 
                    decoration: BoxDecoration(color: PijekTheme.primary.withOpacity(0.12), borderRadius: BorderRadius.circular(8)), 
                    child: const Icon(Icons.fastfood, color: PijekTheme.primary, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Pijek Food", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                        Text("9 Mei 2026 • 12:00", style: TextStyle(color: PijekTheme.textSecondary, fontSize: 12)),
                      ],
                    ),
                  ),
                  Text(
                    isActive ? "Diproses" : "Selesai", 
                    style: TextStyle(
                      color: isActive ? PijekTheme.warning : PijekTheme.success, 
                      fontWeight: FontWeight.bold, 
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.white10, height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Warung Makan Lezat", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white70)),
                  const Text("Rp 35.000", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),
              if (!isActive)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text("Pesan Lagi", style: TextStyle(fontSize: 14)),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
