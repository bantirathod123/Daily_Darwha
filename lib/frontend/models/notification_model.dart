// Define the structure of a notification item in the frontend
import 'package:flutter/cupertino.dart';

class NotificationItem {
  final String title;
  final String subtitle;
  final IconData icon;

  NotificationItem({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}
