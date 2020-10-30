import 'package:flutter/material.dart';

import '../model/product.dart';
import '../data/dummy_data.dart';
import '../widgets/product_item.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final List<Product> _productList = dummyProductlist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Shop"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (ctx, index) {
          return ProductItem(_productList[index]);
        },
        itemCount: _productList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
