import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  static String routeName = "/help_support";

  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bantuan & Dukungan",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        backgroundColor: const Color(0xFF142f47),
        iconTheme: const IconThemeData(
          color: Colors.white, // Mengubah warna ikon back menjadi putih
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Bagaimana kami bisa membantu?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const Icon(Icons.help_outline, color: Color(0xFF142f47)),
                    title: const Text("FAQ"),
                    subtitle: const Text("Pertanyaan yang sering diajukan"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigasi ke halaman FAQ
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.chat_bubble_outline, color: Color(0xFF142f47)),
                    title: const Text("Hubungi Kami"),
                    subtitle: const Text("Dukungan langsung dengan tim kami"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigasi ke halaman kontak dukungan
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.error_outline, color: Color(0xFF142f47)),
                    title: const Text("Laporkan Masalah"),
                    subtitle: const Text("Laporkan masalah teknis"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigasi ke halaman laporan masalah
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: TextButton(
                onPressed: () {
                  // Tindakan yang diambil saat tombol Syarat & Ketentuan ditekan
                },
                child: const Text(
                  "Syarat & Ketentuan",
                  style: TextStyle(fontSize: 16, color: Color(0xFF142f47)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
