import 'package:flutter/material.dart';
import '../../models/Gor.dart';
import '../detail_lapangan/detail_lapangan_screen.dart';

class GorDetailScreen extends StatelessWidget {
  final Gor gor;

  const GorDetailScreen({Key? key, required this.gor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF142f47), // Ganti warna AppBar jika perlu
        title: Text(
          gor.name,
          style: const TextStyle(fontSize: 20, color: Colors.white), // Ukuran font 20 dan warna putih
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, // Mengubah warna ikon menjadi putih
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nama GOR
            Text(
              gor.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Lokasi GOR
            Text(
              gor.location,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            // Gambar lapangan pertama
            if (gor.fields.isNotEmpty) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  gor.fields[0].imageUrl, // Gambar dari lapangan pertama
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
            ],
            // Fasilitas GOR
            Text(
              'Fasilitas: ${gor.facilities.join(', ')}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Daftar Lapangan:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Daftar lapangan
            ListView.builder(
              itemCount: gor.fields.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final field = gor.fields[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: Image.asset(
                      field.imageUrl,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(field.name),
                    subtitle: Text('Harga: Rp ${field.price}'),
                    onTap: () {
                      // Navigasi ke halaman detail lapangan
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailLapanganScreen(field: field),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}