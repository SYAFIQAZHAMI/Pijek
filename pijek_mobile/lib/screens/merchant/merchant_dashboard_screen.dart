import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../pijek_theme.dart';
import 'merchant_menu_screen.dart';
import 'merchant_report_screen.dart';

class MerchantDashboardScreen extends StatefulWidget {
  const MerchantDashboardScreen({super.key});

  @override
  State<MerchantDashboardScreen> createState() => _MerchantDashboardScreenState();
}

class _MerchantDashboardScreenState extends State<MerchantDashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const MerchantHomeContent(),
    const MerchantMenuScreen(),
    const MerchantReportScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: PijekTheme.secondary,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: PijekTheme.primary,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: "Menu"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Laporan"),
        ],
      ),
    );
  }
}

class MerchantHomeContent extends StatelessWidget {
  const MerchantHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PijekTheme.background,
      appBar: AppBar(
        title: const Text("PIJEK Merchant", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: PijekTheme.secondary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stats Row
            Row(
              children: [
                Expanded(child: _buildStatBox("Order Masuk", "8", PijekTheme.primary)),
                const SizedBox(width: 16),
                Expanded(child: _buildStatBox("Omzet Hari Ini", "Rp 450k", PijekTheme.success)),
              ],
            ),
            const SizedBox(height: 32),
            
            const Text("Pesanan Baru", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 16),
            
            // New Orders List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("#ORD-9921", style: TextStyle(fontWeight: FontWeight.bold, color: PijekTheme.textSecondary)),
                          Text("BARU", style: TextStyle(color: PijekTheme.primary, fontWeight: FontWeight.bold, fontSize: 12)),
                        ],
                      ),
                      const Divider(color: Colors.white10, height: 24),
                      Row(
                        children: [
                          const Icon(Icons.shopping_bag_outlined, color: PijekTheme.primary),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text(
                              "2x Ayam Geprek, 1x Es Teh", 
                              style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text("Terima Order"),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatBox(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08), 
        borderRadius: BorderRadius.circular(12), 
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 12, color: PijekTheme.textSecondary)),
          const SizedBox(height: 4),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}
