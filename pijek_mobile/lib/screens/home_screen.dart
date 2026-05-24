import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pijek_theme.dart';
import 'ride_screen.dart';
import 'car_screen.dart';
import 'food_home_screen.dart';
import 'send_screen.dart';
import 'notification_screen.dart';
import 'wallet_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isShiftMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PijekTheme.background,
      appBar: AppBar(
        backgroundColor: PijekTheme.secondary,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "LOKASI AKTIF",
              style: TextStyle(fontSize: 10, color: PijekTheme.primary, fontWeight: FontWeight.bold, letterSpacing: 1),
            ),
            Row(
              children: const [
                Text("Mess Pekerja IMIP, Bahodopi", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
                Icon(Icons.keyboard_arrow_down, color: PijekTheme.primary, size: 16),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () => Get.to(() => const NotificationScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar stacked over a modern dark container
            Container(
              height: 70,
              decoration: const BoxDecoration(
                color: PijekTheme.secondary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Mau pergi ke mana hari ini?",
                  prefixIcon: const Icon(Icons.search, color: PijekTheme.primary),
                  filled: true,
                  fillColor: PijekTheme.cardColor,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            
            // Shift Mode Toggle (Specially Designed for Morowali Site Workers)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _isShiftMode ? PijekTheme.primary.withOpacity(0.15) : PijekTheme.cardColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: _isShiftMode ? PijekTheme.primary : Colors.white10,
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: _isShiftMode ? PijekTheme.primary.withOpacity(0.2) : Colors.white.withOpacity(0.05),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.engineering, 
                        color: _isShiftMode ? PijekTheme.primary : PijekTheme.textSecondary
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _isShiftMode ? "MODE SHIFT AKTIF (22.00 - 05.00)" : "SHIFT MODE PEKERJA",
                            style: TextStyle(
                              fontWeight: FontWeight.bold, 
                              fontSize: 13,
                              color: _isShiftMode ? PijekTheme.primary : PijekTheme.textPrimary
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            _isShiftMode 
                                ? "Prioritas rute gerbang pabrik IMIP/Huabao & supir malam." 
                                : "Aktifkan untuk perjalanan malam & rute cepat kawasan industri.",
                            style: const TextStyle(fontSize: 11, color: PijekTheme.textSecondary),
                          ),
                        ],
                      ),
                    ),
                    Switch(
                      value: _isShiftMode,
                      onChanged: (val) {
                        setState(() => _isShiftMode = val);
                        if (val) {
                          Get.snackbar(
                            "Shift Mode Aktif", 
                            "Rute gerbang pabrik & driver shift malam diprioritaskan.",
                            backgroundColor: PijekTheme.primary,
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            
            // Wallet Mini Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GestureDetector(
                onTap: () => Get.to(() => const WalletScreen()),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: PijekTheme.cardColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.account_balance_wallet, color: PijekTheme.primary),
                      const SizedBox(width: 12),
                      const Text("Saldo: ", style: TextStyle(color: PijekTheme.textSecondary)),
                      const Text("Rp 125.000", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                      const Spacer(),
                      Container(
                        height: 20,
                        width: 1,
                        color: Colors.white10,
                      ),
                      const Spacer(),
                      const Icon(Icons.add_circle_outline, color: PijekTheme.primary, size: 20),
                      const SizedBox(width: 6),
                      const Text("Top Up", style: TextStyle(color: PijekTheme.primary, fontWeight: FontWeight.bold, fontSize: 13)),
                    ],
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Menu Utama Grid (Ride, Car, Food, Send)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.to(() => const RideScreen()),
                    child: _buildMenuIcon(Icons.motorcycle, "Pijek Ride", PijekTheme.primary),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => const CarScreen()),
                    child: _buildMenuIcon(Icons.directions_car, "Pijek Car", Colors.blue),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => const FoodHomeScreen()),
                    child: _buildMenuIcon(Icons.fastfood, "Pijek Food", Colors.amber),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => const SendScreen()),
                    child: _buildMenuIcon(Icons.local_shipping, "Pijek Send", Colors.green),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Promo Banner
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [PijekTheme.primary, Color(0xFFFF9F43)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Diskon Malam 10%", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text("Khusus pekerja shift malam di area Bahodopi.", style: TextStyle(color: Colors.white70, fontSize: 12)),
                        ],
                      ),
                    ),
                    const Icon(Icons.percent, color: Colors.white, size: 60),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Quick History
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text("Order Terakhir", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: PijekTheme.textPrimary)),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: PijekTheme.cardColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white10),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.history, color: PijekTheme.textSecondary),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Mess IMIP -> Huabao Camp", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                          SizedBox(height: 2),
                          Text("Pijek Ride • Rp 15.000", style: TextStyle(fontSize: 12, color: PijekTheme.textSecondary)),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, color: PijekTheme.textSecondary, size: 14),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Rekomendasi Restoran Populer
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Restoran Populer", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                  TextButton(
                    onPressed: () {}, 
                    child: const Text("Lihat Semua", style: TextStyle(color: PijekTheme.primary)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    width: 140,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      color: PijekTheme.cardColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                          ),
                          child: const Center(child: Icon(Icons.fastfood, color: PijekTheme.primary, size: 40)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Warung Makan Site", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13)),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.amber, size: 14),
                                  Text(" 4.8", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white)),
                                  Text(" • 2km", style: TextStyle(fontSize: 11, color: PijekTheme.textSecondary)),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuIcon(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withOpacity(0.2), width: 1.5),
          ),
          child: Icon(icon, color: color, size: 30),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white)),
      ],
    );
  }
}
