import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/carts_provider.dart';

class CartsScreen extends StatelessWidget {
  static const ROUTE_NAME = "CartsScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Consumer<Cart>(builder: (ctx, cartData, extraChild) {
                    return Chip(
                      label: Text("\$${cartData.totalAmount}"),
                      backgroundColor: Theme.of(context).primaryColor,
                    );
                  })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
