// backend/models/notification_repository.dart
import '../../backend/models/notification_model.dart';
import '../../backend/services/notification_service.dart';

class NotificationRepository {
  final NotificationService _notificationService = NotificationService();

  // Method to get notifications
  Future<List<NotificationModel>> getNotifications() async {
    try {
      // Call the service to fetch notifications
      return await _notificationService.getNotifications();
    } catch (e) {
      // Handle exceptions
      print('Error fetching notifications: $e');
      throw Exception('Failed to get notifications');
    }
  }
}
