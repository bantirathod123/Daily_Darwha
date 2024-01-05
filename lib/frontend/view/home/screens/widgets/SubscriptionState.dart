import 'package:flutter/material.dart';

class SubscriptionState extends ChangeNotifier {
  // Create your subscription state here
  List<String> subscriptions = [];

  // Method to add a subscription
  void addSubscription(String subscription) {
    subscriptions.add(subscription);
    notifyListeners(); // Notify listeners about the change
  }

  // Method to remove a subscription
  void removeSubscription(String subscription) {
    subscriptions.remove(subscription);
    notifyListeners(); // Notify listeners about the change
  }
}
