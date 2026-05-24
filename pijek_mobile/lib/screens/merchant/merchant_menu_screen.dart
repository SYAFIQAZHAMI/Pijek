import 'package:flutter/material.dart';
import '../../pijek_theme.dart';

class MerchantMenuScreen extends StatelessWidget {
  const MerchantMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PijekTheme.background,
      appBar: AppBar(
        title: const Text("Manajemen Menu", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: PijekTheme.secondary,
        actions: [
          IconButton(onPressed: () => _showAddMenuDialog(context), icon: const Icon(Icons.add, color: Colors.white)),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            color: PijekTheme.cardColor,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: const BorderSide(color: Colors.white10)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: Container(
                width: 60, 
                height: 60, 
                decoration: BoxDecoration(color: Colors.grey.shade800, borderRadius: BorderRadius.circular(8)), 
                child: const Icon(Icons.fastfood, color: PijekTheme.primary),
              ),
              title: const Text("Ayam Geprek", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              subtitle: const Text("Rp 25.000 • Stok: 20", style: TextStyle(color: PijekTheme.textSecondary)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(icon: const Icon(Icons.edit, color: Colors.blue), onPressed: () {}),
                  IconButton(icon: const Icon(Icons.delete, color: Colors.red), onPressed: () {}),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showAddMenuDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: PijekTheme.background,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, left: 24, right: 24, top: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Tambah Menu Baru", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 24),
            const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(labelText: "Nama Menu"),
            ),
            const SizedBox(height: 16),
            const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(labelText: "Harga (Rp)"), 
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(labelText: "Stok"), 
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Simpan Menu"),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
