import 'package:flutter/material.dart';

import '../../../../../models/Product_model.dart';
import '../../bottom_nav/account_screen.dart';
import '../../bottom_nav/products_screen.dart';
import '../../bottom_nav/subscription_screen.dart';
import '../../bottom_nav/wallets_screen.dart';

class TabNavigationItem {
  final Widget page;
  final String title;
  final Icon icon;

  TabNavigationItem({
    this.page = const Placeholder(), // Default value for the page parameter
    this.title = "Default Title", // Default value for the title parameter
    required this.icon,
  });

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          icon: const Icon(Icons.home),
          title: "Home",
        ),
        TabNavigationItem(
          page: const ProductsClass(),
          icon: const Icon(Icons.shopping_cart),
          title: "Cart",
        ),
        TabNavigationItem(
          page: WalletClass(
            product: Product(
              name: "Default Product",
              imagePath: "default_image_path",
              quantity: "0",
              price: 0.0,
            ),
            selectedSchedule: '',
            selectedQuantity: 0,
            selectedDate: DateTime.now(),
          ),
          icon: const Icon(Icons.account_balance_wallet),
          title: "Wallet",
        ),
        TabNavigationItem(
          page: SubscriptionClass(
            product: Product(
              name: "Butter Milk",
              imagePath: 'assets/images/flavored_buttermilk.jpg',
              quantity: "0",
              price: 0.0,
            ),
            selectedSchedule: '',
            selectedQuantity: 0,
            selectedDate: DateTime.now(),
          ),
          icon: const Icon(Icons.subscriptions),
          title: "Subscriptions",
        ),
        TabNavigationItem(
          page: const AccountClass(),
          icon: const Icon(Icons.account_circle),
          title: "Account",
        ),
      ];
}
