import 'package:flutter/material.dart';
import '../../pijek_theme.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({super.key});

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  bool _isOnline = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PijekTheme.background,
      appBar: AppBar(
        title: const Text("PIJEK Driver", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: PijekTheme.secondary,
        elevation: 0,
        actions: [
          Switch(
            value: _isOnline,
            onChanged: (val) => setState(() => _isOnline = val),
            activeColor: PijekTheme.primary,
          ),
        ],
      ),
      body: Column(
        children: [
          // Earnings Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: PijekTheme.secondary,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32)),
            ),
            child: Column(
              children: [
                const Text("Pendapatan Hari Ini", style: TextStyle(color: PijekTheme.textSecondary)),
                const SizedBox(height: 8),
                const Text("Rp 150.000", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatItem("Order", "12"),
                    _buildStatItem("Rating", "4.9"),
                    _buildStatItem("Bonus", "Rp 20rb"),
                  ],
                )
              ],
            ),
          ),
          
          const SizedBox(height: 40),
          if (!_isOnline)
            Column(
              children: const [
                Icon(Icons.power_settings_new, size: 80, color: PijekTheme.textSecondary),
                const SizedBox(height: 16),
                Text("Kamu sedang Offline", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                  child: Text("Aktifkan mode Online untuk mulai menerima orderan di area Morowali.", textAlign: TextAlign.center, style: TextStyle(color: PijekTheme.textSecondary)),
                ),
              ],
            )
          else
            Expanded(
              child: Column(
                children: [
                  const CircularProgressIndicator(color: PijekTheme.primary),
                  const SizedBox(height: 16),
                  const Text("Mencari Order Terdekat...", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                  const Spacer(),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: PijekTheme.textSecondary, fontSize: 12)),
      ],
    );
  }
}
