import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/carts_provider.dart';
import '../providers/orders_provider.dart';
import '../widgets/cart_items.dart';

class CartsScreen extends StatelessWidget {
  static const ROUTE_NAME = "CartsScreen";

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context);
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
                  Spacer(),
                  Chip(
                    label: Text("\$${cartData.totalAmount}"),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                      onPressed: () {
                        Provider.of<Order>(context, listen: false).addOrder(
                            cartData.items.values.toList(),
                            cartData.totalAmount);
                        cartData.clear();
                      },
                      child: Text(
                        "Checkout",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      )),
                ],
              ),
            ),
          ),
          Expanded(child: CartsItems()),
        ],
      ),
    );
  }
}
