import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pijek_theme.dart';

class FoodTrackingScreen extends StatelessWidget {
  const FoodTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PijekTheme.background,
      appBar: AppBar(
        title: const Text("Melacak Pesanan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: PijekTheme.secondary,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.close, color: Colors.white), onPressed: () => Get.back()),
      ),
      body: Stack(
        children: [
          Container(
            color: const Color(0xFF151515), 
            child: const Center(child: Text("Google Maps View Placeholder", style: TextStyle(color: Colors.white24))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: PijekTheme.secondary, 
                borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)), 
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24, 
                        backgroundColor: PijekTheme.cardColor, 
                        child: const Icon(Icons.person, color: PijekTheme.primary),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Andi Driver", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
                            Text("Pijek Ride • Honda Vario • DN 1234 XY", style: TextStyle(color: PijekTheme.textSecondary, fontSize: 12)),
                          ],
                        ),
                      ),
                      IconButton(icon: const Icon(Icons.chat_bubble_outline, color: PijekTheme.primary), onPressed: () {}),
                      IconButton(icon: const Icon(Icons.phone_outlined, color: PijekTheme.success), onPressed: () {}),
                    ],
                  ),
                  const Divider(color: Colors.white10, height: 32),
                  _buildStatusItem("Pesanan Diterima", "Merchant sedang menyiapkan makananmu.", true),
                  _buildStatusItem("Driver menuju Merchant", "Sabar ya, driver sedang dalam perjalanan.", false),
                  _buildStatusItem("Driver menuju Pelanggan", "Makananmu sedang diantar.", false),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStatusItem(String title, String subtitle, bool isDone) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(isDone ? Icons.check_circle : Icons.radio_button_unchecked, color: isDone ? PijekTheme.success : PijekTheme.textSecondary, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: isDone ? Colors.white : PijekTheme.textSecondary)),
                Text(subtitle, style: const TextStyle(fontSize: 12, color: PijekTheme.textMuted)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
