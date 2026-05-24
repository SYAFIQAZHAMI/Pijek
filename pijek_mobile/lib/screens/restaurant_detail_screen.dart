import 'package:flutter/material.dart';
import '../pijek_theme.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PijekTheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: PijekTheme.secondary,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Restoran Lezat", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              background: Container(color: Colors.grey.shade900, child: const Icon(Icons.restaurant, size: 80, color: PijekTheme.primary)),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Restoran Lezat Bahodopi", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(color: PijekTheme.success.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
                        child: const Text("BUKA", style: TextStyle(color: PijekTheme.success, fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      Text(" 4.9 • 20 menit • 1.5 km", style: TextStyle(fontWeight: FontWeight.w500, color: PijekTheme.textSecondary)),
                    ],
                  ),
                  const Divider(color: Colors.white10, height: 32),
                  const Text("Menu Andalan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white10)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Ayam Geprek Spesial", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                            const SizedBox(height: 4),
                            const Text("Ayam krispi dengan sambal korek yang pedas nagih.", style: TextStyle(color: PijekTheme.textSecondary, fontSize: 13)),
                            const SizedBox(height: 8),
                            const Text("Rp 25.000", style: TextStyle(color: PijekTheme.primary, fontWeight: FontWeight.bold, fontSize: 16)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(width: 100, height: 100, decoration: BoxDecoration(color: PijekTheme.cardColor, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white10))),
                          Positioned(
                            bottom: -5,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: PijekTheme.primary,
                                foregroundColor: Colors.white,
                                minimumSize: const Size(80, 32),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                              child: const Text("TAMBAH"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              childCount: 5,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: PijekTheme.secondary, 
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
          border: Border(top: BorderSide(color: Colors.white10)),
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: PijekTheme.primary,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("1 Item", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text("Lihat Keranjang • Rp 25.000", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
