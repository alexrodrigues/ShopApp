import 'package:flutter/material.dart';

import '../model/product.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final Product _product;

  ProductItem(this._product);

  void goToDetails(BuildContext context) {
    Navigator.of(context).pushNamed(
      ProductDetailScreen.ROUTE_NAME,
      arguments: this._product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: InkWell(
          onTap: () => goToDetails(context),
          child: Image.network(
            _product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
          backgroundColor: Colors.black87,
          title: Text(
            _product.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
