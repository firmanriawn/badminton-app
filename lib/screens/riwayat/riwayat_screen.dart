import 'package:flutter/material.dart';
import '../../models/Fields.dart';
import '../../models/Gor.dart';
import '../detail_riwayat/detail_riwayat_screen.dart';


class RiwayatScreen extends StatefulWidget {
  @override
  _RiwayatScreenState createState() => _RiwayatScreenState();
}

class _RiwayatScreenState extends State<RiwayatScreen> {
  final List<Map<String, dynamic>> bookingHistory = [
    {
      "date": "2024-09-25",
      "time": "10:00 AM - 12:00 PM",
      "gor": gors[0],
      "field": gors[0].fields[0],
      "status": "Selesai"
    },
    {
      "date": "2024-09-27",
      "time": "02:00 PM - 04:00 PM",
      "gor": gors[1],
      "field": gors[1].fields[0],
      "status": "Dibatalkan"
    },
    {
      "date": "2024-10-01",
      "time": "06:00 PM - 08:00 PM",
      "gor": gors[0],
      "field": gors[0].fields[1],
      "status": "Menunggu"
    },
  ];

  List<Map<String, dynamic>> filteredHistory = [];
  String filterType = "All";
  String filterValue = "";

  @override
  void initState() {
    super.initState();
    filteredHistory = bookingHistory;
  }

  void filterHistory() {
    setState(() {
      if (filterType == "All") {
        filteredHistory = bookingHistory;
      } else if (filterType == "Tanggal") {
        filteredHistory = bookingHistory
            .where((booking) => booking['date']!.contains(filterValue))
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
        title: const Text("Riwayat Booking Lapangan"),
        backgroundColor: const Color(0xFF142f47),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                DropdownButton<String>(
                  value: filterType,
                  items: <String>['All', 'Tanggal', 'Status']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      filterType = newValue!;
                      filterValue = "";
                      filterHistory();
                    });
                  },
                ),
                const SizedBox(width: 16),
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
                    enabled: filterType != "All",
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredHistory.length,
              itemBuilder: (context, index) {
                final booking = filteredHistory[index];
                final gor = booking['gor'] as Gor;
                final field = booking['field'] as Field;

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              field.imageUrl,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${field.name} di ${gor.name}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text("Tanggal: ${booking['date']}"),
                                Text("Waktu: ${booking['time']}"),
                                Text(
                                  "Status: ${booking['status']}",
                                  style: TextStyle(
                                    color: booking['status'] == 'Menunggu'
                                        ? Colors.orange
                                        : booking['status'] == 'Selesai'
                                        ? Colors.green
                                        : Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 20, thickness: 1),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailRiwayatScreen(booking: booking),
                              ),
                            );
                          },
                          child: const Text(
                            "Lihat Detail",
                            style: TextStyle(
                              color: Color(0xFF142f47),
                            ),
                          ),
                        ),
                      ),
                    ],
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
