import 'package:flutter/material.dart';

class Order {
  final String orderId;
  final String date;
  final String status;

  Order({
    required this.orderId,
    required this.date,
    required this.status,
  });
}

class OrderHistoryScreen extends StatelessWidget {
  // Sample order data
  final List<Order> orderHistory = [
    Order(orderId: '1', date: '2023-01-01', status: 'Delivered'),
    Order(orderId: '2', date: '2023-01-05', status: 'Processing'),
    Order(orderId: '3', date: '2023-01-10', status: 'Shipped'),
    // Add more orders as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: ListView.builder(
        itemCount: orderHistory.length,
        itemBuilder: (context, index) {
          final order = orderHistory[index];
          return ListTile(
            title: Text('Order ID: ${order.orderId}'),
            subtitle: Text('Date: ${order.date}, Status: ${order.status}'),
            onTap: () {
              // Handle order item tap, e.g., navigate to order details screen
              _navigateToOrderDetails(context, order);
            },
          );
        },
      ),
    );
  }

  void _navigateToOrderDetails(BuildContext context, Order order) {
    // Implement navigation logic to order details screen
    // You can pass the order details to the next screen if needed
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => OrderDetailsScreen(order: order),
      ),
    );
  }
}

class OrderDetailsScreen extends StatelessWidget {
  final Order order;

  const OrderDetailsScreen({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details - ${order.orderId}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Order ID: ${order.orderId}'),
            Text('Date: ${order.date}'),
            Text('Status: ${order.status}'),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
