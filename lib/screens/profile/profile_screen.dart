import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/ProfileBg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                // Geser CircleAvatar dan informasi pengguna ke kiri dan ke bawah
                Transform.translate(
                  offset: const Offset(-103, 18), // Geser 20px ke kiri dan 10px ke bawah
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/icons/man.png"), // Ganti dengan path gambar profil
                  ),
                ),
                const SizedBox(height: 35),
                // Nama pengguna
                Transform.translate(
                  offset: const Offset(-80, 10), // Geser 20px ke kiri dan 10px ke bawah
                  child: const Text(
                    "Nama Pengguna",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Email pengguna
                Transform.translate(
                  offset: const Offset(-80, 10), // Geser 20px ke kiri dan 10px ke bawah
                  child: const Text(
                    "email@example.com",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Nomor telepon pengguna
                Transform.translate(
                  offset: const Offset(-80, 10), // Geser 20px ke kiri dan 10px ke bawah
                  child: const Text(
                    "+62 812 3456 7890",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Tombol Edit Profil
                // ElevatedButton(
                //   onPressed: () {
                //     // Aksi saat tombol Edit Profil ditekan
                //   },
                //   style: ElevatedButton.styleFrom(
                //     padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                //     backgroundColor: Colors.green[700],
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(30),
                //     ),
                //   ),
                //   child: const Text(
                //     "Edit Profil",
                //     style: TextStyle(fontSize: 18),
                //   ),
                // ),
                const SizedBox(height: 30),
                // Bagian menu lainnya
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      // Riwayat Pemesanan
                      ListTile(
                        leading: const Icon(Icons.history, color: Color(0xFF142f47)),
                        title: const Text("Riwayat Pemesanan"),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Navigasi ke halaman riwayat pemesanan
                        },
                      ),
                      const Divider(),
                      // Preferensi
                      ListTile(
                        leading: const Icon(Icons.settings, color: Color(0xFF142f47)),
                        title: const Text("Preferensi"),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Navigasi ke halaman preferensi
                        },
                      ),
                      const Divider(),
                      // Pengaturan Akun
                      ListTile(
                        leading: const Icon(Icons.person, color: Color(0xFF142f47)),
                        title: const Text("Pengaturan Akun"),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Navigasi ke halaman pengaturan akun
                        },
                      ),
                      const Divider(),
                      // Bantuan & Dukungan
                      ListTile(
                        leading: const Icon(Icons.help, color: Color(0xFF142f47)),
                        title: const Text("Bantuan & Dukungan"),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Navigasi ke halaman bantuan & dukungan
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // Tombol Logout
                ElevatedButton(
                  onPressed: () {
                    // Aksi saat tombol Logout ditekan
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    backgroundColor: Colors.red[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Logout",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
