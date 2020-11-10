import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final String imageUrl;
  final int quantitiy;
  final double price;

  CartItem(
    this.id,
    this.title,
    this.imageUrl,
    this.quantitiy,
    this.price,
  );
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items != null ? _items.length : 0;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quantitiy;
    });

    return total;
  }

  void addItem(String productId, String title, String imageUrl, double price) {
    if (_items.containsKey(productId)) {
      // change the quantity
      _items.update(
        productId,
        (value) => CartItem(value.id, value.title, value.imageUrl,
            value.quantitiy + 1, value.price),
      );
    } else {
      _items.putIfAbsent(productId, () {
        final String id = DateTime.now().toString();
        return CartItem(id, title, imageUrl, 1, price);
      });
    }

    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);

    notifyListeners();
  }
}
