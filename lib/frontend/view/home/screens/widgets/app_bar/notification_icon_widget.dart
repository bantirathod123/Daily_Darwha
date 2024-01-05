import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildNotificationItem(
              title: 'New Message',
              subtitle: 'You have a new message.',
              icon: Icons.message,
            ),
            const SizedBox(height: 16),
            _buildNotificationItem(
              title: 'Reminder',
              subtitle: 'Don\'t forget your appointment today!',
              icon: Icons.event,
            ),
            const SizedBox(height: 16),
            _buildNotificationItem(
              title: 'Special Offer',
              subtitle: 'Exclusive discounts await you.',
              icon: Icons.local_offer,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        onTap: () {
          // Handle notification item tap
          _showNotificationDetails(title, subtitle);
        },
      ),
    );
  }

  void _showNotificationDetails(String title, String details) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(details),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
