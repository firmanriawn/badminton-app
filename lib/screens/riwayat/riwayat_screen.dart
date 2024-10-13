import 'package:flutter/material.dart';

class RiwayatScreen extends StatefulWidget {
  RiwayatScreen({super.key});

  @override
  _RiwayatScreenState createState() => _RiwayatScreenState();
}

class _RiwayatScreenState extends State<RiwayatScreen> {
  final List<Map<String, String>> bookingHistory = [
    {"date": "2024-09-25", "time": "10:00 AM - 12:00 PM", "court": "Lapangan A", "image": "assets/images/lapangan1.jpg", "status": "Selesai"},
    {"date": "2024-09-27", "time": "02:00 PM - 04:00 PM", "court": "Lapangan B", "image": "assets/images/lapangan2.jpg", "status": "Dibatalkan"},
    {"date": "2024-10-01", "time": "06:00 PM - 08:00 PM", "court": "Lapangan C", "image": "assets/images/lapangan3.jpg", "status": "Menunggu"},
  ];

  List<Map<String, String>> filteredHistory = [];
  String filterType = "All";
  String filterValue = "";

  @override
  void initState() {
    super.initState();
    filteredHistory = bookingHistory; // Default: tampilkan semua riwayat
  }

  void filterHistory() {
    setState(() {
      if (filterType == "All") {
        filteredHistory = bookingHistory;
      } else if (filterType == "Tanggal") {
        filteredHistory = bookingHistory
            .where((booking) => booking['date']!.contains(filterValue))
            .toList();
      } else if (filterType == "Lapangan") {
        filteredHistory = bookingHistory
            .where((booking) => booking['court']!.contains(filterValue))
            .toList();
      } else if (filterType == "Status") {
        filteredHistory = bookingHistory
            .where((booking) => booking['status']!.contains(filterValue))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Menghilangkan back button
        title: const Text(
          "Riwayat Booking Lapangan",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              letterSpacing: 1.5,
              color: Colors.white),
        ),
        backgroundColor: const Color(0xFF142f47),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                // Dropdown untuk memilih jenis filter
                DropdownButton<String>(
                  value: filterType,
                  items: <String>['All', 'Tanggal', 'Lapangan', 'Status']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      filterType = newValue!;
                      filterValue = ""; // Reset nilai filter saat ganti jenis filter
                      filterHistory();
                    });
                  },
                ),
                const SizedBox(width: 16),
                // TextField untuk input nilai filter
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: filterType == "All" ? "Filter tidak aktif" : "Masukkan $filterType",
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    onChanged: (value) {
                      setState(() {
                        filterValue = value;
                        filterHistory();
                      });
                    },
                    enabled: filterType != "All", // Disable jika All dipilih
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredHistory.length,
              itemBuilder: (context, index) {
                final booking = filteredHistory[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.grey[100]!, Colors.grey[300]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(2, 4),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blueGrey[600]!),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            booking['image']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        "Lapangan: ${booking['court']}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey[900],
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          "Tanggal: ${booking['date']}\nWaktu: ${booking['time']}\nStatus: ${booking['status']}",
                          style: TextStyle(color: Colors.blueGrey[800]),
                        ),
                      ),
                      trailing: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blueGrey[600]!),
                        ),
                        child: Icon(Icons.arrow_forward_ios, color: Colors.blueGrey[600]),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
