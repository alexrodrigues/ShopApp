import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/carts_provider.dart';
import './providers/products_provider.dart';
import './providers/orders_provider.dart';
import './screens/carts_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/product_overview_screen.dart';
import './screens/user_products_screen.dart';
import './screens/orders_screen.dart';
import './screens/add_edit_product_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProvider.value(value: Order()),
      ],
      child: MaterialApp(
        title: 'MyShop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => ProductsOverviewScreen(),
          ProductDetailScreen.ROUTE_NAME: (ctx) => ProductDetailScreen(),
          CartsScreen.ROUTE_NAME: (ctx) => CartsScreen(),
          OrdersScreen.ROUTE_NAME: (ctx) => OrdersScreen(),
          UserProductsScreen.ROUTE_NAME: (ctx) => UserProductsScreen(),
          AddEditProductScreen.ROUTE_NAME: (ctx) => AddEditProductScreen(),
        },
      ),
    );
  }
}
