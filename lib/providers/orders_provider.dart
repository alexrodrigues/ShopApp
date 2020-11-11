import 'package:flutter/foundation.dart';

import '../providers/carts_provider.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem(
    this.id,
    this.amount,
    this.products,
    this.dateTime,
  );
}

class Order with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> products, double total) {
    final dateTime = DateTime.now();
    _orders.insert(
        0,
        OrderItem(
          dateTime.toString(),
          total,
          products,
          dateTime,
        ));

    notifyListeners();
  }
}
