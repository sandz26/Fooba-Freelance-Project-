import 'package:checkout/models/product.dart';
import 'package:checkout/models/pantry_item.dart';
import 'package:checkout/models/pantry.dart';
import 'package:checkout/models/app_user.dart';

class Constants {
  
  static final List<Product> dummyProducts = [
    Product(
      id: 1,
      name: 'Whole Wheat Bread',
      brand: 'Bakery Fresh',
      description: 'Healthy whole wheat bread',
      barcode: '123456789',
      price: 3.99,
      category: 'Bakery',
      imageUrl: 'https://example.com/bread.jpg',
      isPerishable: true,
    ),
    Product(
      id: 2,
      name: 'Organic Milk',
      brand: 'Green Farms',
      description: 'Fresh organic milk',
      barcode: '987654321',
      price: 4.50,
      category: 'Dairy',
      imageUrl: 'https://example.com/milk.jpg',
      isPerishable: true,
    ),
    Product(
      id: 3,
      name: 'Canned Tomatoes',
      brand: 'Harvest Best',
      description: 'Whole peeled tomatoes',
      barcode: '567891234',
      price: 2.25,
      category: 'Canned Goods',
      imageUrl: 'https://example.com/tomatoes.jpg',
      isPerishable: false,
    ),
  ];

  
  static final List<PantryItem> dummyPantryItems = [
    PantryItem(
      id: 1,
      account: '1',
      pantry: 'Main Pantry',
      name: 'Bread Stock',
      product: dummyProducts[0],
      quantity: 2,
      unit: 'loaves',
      category: 'Bakery',
      expirationDate: DateTime.now().add(Duration(days: 5)),
    ),
    PantryItem(
      id: 2,
      account: '1',
      pantry: 'Main Pantry',
      name: 'Milk Supply',
      product: dummyProducts[1],
      quantity: 3,
      unit: 'liters',
      category: 'Dairy',
      expirationDate: DateTime.now().add(Duration(days: 7)),
    ),
    PantryItem(
      id: 3,
      account: '1',
      pantry: 'Backup Pantry',
      name: 'Canned Tomatoes',
      product: dummyProducts[2],
      quantity: 5,
      unit: 'cans',
      category: 'Canned Goods',
    ),
  ];

  
  static final List<Pantry> dummyPantries = [
    Pantry(
      id: 1,
      account: '1',
      name: 'Main Pantry',
      description: 'Primary household pantry',
      isShared: false,
      pantryItems: dummyPantryItems
          .where((item) => item.pantry == 'Main Pantry')
          .toList(),
    ),
    Pantry(
      id: 2,
      account: '1',
      name: 'Backup Pantry',
      description: 'Emergency food storage',
      isShared: false,
      pantryItems: dummyPantryItems
          .where((item) => item.pantry == 'Backup Pantry')
          .toList(),
    ),
  ];

  
  static final AppUser dummyUser = AppUser(
    id: 1,
    uid: 'user123',
    idNumber: '1234567890',
    email: 'sandiepkloof@gmail.com',
    firstname: 'Sandz',
    lastname: 'Bade',
    phoneNumber: '0723271282',
    address: '123 Diepkloof Zone 3',
    nationality: 'South African',
    dateOfBirth: '1990-01-01',
    gender: 'Male',
    sourceOfFunds: 'Salary',
    isStaff: false,
    isActive: true,
    isVerified: true,
    isFicaCompliant: true,
    createdAt: DateTime.now().subtract(Duration(days: 365)),
    updatedAt: DateTime.now(),
  );
}
