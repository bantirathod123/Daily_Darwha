// shopping_bag_controller.dart

import 'package:login_api/backend/models/shopping_bag_model.dart'
    as BackendShoppingBagModel;

import '../../frontend/models/shopping_bag_model.dart';
import '../services/shopping_bag_service.dart';

class ShoppingBagController {
  final ShoppingBagService _shoppingBagService = ShoppingBagService();

  Future<List<BackendShoppingBagModel.ShoppingBagModel>>
      getShoppingBagItems() async {
    return await _shoppingBagService.fetchShoppingBagItems();
  }

  Future<void> addToShoppingBag(ShoppingBagModel product) async {
    await _shoppingBagService
        .addProductToBag(product as BackendShoppingBagModel.ShoppingBagModel);
  }

  Future<void> removeFromShoppingBag(int productId) async {
    await _shoppingBagService.removeProductFromBag(productId);
  }
}
