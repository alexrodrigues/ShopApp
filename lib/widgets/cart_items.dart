import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/carts_provider.dart';

class CartsItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (ctx, position) {
        final id = cart.items.values.toList()[position].id;
        final keyId = cart.items.keys.toList()[position];

        return Dismissible(
          key: ValueKey(id),
          background: Container(
            color: Theme.of(context).errorColor,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.delete,
              color: Colors.white,
              size: 40,
            ),
          ),
          child: Card(
            margin: EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 8.0,
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: ListTile(
                leading: CircleAvatar(
                  child: Image.network(
                    cart.items.values.toList()[position].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(cart.items.values.toList()[position].title),
                trailing: Text(
                  "\$${cart.items.values.toList()[position].price}",
                ),
              ),
            ),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            cart.removeItem(keyId);
          },
        );
      },
      itemCount: cart.items.length,
    );
  }
}
