import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/Fields.dart';
import '../../models/Gor.dart';
import 'package:intl/intl.dart';

class GorDetailScreen extends StatefulWidget {
  final Gor gor;

  const GorDetailScreen({Key? key, required this.gor}) : super(key: key);

  @override
  _GorDetailScreenState createState() => _GorDetailScreenState();
}

class _GorDetailScreenState extends State<GorDetailScreen> {
  late Gor gor;
  DateTime selectedDate = DateTime.now();
  Map<String, List<String>> bookedSchedules = {}; // Key: lapangan name, value: list of booked times

  @override
  void initState() {
    super.initState();
    gor = widget.gor;
  }

  String getFacilityIcon(String facility) {
    switch (facility.toLowerCase()) {
      case 'wifi':
        return 'assets/images/wifi.png';
      case 'parkir':
        return 'assets/images/parkir.png';
      case 'kantin':
        return 'assets/images/kantin.png';
      case 'loker':
        return 'assets/images/loker.png';
      default:
        return 'assets/icons/default.png';
    }
  }

  // Fungsi untuk membuka Google Maps dengan koordinat
  void _openGoogleMaps(double latitude, double longitude) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Fungsi untuk memilih tanggal dan menampilkan popup harga lapangan
  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30)),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      _showFieldPricePopup(context);
    }
  }

  // Menampilkan pop-up dengan harga lapangan sesuai bulan
  void _showFieldPricePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Harga Lapangan pada ${DateFormat('MMMM yyyy').format(selectedDate)}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: gor.fields.map((field) {
              final isCurrentMonth = selectedDate.month == DateTime.now().month;
              return Column(
                children: [
                  Text(
                    '${field.name}: ${isCurrentMonth ? 'Rp 100' : 'Tutup'}',
                    style: TextStyle(
                      color: isCurrentMonth ? Colors.black : Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Terapkan"),
            ),
          ],
        );
      },
    );
  }

  // Fungsi untuk menampilkan daftar jadwal lapangan per 60 menit
  Widget _buildScheduleList(Field field) {
    List<String> bookedTimes = bookedSchedules[field.name] ?? [];
    List<String> times = List.generate(24, (index) {
      DateTime time = DateTime(selectedDate.year, selectedDate.month, selectedDate.day, index);
      return DateFormat('HH:mm').format(time);
    });

    return Column(
      children: times.map((time) {
        bool isBooked = bookedTimes.contains(time);
        return ListTile(
          title: Text(time),
          subtitle: Text(isBooked ? "Booked" : "Available"),
          tileColor: isBooked ? Colors.grey[300] : null,
          onTap: isBooked ? null : () {
            // Add booking functionality here
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF142f47),
        title: const Text(
          "Detail Gor",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tampilkan gambar GOR
            if (gor.fields.isNotEmpty) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  gor.fields[0].imageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
            ],
            // Informasi tentang GOR
            Text(
              gor.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              gor.location,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.1,
            ),
            const SizedBox(height: 8),
            const Text(
              'Deskripsi:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              gor.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => _openGoogleMaps(gor.latitude, gor.longitude),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFf5f3f3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Lihat di Google Maps',
                        style: TextStyle(color: Color(0xFF142f47),fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    ClipRRect(
                      child: Image.asset(
                        'assets/images/map.png',
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Divider(
              color: Colors.grey,
              thickness: 0.1,
            ),
            const SizedBox(height: 8),
            const Text(
              'Fasilitas:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: gor.facilities.map((facility) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        getFacilityIcon(facility),
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(facility),
                    ],
                  ),
                );
              }).toList(),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.1,
            ),
            const SizedBox(height: 10),
            const Text(
              'Pilih Lapangan:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Pilih Lapangan dan Kalender
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                ),
                child: Text(
                  "Pilih Tanggal: ${DateFormat('dd MMM yyyy').format(selectedDate)}",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Tampilkan list lapangan dengan jadwal
            ListView.builder(
              itemCount: gor.fields.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final field = gor.fields[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(field.name),
                      subtitle: Text('Harga: Rp ${field.price}'),
                      trailing: Icon(Icons.arrow_drop_down),
                      onTap: () {
                        // Tampilkan jadwal lapangan
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return _buildScheduleList(field);
                          },
                        );
                      },
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
