import 'package:flutter/material.dart';
import '../../pijek_theme.dart';

class DriverOrderRequestScreen extends StatelessWidget {
  const DriverOrderRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PijekTheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: const Color(0xFF151515),
                child: const Center(
                  child: Text("Map Preview", style: TextStyle(color: Colors.white24)),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: PijekTheme.secondary,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
              ),
              child: Column(
                children: [
                  const Text("PESANAN MASUK!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: PijekTheme.primary)),
                  const SizedBox(height: 24),
                  _buildLocationRow(Icons.my_location, PijekTheme.primary, "Penjemputan", "Mess Pekerja IMIP Gate 2"),
                  const SizedBox(height: 16),
                  _buildLocationRow(Icons.location_on, Colors.red, "Tujuan", "Warung Makan Bahodopi"),
                  const Divider(color: Colors.white10, height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Tarif Bersih", style: TextStyle(fontSize: 16, color: PijekTheme.textSecondary)),
                      Text("Rp 15.000", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text("Tolak", style: TextStyle(fontSize: 15)),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(backgroundColor: PijekTheme.success),
                          child: const Text("Terima", style: TextStyle(fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationRow(IconData icon, Color color, String label, String address) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 12, color: PijekTheme.textSecondary)),
              Text(address, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
            ],
          ),
        ),
      ],
    );
  }
}
