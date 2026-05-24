import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pijek_theme.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PijekTheme.background,
      appBar: AppBar(
        title: const Text("Keranjang Saya", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: PijekTheme.secondary,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Get.back()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: PijekTheme.cardColor, 
                borderRadius: BorderRadius.circular(12), 
                border: Border.all(color: Colors.white10),
              ),
              child: Column(
                children: [
                  _buildCartItem("Ayam Geprek Spesial", "Rp 25.000", 1),
                  const Divider(color: Colors.white10, height: 32),
                  const TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Tambah catatan (misal: gak pakai cabe)", 
                      border: InputBorder.none, 
                      prefixIcon: Icon(Icons.edit_note, color: PijekTheme.primary),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Voucher
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: PijekTheme.cardColor, 
                borderRadius: BorderRadius.circular(12), 
                border: Border.all(color: Colors.white10),
              ),
              child: Row(
                children: const [
                  Icon(Icons.confirmation_number_outlined, color: PijekTheme.primary),
                  SizedBox(width: 12),
                  Text("Gunakan Voucher", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                  Spacer(),
                  Icon(Icons.chevron_right, color: PijekTheme.textSecondary),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            const Text("Detail Pembayaran", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 12),
            _buildPriceRow("Harga", "Rp 25.000"),
            _buildPriceRow("Ongkos Kirim", "Rp 10.000"),
            _buildPriceRow("Biaya Layanan", "Rp 2.000"),
            const Divider(color: Colors.white10, height: 24),
            _buildPriceRow("Total Pembayaran", "Rp 37.000", isTotal: true),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: PijekTheme.secondary, 
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
          border: Border(top: BorderSide(color: Colors.white10)),
        ),
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Metode Bayar", style: TextStyle(fontSize: 12, color: PijekTheme.textSecondary)),
                Row(
                  children: const [
                    Icon(Icons.account_balance_wallet, color: PijekTheme.primary, size: 16),
                    Text(" Tunai", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                  ],
                ),
              ],
            ),
            const SizedBox(width: 24),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    "Pesanan Berhasil",
                    "Pesanan Anda sedang diproses oleh merchant.",
                    backgroundColor: PijekTheme.success,
                    colorText: Colors.white,
                  );
                },
                child: const Text("Pesan Sekarang"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(String name, String price, int qty) {
    return Row(
      children: [
        Container(
          width: 60, 
          height: 60, 
          decoration: BoxDecoration(color: Colors.grey.shade900, borderRadius: BorderRadius.circular(8)), 
          child: const Icon(Icons.fastfood, color: PijekTheme.primary),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              Text(price, style: const TextStyle(color: PijekTheme.primary, fontSize: 13, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        Row(
          children: [
            _buildQtyBtn(Icons.remove),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 12), child: Text("$qty", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
            _buildQtyBtn(Icons.add),
          ],
        )
      ],
    );
  }

  Widget _buildQtyBtn(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(border: Border.all(color: Colors.white12), borderRadius: BorderRadius.circular(6)),
      child: Icon(icon, size: 16, color: Colors.white70),
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: isTotal ? 16 : 14, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal, color: isTotal ? Colors.white : PijekTheme.textSecondary)),
          Text(value, style: TextStyle(fontSize: isTotal ? 16 : 14, fontWeight: FontWeight.bold, color: isTotal ? PijekTheme.primary : Colors.white70)),
        ],
      ),
    );
  }
}
