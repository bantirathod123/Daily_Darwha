import 'package:flutter/material.dart';

import '../../../../utils/SharedPreferencesManager.dart';
import '../account/delivery_address_screen.dart';
import '../account/help_support_screen.dart';
import '../account/order_history_screen.dart';
import '../account/personal_details_screen.dart';

class AccountClass extends StatelessWidget {
  const AccountClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSectionHeader(context, 'Personal Details', Icons.person),
            _buildListItem(
              title: 'View Personal Details',
              onTap: () {
                // Navigate to personal details screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PersonalDetailsScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
            _buildSectionHeader(context, 'Delivery Address', Icons.location_on),
            _buildListItem(
              title: 'View Delivery Address',
              onTap: () {
                // Navigate to delivery address screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DeliveryAddressScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
            _buildSectionHeader(context, 'Order History', Icons.history),
            _buildListItem(
              title: 'View Order History',
              onTap: () {
                // Navigate to order history screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderHistoryScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
            _buildSectionHeader(context, 'Help & Support', Icons.help),
            _buildListItem(
              title: 'Get Help & Support',
              onTap: () {
                // Navigate to help & support screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpSupportScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
            _buildLogoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
      BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem({required String title, required VoidCallback onTap}) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // Clear user session by removing the 'isLoggedIn' key
        await SharedPreferencesManager.instance.remove('isLoggedIn');

        // Navigate to the login screen and pop all routes
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/login',
          (Route<dynamic> route) => false,
        );
      },
      child: const Text('Logout'),
    );
  }
}
