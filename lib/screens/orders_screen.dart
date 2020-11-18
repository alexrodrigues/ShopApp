import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../providers/orders_provider.dart';
import '../widgets/order_item.dart' as OrderWidget;

class OrdersScreen extends StatelessWidget {
  static const ROUTE_NAME = "OrdersScreen";

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Order>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orders.ordersData.length,
        itemBuilder: (context, index) {
          return OrderWidget.OrderItem(orders.ordersData[index]);
        },
      ),
    );
  }
}
