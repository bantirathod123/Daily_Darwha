import 'package:http/http.dart' as http;

class AuthService {
  Future<bool> loginUser(String username, String password) async {
    final String url = "https://your-api-url.com/login";

    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'username': username,
          'password': password,
        },
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Successful login
        // Save authentication token or user data in shared preferences or state management
        return true;
      } else {
        // Failed to login
        return false;
      }
    } catch (e) {
      // Handle any exception that occurs during the HTTP request
      print("Exception occurred: $e");
      return false;
    }
  }

  Future<void> logoutUser() async {
    // Logout logic
    // For example, clear saved token or user data from shared preferences or state management
    // This method should perform the logout actions
  }
}
