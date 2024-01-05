import 'package:flutter/material.dart';
import 'package:login_api/frontend/view/home/screens/bottom_nav/wallets_screen.dart';

class HomeClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildCategory(context, 'Milk', [
            _buildProductItem(
              context,
              'Milk',
              'assets/images/milk.png',
              '1L',
              '\$2.99',
            ),
            _buildProductItem(
              context,
              'Skimmed Milk',
              'assets/images/skimmed_milk.jpg',
              '500ml',
              '\$1.99',
            ),
            // Add more milk products
          ]),
          // Add more non-subscription products
        ],
      ),
    );
  }

  Widget _buildCategory(
    BuildContext context,
    String categoryName,
    List<Widget> products,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            categoryName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Column(
          children: products,
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  // ... (imports and other code)

  Widget _buildProductItem(
    BuildContext context,
    String title,
    String imagePath,
    String description,
    String price,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120.0,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Description: $description',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Price: $price',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WalletClass(
                                product: null,
                                selectedSchedule: '',
                                selectedQuantity: 0,
                                selectedDate: null,
                              ),
                            ),
                          );

                          if (result == true) {
                            // Logic for adding non-subscription product to cart
                            // Example: addToShoppingBag();
                          }
                        },
                        icon: const Icon(Icons.subscriptions),
                        iconSize: 24.0,
                        color: Colors.blue,
                      ),
                      IconButton(
                        onPressed: () {
                          // Handle sharing product details
                          // ... (your logic)
                        },
                        icon: const Icon(Icons.share),
                        iconSize: 24.0,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
