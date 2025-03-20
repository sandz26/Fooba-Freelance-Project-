class Product {
  final int id;
  final String name;
  final String? description;
  final String? brand;
  final String? barcode;
  final double? price;
  final String? category;
  final String? imageUrl;
  final String? nutritionalInfo;
  final bool isPerishable;

  Product({
    required this.id,
    required this.name,
    this.description,
    this.brand,
    this.barcode,
    this.price,
    this.category,
    this.imageUrl,
    this.nutritionalInfo,
    this.isPerishable = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      description: json['description'],
      brand: json['brand'],
      barcode: json['barcode'],
      price: (json['price'] is num) ? json['price'].toDouble() : null,
      category: json['category'],
      imageUrl: json['image_url'],
      nutritionalInfo: json['nutritional_info'],
      isPerishable: json['is_perishable'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'brand': brand,
      'barcode': barcode,
      'price': price,
      'category': category,
      'image_url': imageUrl,
      'nutritional_info': nutritionalInfo,
      'is_perishable': isPerishable,
    };
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name, brand: $brand)';
  }
}
