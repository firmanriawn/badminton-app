import 'package:flutter/material.dart';
import '../../models/Fields.dart';
import '../detail_lapangan/detail_lapangan_screen.dart';
import 'components/home_header.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedLocation;
  double? maxPrice;
  List<String> selectedFacilities = [];

  @override
  Widget build(BuildContext context) {
    List<Field> filteredFields = fields.where((field) {
      final matchesLocation = selectedLocation == null || field.location == selectedLocation;
      final matchesPrice = maxPrice == null || field.price <= maxPrice!;
      final matchesFacilities = selectedFacilities.isEmpty || selectedFacilities.every((facility) => field.facilities.contains(facility));
      return matchesLocation && matchesPrice && matchesFacilities;
    }).toList();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              // Color(0xFFf83f43),
              Color(0xFF142f47),
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 0.35],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                const HomeHeader(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        DropdownButton<String>(
                          hint: const Text('Pilih Lokasi', style: TextStyle(fontWeight: FontWeight.bold)),
                          value: selectedLocation,
                          items: fields.map((field) {
                            return DropdownMenuItem<String>(
                              value: field.location,
                              child: Text(field.location),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedLocation = value;
                            });
                          },
                          isExpanded: true,
                          style: const TextStyle(color: Colors.black),
                          underline: Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Maksimal Harga: ${maxPrice != null ? 'Rp ${maxPrice!.toStringAsFixed(0)}' : 'Tidak Ada Batas'}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Slider(
                          min: 0,
                          max: 300000,
                          divisions: 6,
                          label: maxPrice != null ? 'Rp ${maxPrice!.toStringAsFixed(0)}' : 'Tidak Ada Batas',
                          value: maxPrice ?? 300000,
                          activeColor: const Color(0xFFf83f43),
                          onChanged: (value) {
                            setState(() {
                              maxPrice = value;
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Fasilitas:',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Wrap(
                          spacing: 8,
                          children: [
                            ...["Wifi", "Parkir", "Kantin", "Loker"].map((facility) {
                              return FilterChip(
                                label: Text(facility),
                                selected: selectedFacilities.contains(facility),
                                onSelected: (isSelected) {
                                  setState(() {
                                    isSelected
                                        ? selectedFacilities.add(facility)
                                        : selectedFacilities.remove(facility);
                                  });
                                },
                                selectedColor: const Color(0xFFf83f43),
                                backgroundColor: Colors.transparent, // Menghilangkan background saat tidak dipilih
                                labelStyle: TextStyle(
                                  color: selectedFacilities.contains(facility) ? Colors.white : Colors.black,
                                ),
                                checkmarkColor: Colors.white,
                                side: BorderSide.none, // Menghilangkan border
                              );
                            }).toList(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredFields.length,
                  itemBuilder: (context, index) {
                    final field = filteredFields[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8), // Warna body yang bisa diubah
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FieldDetailScreen(field: field),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                field.imageUrl,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    field.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    field.location,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Rp ${field.price.toStringAsFixed(0)}/jam",
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
