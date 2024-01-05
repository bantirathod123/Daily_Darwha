import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../backend/models/shopping_bag_model.dart';
import '../widgets/ShoppingBagState.dart';

class ProductsClass extends StatelessWidget {
  const ProductsClass({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildCategory(context, 'Curd', [
            _buildProductItem(context, 'Plain Curd', 'assets/images/curd.png',
                '500g', '\$1.49'),
            _buildProductItem(context, 'Flavored Curd',
                'assets/images/flavored_curd.jpg', '250g', '\$0.99'),
            // Add more curd products
          ]),
          _buildCategory(context, 'Paneer', [
            _buildProductItem(context, 'Regular Paneer',
                'assets/images/paneer.jpeg', '200g', '\$3.49'),
            _buildProductItem(context, 'Low-Fat Paneer',
                'assets/images/low_fat_paneer.jpg', '200g', '\$2.99'),
            // Add more paneer products
          ]),
          _buildCategory(context, 'Ghee', [
            _buildProductItem(context, 'Pure Ghee', 'assets/images/ghee.jpg',
                '500ml', '\$5.99'),
            _buildProductItem(context, 'Organic Ghee',
                'assets/images/organic_ghee.jpg', '500ml', '\$6.49'),
            // Add more ghee products
          ]),
          _buildCategory(context, 'Desserts', [
            _buildProductItem(context, 'Chocolate Cake',
                'assets/images/chocolate_cake.jpg', '500g', '\$12.99'),
            _buildProductItem(context, 'Fruit Pudding',
                'assets/images/fruit_pudding.jpg', '400g', '\$9.99'),
            // Add more dessert products
          ]),
          _buildCategory(context, 'Butter', [
            _buildProductItem(context, 'Salted Butter',
                'assets/images/salted_butter.jpg', '250g', '\$1.99'),
            _buildProductItem(context, 'Unsalted Butter',
                'assets/images/unsalted_butter.jpg', '250g', '\$2.49'),
            // Add more butter products
          ]),
          _buildCategory(context, 'Buttermilk', [
            _buildProductItem(context, 'Traditional Buttermilk',
                'assets/images/traditional_buttermilk.jpg', '1L', '\$2.49'),
            _buildProductItem(context, 'Flavored Buttermilk',
                'assets/images/flavored_buttermilk.jpg', '1L', '\$2.99'),
            // Add more buttermilk products
          ]),
          // Add other categories and products similarly
        ],
      ),
    );
  }
}

Widget _buildCategory(
    BuildContext context, String categoryName, List<Widget> products) {
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

Widget _buildProductItem(
  BuildContext context,
  String title,
  String imagePath,
  String weight,
  String price,
) {
  final shoppingBagState = Provider.of<ShoppingBagState>(context);

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
                  'weight: $weight',
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
                      onPressed: () {
                        shoppingBagState.addToShoppingBag(
                          ShoppingBagModel(
                            productName: title,
                            imagePath: imagePath,
                            weight: weight,
                            price: double.parse(price.substring(1)),
                            quantity: 1,
                            id: '',
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Item added to shopping bag'),
                          ),
                        );
                      },
                      icon: const Icon(Icons.shopping_cart),
                      iconSize: 24.0,
                      color: Colors.blue,
                    ),
                    IconButton(
                      onPressed: () {
                        // Handle share button tap
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
