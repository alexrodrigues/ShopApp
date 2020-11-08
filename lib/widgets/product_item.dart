import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';
import '../screens/product_detail_screen.dart';
import '../providers/carts_provider.dart';

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
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    // nao precisa ser a raiz pode ser so o widget que voce quer ouvir
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
              cart.addItem(
                product.id,
                product.title,
                product.price,
              );
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
