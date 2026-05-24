import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pijek_theme.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PijekTheme.background,
      appBar: AppBar(
        title: const Text("Notifikasi", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: PijekTheme.secondary,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Get.back()),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white10)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: PijekTheme.primary.withOpacity(0.12), 
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.notifications, color: PijekTheme.primary, size: 20),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Diskon Spesial Makan Siang!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)),
                      SizedBox(height: 4),
                      Text("Pakai kode PIJEKFOOD untuk diskon 20% khusus hari ini di area Bahodopi.", style: TextStyle(color: PijekTheme.textSecondary, fontSize: 13)),
                      SizedBox(height: 8),
                      Text("1 jam yang lalu", style: TextStyle(color: PijekTheme.textMuted, fontSize: 11)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
