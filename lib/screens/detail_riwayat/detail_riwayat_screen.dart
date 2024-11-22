import 'package:flutter/material.dart';
import '../../models/Fields.dart';
import '../../models/Gor.dart';

class DetailRiwayatScreen extends StatelessWidget {
  final Map<String, dynamic> booking;

  DetailRiwayatScreen({required this.booking});

  @override
  Widget build(BuildContext context) {
    final Gor gor = booking['gor'];
    final Field field = booking['field'];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Riwayat Booking"),
        backgroundColor: const Color(0xFF142f47),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  field.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "${field.name} di ${gor.name}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("Lokasi: ${gor.location}", style: TextStyle(fontSize: 16)),
            const Divider(height: 24, thickness: 1),
            Text("Deskripsi GOR:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(gor.description, style: TextStyle(fontSize: 14)),
            const Divider(height: 24, thickness: 1),
            Text("Harga: Rp ${field.price.toStringAsFixed(0)}", style: TextStyle(fontSize: 16)),
            const Divider(height: 24, thickness: 1),
            Text("Tanggal: ${booking['date']}", style: TextStyle(fontSize: 16)),
            Text("Waktu: ${booking['time']}", style: TextStyle(fontSize: 16)),
            Text(
              "Status: ${booking['status']}",
              style: TextStyle(
                fontSize: 16,
                color: booking['status'] == 'Menunggu'
                    ? Colors.orange
                    : booking['status'] == 'Selesai'
                    ? Colors.green
                    : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            if (booking['status'] == 'Menunggu')
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16),
                    elevation: 4,
                    shadowColor: Colors.black26,
                  ),
                  onPressed: () {
                    // Tambahkan fungsi pembatalan booking
                  },
                  child: const Text("Batalkan Booking"),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
