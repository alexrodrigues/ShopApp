import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';
import '../providers/carts_provider.dart';
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

  void addItem(BuildContext context, Product product) {
    final cart = Provider.of<Cart>(context, listen: false);
    cart.addItem(
      product.id,
      product.title,
      product.imageUrl,
      product.price,
    );
    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("add item to cart"),
      action: SnackBarAction(
        label: "Undo",
        onPressed: () {
          cart.removeSingleItem(product.id);
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Stack(
          children: [
            Positioned.fill(
                child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            )),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  splashColor: Theme.of(context).accentColor,
                  onTap: () => goToDetails(context, product),
                ),
              ),
            ),
          ],
        ),
        footer: GridTileBar(
          leading: Consumer<Product>(builder: (ctx, product, child) {
            return IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              onPressed: () {
                product.toggleFavorite();
              },
              color: Theme.of(context).accentColor,
            );
          }),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              addItem(context, product);
            },
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
