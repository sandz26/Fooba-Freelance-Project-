import 'package:checkout/models/product.dart';

class PantryItem {
  final int id;
  final String account;
  final String pantry;
  final String name;
  final Product product;
  final double quantity;
  final String unit;
  final String? category;
  final DateTime? expirationDate;

  PantryItem({
    required this.id,
    required this.account,
    required this.pantry,
    required this.name,
    required this.product,
    required this.quantity,
    required this.unit,
    this.category,
    this.expirationDate,
  });

  factory PantryItem.fromJson(Map<String, dynamic> json) {
    return PantryItem(
      id: json['id'] ?? 0,
      account: json['account'] ?? "",
      pantry: json['pantry'] ?? "",
      name: json['name'] ?? "",
      product: Product.fromJson(json['product']),
      quantity: json['quantity'] ?? 0.0,
      unit: json['unit'] ?? "",
      category: json['category'] ?? "",
      expirationDate: json['expiration_date'] != null
          ? DateTime.parse(json['expiration_date'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'account_id': account,
      'name': name,
      'product': product,
      'quantity': quantity,
      'unit': unit,
      'category': category,
      'expiration_date': expirationDate?.toIso8601String(),
    };
  }
}
