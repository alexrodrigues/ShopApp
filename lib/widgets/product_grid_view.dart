import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import './product_item.dart';

class ProductGridView extends StatelessWidget {
  final bool _showOnlyFavorites;

  ProductGridView(this._showOnlyFavorites);

  @override
  Widget build(BuildContext context) {
    final _productList = _showOnlyFavorites
        ? Provider.of<Products>(context).favoriteItems
        : Provider.of<Products>(context).items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (ctx, index) {
        return ChangeNotifierProvider.value(
          value: _productList[index],
          child: ProductItem(),
        );
      },
      itemCount: _productList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
