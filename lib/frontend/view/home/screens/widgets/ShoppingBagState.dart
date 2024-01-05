import 'package:flutter/material.dart';

import '../../../../../backend/models/shopping_bag_model.dart';

class ShoppingBagState extends ChangeNotifier {
  static final ShoppingBagState _instance = ShoppingBagState._internal();
  List<ShoppingBagModel> shoppingBagItems = [];

  factory ShoppingBagState() {
    return _instance;
  }

  ShoppingBagState._internal();

  void addToShoppingBag(ShoppingBagModel product) {
    print('Before: $shoppingBagItems');
    // Check if the product is already in the shopping bag
    final existingProductIndex = shoppingBagItems
        .indexWhere((p) => p.productName == product.productName);

    if (existingProductIndex != -1) {
      // Product already exists, increase its quantity
      shoppingBagItems[existingProductIndex].quantity += 1;
    } else {
      // Product does not exist, add it to the shopping bag
      shoppingBagItems.add(product);
    }
    print('After: $shoppingBagItems');

    notifyListeners();
    print('Items in shopping bag: ${shoppingBagItems.length}');
    print(
        'Added product: ${product.productName}, Quantity: ${product.quantity}');
  }

  void decreaseQuantity(ShoppingBagModel product) {
    if (product.quantity > 1) {
      product.quantity -= 1;
    } else {
      // If quantity is 1, remove the product from the shopping bag
      shoppingBagItems.remove(product);
    }

    notifyListeners();
  }

  void increaseQuantity(ShoppingBagModel product) {
    product.quantity += 1;
    notifyListeners();
  }

  void removeItem(ShoppingBagModel product) {
    shoppingBagItems.remove(product);
    notifyListeners();
  }

// Other methods related to shopping bag state management
}
