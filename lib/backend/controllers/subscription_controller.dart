import 'package:flutter/material.dart';

import '../../frontend/models/subscription_model.dart';
import '../../frontend/services/subscription_service.dart';

class SubscriptionController extends StatefulWidget {
  const SubscriptionController({Key? key}) : super(key: key);

  @override
  _SubscriptionControllerState createState() => _SubscriptionControllerState();
}

class _SubscriptionControllerState extends State<SubscriptionController> {
  final SubscriptionService _subscriptionService = SubscriptionService();
  late Future<List<SubscriptionModel>> _subscriptions;

  @override
  void initState() {
    super.initState();
    _subscriptions = _fetchSubscriptions();
  }

  Future<List<SubscriptionModel>> _fetchSubscriptions() async {
    try {
      // Fetch subscriptions from the service or repository
      return await _subscriptionService.getSubscriptions();
    } catch (e) {
      // Handle errors or exceptions
      // Show a snackbar or an error message accordingly
      print('Error fetching subscriptions: $e');
      rethrow; // Re-throwing the error to propagate it further
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscriptions'),
      ),
      body: FutureBuilder<List<SubscriptionModel>>(
        future: _subscriptions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No subscriptions available.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final subscription = snapshot.data![index];
                return ListTile(
                  title: Text(subscription.title),
                  subtitle: Text(subscription.description),
                  // Add onTap logic if needed
                );
              },
            );
          }
        },
      ),
    );
  }
}
