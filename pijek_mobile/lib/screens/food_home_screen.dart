import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pijek_theme.dart';
import 'restaurant_detail_screen.dart';

class FoodHomeScreen extends StatelessWidget {
  const FoodHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PijekTheme.background,
      appBar: AppBar(
        backgroundColor: PijekTheme.secondary,
        elevation: 0,
        title: TextField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Cari makanan atau resto...",
            prefixIcon: const Icon(Icons.search, color: PijekTheme.primary),
            filled: true,
            fillColor: PijekTheme.cardColor,
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Categories
            const Text("Kategori Makanan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 16),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategory("Nasi", Icons.rice_bowl),
                  _buildCategory("Minuman", Icons.local_drink),
                  _buildCategory("Snack", Icons.cookie),
                  _buildCategory("Ayam", Icons.restaurant),
                  _buildCategory("Mie", Icons.ramen_dining),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            const Text("Restoran Terdekat di Morowali", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 16),
            
            // Restaurant List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Get.to(() => const RestaurantDetailScreen()),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: PijekTheme.cardColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.store, color: PijekTheme.primary, size: 36),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Warung Lezat Bahodopi", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                              const SizedBox(height: 4),
                              const Text("Ayam Goreng & Lalapan • 1.5 km", style: TextStyle(color: PijekTheme.textSecondary, fontSize: 13)),
                              const SizedBox(height: 4),
                              Row(
                                children: const [
                                  Icon(Icons.star, color: Colors.amber, size: 16),
                                  Text(" 4.9 ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                  Text("(500+ ratings)", style: TextStyle(color: PijekTheme.textSecondary, fontSize: 12)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.bookmark_border, color: PijekTheme.textSecondary),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(String label, IconData icon) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: PijekTheme.primary.withOpacity(0.12), 
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: PijekTheme.primary.withOpacity(0.2), width: 1.5),
            ),
            child: Icon(icon, color: PijekTheme.primary),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white70)),
        ],
      ),
    );
  }
}
