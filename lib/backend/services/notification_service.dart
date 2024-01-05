// frontend/services/notification_service.dart
import '../models/notification_model.dart';

class NotificationService {
  // Example method to fetch notifications from the backend
  Future<List<NotificationModel>> getNotifications() async {
    // Simulated data for example
    return Future.delayed(const Duration(seconds: 2), () {
      return [
        NotificationModel(
          id: 1,
          title: 'New Message',
          content: 'You have a new message.',
        ),
        NotificationModel(
          id: 2,
          title: 'Reminder',
          content: 'Don\'t forget your appointment today!',
        ),
        NotificationModel(
          id: 3,
          title: 'Special Offer',
          content: 'Exclusive discounts await you.',
        ),
      ];
    });
  }

// Your other methods...
}
