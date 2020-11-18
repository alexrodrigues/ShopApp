import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import '../providers/orders_provider.dart' as OrderProvider;

class OrderItem extends StatefulWidget {
  final OrderProvider.OrderItem _order;

  OrderItem(this._order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text("\$${widget._order.amount}"),
            subtitle:
                Text(DateFormat('dd MM yyyy').format(widget._order.dateTime)),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
                height: min(
                    (widget._order.products.length * 20 + 10).toDouble(), 100),
                child: ListView(
                  children: widget._order.products
                      .map((e) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                e.title,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${e.quantitiy} x \$ ${e.price}",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ))
                      .toList(),
                ))
        ],
      ),
    );
  }
}
