import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../providers/carts_provider.dart';
import '../screens/carts_screen.dart';
import '../widgets/badge.dart';
import '../widgets/product_grid_view.dart';

enum FilterOptions { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Shop"),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (FilterOptions option) {
              setState(() {
                if (option == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            itemBuilder: (ctx) {
              return [
                PopupMenuItem(
                  child: Text('Only favorites'),
                  value: FilterOptions.Favorites,
                ),
                PopupMenuItem(
                  child: Text('Show  All'),
                  value: FilterOptions.All,
                )
              ];
            },
          ),
          Consumer<Cart>(
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartsScreen.ROUTE_NAME);
              },
            ),
            builder: (ctx, cartData, extraChild) =>
                Badge(child: extraChild, value: cartData.itemsCount.toString()),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductGridView(_showOnlyFavorites),
    );
  }
}
