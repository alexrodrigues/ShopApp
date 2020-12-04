import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
    const url =
        "https://flutter-shopping-app-dc453.firebaseio.com/products.json";
    http
        .post(
      url,
      body: json.encode({
        'title': product.title,
        'description': product.description,
        'imageUrl': product.imageUrl,
        'id': product.id,
        'isFavorite': product.isFavorite,
      }),
    )
        .then((value) {
      final newProduct = Product(
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        id: DateTime.now().toString(),
      );
      _items.add(newProduct);
      // _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
    });
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
