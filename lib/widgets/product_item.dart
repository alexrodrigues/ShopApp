import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  void goToDetails(
    BuildContext context,
    Product product,
  ) {
    Navigator.of(context).pushNamed(
      ProductDetailScreen.ROUTE_NAME,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          splashColor: Colors.purple,
          onTap: () => goToDetails(context, product),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: IconButton(
            icon: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: () {
              product.toggleFavorite();
            },
            color: Theme.of(context).accentColor,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
          backgroundColor: Colors.black87,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
