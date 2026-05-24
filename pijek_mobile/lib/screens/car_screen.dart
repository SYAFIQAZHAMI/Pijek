import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pijek_theme.dart';

class CarScreen extends StatefulWidget {
  const CarScreen({super.key});

  @override
  State<CarScreen> createState() => _CarScreenState();
}

class _CarScreenState extends State<CarScreen> {
  final TextEditingController _pickupController = TextEditingController(text: "Mess Pekerja IMIP");
  final TextEditingController _destinationController = TextEditingController();

  String _selectedCar = "Pijek Car (4 Seat)";
  bool _isSearching = false;

  // Preset Morowali Locations
  final Map<String, List<String>> _presets = {
    "Bahodopi": ["IMIP Gate 1", "IMIP Gate 2", "Mess Karyawan", "Camp A", "Camp B"],
    "Bungku Barat": ["Huabao Indonesia", "Site Tambang", "Camp Pekerja"],
    "Bungku Tengah": ["Pelabuhan Bungku", "Pasar Sentral", "Rumah Sakit Morowali", "Kantor Bupati"],
  };

  void _showPresetLocations() {
    showModalBottomSheet(
      context: context,
      backgroundColor: PijekTheme.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "PRESET LOKASI MOROWALI",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: PijekTheme.primary, letterSpacing: 1),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: _presets.entries.map((entry) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            entry.key,
                            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white70),
                          ),
                        ),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: entry.value.map((loc) {
                            return ActionChip(
                              backgroundColor: PijekTheme.cardColor,
                              side: const BorderSide(color: Colors.white10),
                              label: Text(loc, style: const TextStyle(color: Colors.white, fontSize: 12)),
                              onPressed: () {
                                setState(() {
                                  _destinationController.text = loc;
                                });
                                Navigator.pop(context);
                              },
                            );
                          }).toList(),
                        ),
                        const Divider(color: Colors.white10, height: 24),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PijekTheme.background,
      appBar: AppBar(
        title: const Text("Pijek Car", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: PijekTheme.secondary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: Stack(
        children: [
          // Simulated Map Background (Dark style)
          Container(
            color: const Color(0xFF151515),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.map_outlined, color: Colors.white.withOpacity(0.05), size: 100),
                  const SizedBox(height: 16),
                  Text("PETA INDUSTRI MOROWALI (Realtime GPS)", style: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 12, letterSpacing: 1.5)),
                ],
              ),
            ),
          ),
          
          // Bottom Sheet for Ride Details
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                color: PijekTheme.secondary,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 15, offset: Offset(0, -5))],
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Locations Fields
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: PijekTheme.cardColor,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white10),
                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              const Icon(Icons.my_location, color: PijekTheme.primary, size: 20),
                              Container(width: 2, height: 35, color: Colors.white10),
                              const Icon(Icons.location_on, color: Colors.red, size: 20),
                            ],
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              children: [
                                TextField(
                                  controller: _pickupController,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    hintText: "Lokasi Jemput",
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                ),
                                const Divider(color: Colors.white10, height: 16),
                                GestureDetector(
                                  onTap: _showPresetLocations,
                                  child: AbsorbPointer(
                                    child: TextField(
                                      controller: _destinationController,
                                      style: const TextStyle(color: Colors.white),
                                      decoration: const InputDecoration(
                                        hintText: "Mau pergi ke mana? (Pilih Preset)",
                                        hintStyle: TextStyle(color: Colors.white38),
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        isDense: true,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // Vehicle Options (Hemat vs Express/Big)
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildCarOption("Pijek Car (4 Seat)", "Rp 25.000", Icons.directions_car),
                          const SizedBox(width: 12),
                          _buildCarOption("Pijek Car XL (6 Seat)", "Rp 45.000", Icons.airport_shuttle),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Action Buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            child: const Text("Nanti", style: TextStyle(fontSize: 14)),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_destinationController.text.isEmpty) {
                                _showPresetLocations();
                                return;
                              }
                              setState(() {
                                _isSearching = true;
                              });
                              Future.delayed(const Duration(seconds: 4), () {
                                setState(() {
                                  _isSearching = false;
                                });
                                Get.snackbar(
                                  "Driver Pijek Car Ditemukan",
                                  "Mobil Pijek sedang menuju lokasi Anda.",
                                  backgroundColor: PijekTheme.success,
                                  colorText: Colors.white,
                                );
                              });
                            },
                            child: _isSearching
                                ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                                : const Text("Pesan Sekarang"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCarOption(String title, String price, IconData icon) {
    bool isSelected = _selectedCar == title;
    return GestureDetector(
      onTap: () => setState(() => _selectedCar = title),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? PijekTheme.primary.withOpacity(0.15) : PijekTheme.cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? PijekTheme.primary : Colors.white10, width: 1.5),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? PijekTheme.primary : PijekTheme.textSecondary),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: isSelected ? PijekTheme.primary : Colors.white)),
                Text(price, style: const TextStyle(fontSize: 12, color: PijekTheme.textSecondary)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
