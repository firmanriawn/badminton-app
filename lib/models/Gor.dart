import 'Fields.dart';

class Gor {
  final String name;
  final String location;
  final List<String> facilities; // Fasilitas yang dimiliki GOR
  final List<Field> fields; // Daftar lapangan di GOR

  Gor({
    required this.name,
    required this.location,
    required this.facilities,
    required this.fields,
  });
}

// Contoh data untuk GOR
final List<Gor> gors = [
  Gor(
    name: "GOR Sudirman",
    location: "Jl. Sudirman No. 1",
    facilities: ["Wifi", "Parkir", "Kantin"], // Fasilitas GOR
    fields: [
      Field(
        name: "Lapangan A",
        imageUrl: "assets/images/lapangan1.jpg",
        price: 150000,
      ),
      Field(
        name: "Lapangan B",
        imageUrl: "assets/images/lapangan2.jpg",
        price: 200000,
      ),
    ],
  ),
  Gor(
    name: "GOR Thamrin",
    location: "Jl. Thamrin No. 2",
    facilities: ["Wifi", "Parkir", "Kantin", "Loker"], // Fasilitas GOR
    fields: [
      Field(
        name: "Lapangan C",
        imageUrl: "assets/images/lapangan3.jpg",
        price: 180000,
      ),
      Field(
        name: "Lapangan D",
        imageUrl: "assets/images/lapangan2.jpg",
        price: 220000,
      ),
    ],
  ),
];
