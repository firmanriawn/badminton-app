import 'Fields.dart';

class Gor {
  final String name; // Nama GOR
  final String location; // Lokasi GOR
  final String description; // Deskripsi GOR
  final double latitude; // Titik koordinat latitude
  final double longitude; // Titik koordinat longitude
  final List<String> facilities; // Daftar fasilitas yang dimiliki oleh GOR
  final List<Field> fields; // Daftar lapangan di GOR

  Gor({
    required this.name,
    required this.location,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.facilities,
    required this.fields,
  });
}

// Contoh data untuk beberapa GOR
final List<Gor> gors = [
  Gor(
    name: "GOR Jaya Sakti",
    location: "Jl. Sudirman No. 1",
    description: "GOR dengan fasilitas lengkap dan lapangan berkualitas tinggi. Cocok untuk berbagai acara olahraga.",
    latitude: -6.200000, // contoh koordinat
    longitude: 106.816666,
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
    name: "GOR Cahaya Bakti",
    location: "Jl. Thamrin No. 2",
    description: "GOR dengan lapangan standar internasional dan fasilitas yang nyaman untuk atlet.",
    latitude: -6.210000,
    longitude: 106.820000,
    facilities: ["Wifi", "Parkir", "Kantin", "Loker"],
    fields: [
      Field(
        name: "Lapangan C",
        imageUrl: "assets/images/lapangan3.jpg",
        price: 180000,
      ),
      Field(
        name: "Lapangan D",
        imageUrl: "assets/images/lapangan4.jpg",
        price: 220000,
      ),
    ],
  ),
];
