import 'package:flutter/material.dart';

import '../model/product.dart';
import '../data/dummy_data.dart';

class Products with ChangeNotifier {
  List<Product> _items = dummyProductlist;

  List<Product> get items {
    return [..._items];
  }

  void add(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
