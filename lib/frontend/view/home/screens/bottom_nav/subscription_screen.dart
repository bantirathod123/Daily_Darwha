import 'package:flutter/material.dart';
import 'package:login_api/frontend/models/Product_model.dart';
import 'package:provider/provider.dart';

import '../widgets/SubscriptionState.dart';

class SubscriptionClass extends StatelessWidget {
  final Product product;
  final String selectedSchedule;
  final int selectedQuantity;
  final DateTime? selectedDate;

  const SubscriptionClass({
    super.key, // Added the 'Key? key' parameter
    required this.product,
    required this.selectedSchedule,
    required this.selectedQuantity,
    required this.selectedDate,
  }); // Passing 'key' to the superclass constructor

  @override
  Widget build(BuildContext context) {
    SubscriptionState subscriptionState =
        Provider.of<SubscriptionState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscriptions'),
      ),
      body: ListView.builder(
        itemCount: subscriptionState.subscriptions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(subscriptionState.subscriptions[index]),
            // You can style this or format the subscription details as needed
          );
        },
      ),
    );
  }
}
