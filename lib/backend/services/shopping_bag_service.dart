// shopping_bag_service.dart

import 'package:login_api/backend/models/shopping_bag_model.dart';

import '../../frontend/repositories/shopping_bag_repository.dart';

class ShoppingBagService {
  final ShoppingBagRepository _shoppingBagRepository = ShoppingBagRepository();

  Future<List<ShoppingBagModel>> fetchShoppingBagItems() async {
    return await _shoppingBagRepository.fetchShoppingBagItems();
  }

  Future<void> addProductToBag(ShoppingBagModel product) async {
    await _shoppingBagRepository.addToShoppingBag(product);
  }

  Future<void> removeProductFromBag(int productId) async {
    await _shoppingBagRepository.removeProductFromBag(productId);
  }
}
