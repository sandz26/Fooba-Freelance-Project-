import 'package:checkout/models/pantry_item.dart';
import 'package:checkout/models/app_user.dart';

class Pantry {
  final int id;
  final String account;
  final String name;
  final String? description;
  final bool isShared;
  final List<PantryItem> pantryItems;
  final List<AppUser> sharedWith;

  Pantry({
    required this.id,
    required this.account,
    required this.name,
    this.description,
    this.isShared = false,
    this.sharedWith = const [],
    required this.pantryItems,
  });

  factory Pantry.fromJson(Map<String, dynamic> json) {
    return Pantry(
      id: json['id'],
      account: json['account'] ?? "",
      name: json['name'],
      description: json['description'],
      isShared: json['is_shared'] ?? false,
      sharedWith: (json['shared_with'] as List<dynamic>?)
              ?.map((user) => AppUser.fromJson(user))
              .toList() ??
          [],
      pantryItems: (json['pantryItems'] as List<dynamic>?)
              ?.map((items) => PantryItem.fromJson(items))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'account': account,
      'name': name,
      'description': description,
      'is_shared': isShared,
      'shared_with': sharedWith.map((user) => user.toJson()).toList(),
    };
  }
}
