import 'package:flutter/material.dart';

class ListLapangan extends StatelessWidget {
  // Daftar lapangan dengan detail informasi
  final List<Map<String, String>> lapanganList = [
    {
      'nama': 'Lapangan A',
      'lokasi': 'Jl. Mawar No. 5',
      'harga': 'Rp 100,000 / jam',
      'status': 'Tersedia',
    },
    {
      'nama': 'Lapangan B',
      'lokasi': 'Jl. Melati No. 12',
      'harga': 'Rp 120,000 / jam',
      'status': 'Tidak Tersedia',
    },
    {
      'nama': 'Lapangan C',
      'lokasi': 'Jl. Anggrek No. 8',
      'harga': 'Rp 150,000 / jam',
      'status': 'Tersedia',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: lapanganList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ListTile(
              title: Text(
                lapanganList[index]['nama'] ?? 'Lapangan',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Lokasi: ${lapanganList[index]['lokasi'] ?? ''}'),
                  Text('Harga: ${lapanganList[index]['harga'] ?? ''}'),
                  Text(
                    'Status: ${lapanganList[index]['status'] ?? ''}',
                    style: TextStyle(
                      color: lapanganList[index]['status'] == 'Tersedia'
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                ],
              ),
              trailing: lapanganList[index]['status'] == 'Tersedia'
                  ? ElevatedButton(
                onPressed: () {
                  // Aksi saat tombol booking ditekan
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Booking Lapangan'),
                        content: Text(
                            'Apakah Anda ingin memesan ${lapanganList[index]['nama']}?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Batal'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              // Logika booking lapangan bisa ditambahkan di sini
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Berhasil memesan ${lapanganList[index]['nama']}!'),
                                ),
                              );
                            },
                            child: Text('Pesan'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Booking'),
              )
                  : null,
            ),
          );
        },
      ),
    );
  }
}
