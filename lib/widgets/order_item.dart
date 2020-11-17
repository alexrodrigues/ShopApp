import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../providers/orders_provider.dart' as OrderProvider;

class OrderItem extends StatelessWidget {
  final OrderProvider.OrderItem _order;

  OrderItem(this._order);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text("\$${_order.amount}"),
            subtitle: Text(DateFormat('dd MM yyyy').format(_order.dateTime)),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
