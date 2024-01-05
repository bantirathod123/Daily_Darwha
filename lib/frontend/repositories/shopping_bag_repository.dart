import 'package:uuid/uuid.dart';

import '../../backend/models/shopping_bag_model.dart';

class ShoppingBagRepository {
  final Uuid _uuid = Uuid();
  final List<ShoppingBagModel> _shoppingBagItems = [];

  // Example method to generate a unique ID
  String _generateUniqueId() {
    return _uuid.v4(); // Generate a version 4 (random) UUID
  }

  Future<List<ShoppingBagModel>> fetchShoppingBagItems() async {
    // Perform fetching logic here, like API calls or database queries
    // For example purposes, returning the in-memory list
    return _shoppingBagItems;
  }

  Future<void> addToShoppingBag(ShoppingBagModel item) async {
    // Assuming you want to add the item to the in-memory list
    item.id = _generateUniqueId(); // Generate a unique ID for the new item
    _shoppingBagItems.add(item);
  }

  Future<void> removeProductFromBag(int productId) async {
    // Assuming you want to remove the item from the in-memory list based on productId
    _shoppingBagItems.removeWhere((item) => item.id == productId.toString());
  }

// Other methods related to managing shopping bag items
}
