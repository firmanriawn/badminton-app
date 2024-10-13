import 'package:flutter/material.dart';
import '../../models/Fields.dart';

// Detail page for fields
class FieldDetailScreen extends StatelessWidget {
  final Field field;

  const FieldDetailScreen({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          field.name,
          style: const TextStyle(color: Colors.white), // Ubah warna teks menjadi putih
        ),
        backgroundColor: const Color(0xFFf83f43), // Warna AppBar
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white, // Ubah warna tombol back menjadi putih
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                field.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              field.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              field.location,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Harga: Rp ${field.price.toStringAsFixed(0)}/jam",
              style: const TextStyle(
                fontSize: 20,
                color: Color(0xFF142f47),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF142f47), // Button color
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Booking Berhasil'),
                        content: const Text('Anda telah berhasil membooking lapangan ini.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Book Lapangan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
