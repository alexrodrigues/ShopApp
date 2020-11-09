import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/carts_provider.dart';

class CartsItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (ctx, position) {
        return Card(
          margin: EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 8.0,
          ),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(
                child: Text("\$${cart.items.values.toList()[position].price}"),
              ),
              title: Text(cart.items.values.toList()[position].title),
            ),
          ),
        );
      },
      itemCount: cart.items.length,
    );
  }
}
