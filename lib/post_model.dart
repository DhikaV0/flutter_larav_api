class Produk {
  final int id;
  final String name;
  final String? description;
  final double price;
  final int stock;

  Produk({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    required this.stock,
  });

  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] ?? '', 
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      stock: json['stock'] as int,
    );
  }
}
