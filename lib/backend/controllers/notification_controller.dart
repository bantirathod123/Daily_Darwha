import 'package:flutter/material.dart';

import '../../frontend/services/notification_service.dart';
import '../models/notification_model.dart';

class NotificationController extends StatefulWidget {
  const NotificationController({super.key});

  @override
  _NotificationControllerState createState() => _NotificationControllerState();
}

class _NotificationControllerState extends State<NotificationController> {
  final NotificationService _notificationService = NotificationService();
  late Future<List<NotificationModel>> _notifications;

  @override
  void initState() {
    super.initState();
    _notifications = getNotifications();
  }

  Future<List<NotificationModel>> getNotifications() async {
    try {
      // Call your repository or service to fetch notifications
      return await _notificationService.getNotifications();
    } catch (e) {
      // Handle errors or exceptions
      // Show a snackbar or an error message accordingly
      print('Error fetching notifications: $e');
      rethrow; // Re-throwing the error to propagate it further
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: FutureBuilder<List<NotificationModel>>(
        future: _notifications,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No notifications available.'));
          } else {
            // Display the list of notifications
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final notification = snapshot.data![index];
                return ListTile(
                  title: Text(notification.title),
                  subtitle: Text(notification.content),
                  // Add onTap logic if needed
                );
              },
            );
          }
        },
      ),
    );
  }
}
