import 'package:flutter/material.dart';
import '../../models/Fields.dart';

class DetailLapanganScreen extends StatelessWidget {
  final Field field;

  const DetailLapanganScreen({Key? key, required this.field}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(field.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(field.imageUrl),
            const SizedBox(height: 16),
            Text(
              'Harga: Rp ${field.price}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Tambahkan detail tambahan di sini jika diperlukan
          ],
        ),
      ),
    );
  }
}
