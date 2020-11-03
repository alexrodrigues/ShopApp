import 'package:flutter/material.dart';

import '../model/product.dart';
import '../data/dummy_data.dart';

class Products with ChangeNotifier {
  List<Product> _items = dummyProductlist;

  List<Product> get items {
    return [..._items];
  }

  Product findBydid(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void add(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
