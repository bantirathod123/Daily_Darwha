import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bottom_nav/wallets_screen.dart';
import '../ShoppingBagState.dart';

class ShoppingBag extends StatelessWidget {
  const ShoppingBag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('ShoppingBag Widget Rebuilt');
    final shoppingBagState = Provider.of<ShoppingBagState>(context);

    print('Items in shopping bag: ${shoppingBagState.shoppingBagItems.length}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Bag'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<ShoppingBagState>(
              builder: (context, shoppingBagState, child) {
                print(
                    'Items in shopping bag: ${shoppingBagState.shoppingBagItems.length}');
                return shoppingBagState.shoppingBagItems.isEmpty
                    ? const Center(child: Text('Your shopping bag is empty.'))
                    : ListView.builder(
                        itemCount: shoppingBagState.shoppingBagItems.length,
                        itemBuilder: (context, index) {
                          final product =
                              shoppingBagState.shoppingBagItems[index];

                          return Card(
                            margin: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.productName),
                                  Text(
                                    'Price: \$${product.price.toStringAsFixed(2)}',
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      shoppingBagState
                                          .decreaseQuantity(product);
                                    },
                                  ),
                                  Text(product.quantity
                                      .toString()), // Display quantity
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      shoppingBagState
                                          .increaseQuantity(product);
                                    },
                                  ),
                                ],
                              ),
                              subtitle: Text(
                                'Total: \$${(product.price * product.quantity).toStringAsFixed(2)}',
                              ),
                              onTap: () {
                                // Implement tapping on the product tile if needed
                              },
                              onLongPress: () {
                                // Implement long press on the product tile if needed
                              },
                            ),
                          );
                        },
                      );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WalletClass(
                    product: null,
                    selectedSchedule: '',
                    selectedQuantity: 0,
                    selectedDate: null,
                    // Pass the necessary parameters here
                  ),
                ),
              );
            },
            child: const Text('Proceed to Payment'),
          ),
        ], // Removed the extra comma here
      ),
    );
  }
}
