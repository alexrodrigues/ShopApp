import 'package:flutter/material.dart';

import '../model/product.dart';
import '../data/dummy_data.dart';

class Products with ChangeNotifier {
  List<Product> _items = dummyProductlist;

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  Product findBydid(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void add(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
