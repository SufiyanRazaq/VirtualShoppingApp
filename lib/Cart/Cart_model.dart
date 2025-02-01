// cart_model.dart
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  double get totalPrice {
    return _items.fold(
      0,
      (sum, item) => sum + (item['price'] * item['quantity']),
    );
  }

  void addItem(Map<String, dynamic> item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(Map<String, dynamic> item) {
    _items.remove(item);
    notifyListeners();
  }

  void updateQuantity(int index, int quantity) {
    _items[index]['quantity'] = quantity;
    notifyListeners();
  }
}
