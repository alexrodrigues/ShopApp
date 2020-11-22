import 'package:flutter/material.dart';
import '../model/product.dart';

class UserProductItem extends StatelessWidget {
  final Product _product;

  UserProductItem(this._product);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_product.title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(_product.imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
