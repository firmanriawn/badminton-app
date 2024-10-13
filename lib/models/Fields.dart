// Data model for fields
class Field {
  final String name;
  final String location;
  final String imageUrl;
  final double price;
  final List<String> facilities;

  Field({
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.price,
    required this.facilities,
  });
}

// Sample data for fields
final List<Field> fields = [
  Field(
    name: "Lapangan A",
    location: "Jl. Sudirman No. 1",
    imageUrl: "assets/images/lapangan1.jpg",
    price: 150000,
    facilities: ["Wifi", "Parkir", "Loker"],
  ),
  Field(
    name: "Lapangan B",
    location: "Jl. Thamrin No. 2",
    imageUrl: "assets/images/lapangan2.jpg",
    price: 200000,
    facilities: ["Wifi", "Kantin"],
  ),
  Field(
    name: "Lapangan C",
    location: "Jl. Gatot Subroto No. 3",
    imageUrl: "assets/images/lapangan3.jpg",
    price: 180000,
    facilities: ["Parkir", "Loker", "Kantin"],
  ),
];