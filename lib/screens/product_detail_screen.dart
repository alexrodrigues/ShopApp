import 'package:flutter/material.dart';

import '../model/product.dart';

class ProductDetailScreen extends StatelessWidget {
  static const ROUTE_NAME = "ProductDetailScreen";

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context).settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
