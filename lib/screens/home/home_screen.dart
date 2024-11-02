import 'package:flutter/material.dart';
import '../../models/Gor.dart';
import '../gor_detail/gor_detail_screen.dart';
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
    // Filter GOR berdasarkan lokasi dan fasilitas
    List<Gor> filteredGors = gors.where((gor) {
      final matchesLocation = selectedLocation == null || gor.location == selectedLocation;
      final matchesFacilities = selectedFacilities.isEmpty || selectedFacilities.every((facility) => gor.facilities.contains(facility));
      return matchesLocation && matchesFacilities;
    }).toList();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
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
                  child: _buildFilterSection(),
                ),
                const SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredGors.length,
                  itemBuilder: (context, index) {
                    final gor = filteredGors[index];
                    final firstFieldImage = gor.fields.isNotEmpty ? gor.fields[0].imageUrl : ''; // Ambil gambar lapangan pertama
                    final lowestPrice = gor.fields.isNotEmpty ? gor.fields.map((field) => field.price).reduce((a, b) => a < b ? a : b) : 0; // Ambil harga terendah lapangan

                    return GestureDetector(
                      onTap: () {
                        // Navigasi ke halaman detail GOR
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GorDetailScreen(gor: gor),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Gambar lapangan
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                firstFieldImage,
                                width: double.infinity,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              gor.name,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              gor.location,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 32),
                            Row(
                              children: [
                                const Text('Mulai dari: '),
                                Text(
                                  'Rp ${lowestPrice.toStringAsFixed(0)}',
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                                const Text(' / sesi'),
                              ],
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

  Widget _buildFilterSection() {
    return Container(
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
            items: gors.map((gor) {
              return DropdownMenuItem<String>(
                value: gor.location,
                child: Text(gor.location),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedLocation = value;
              });
            },
            isExpanded: true,
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
            'Fasilitas: ',
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
                  backgroundColor: Colors.transparent,
                  labelStyle: TextStyle(
                    color: selectedFacilities.contains(facility) ? Colors.white : Colors.black,
                  ),
                  checkmarkColor: Colors.white,
                  side: BorderSide.none,
                );
              }).toList(),
            ],
          ),
        ],
      ),
    );
  }
}
