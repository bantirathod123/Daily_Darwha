import '../models/login_model.dart';
import '../utils/SharedPreferencesManager.dart';
import 'api_service.dart';

class AuthenticationService {
  final APIService _apiService = APIService();

  Future<bool> login(String username, String password) async {
    try {
      LoginRequestModel requestModel = LoginRequestModel(
        grantType: 'password',
        username: username,
        password: password,
      );

      LoginResponseModel response = await _apiService.login(requestModel);

      if (response.accessToken != null) {
        SharedPreferencesManager sharedPreferencesManager =
            await SharedPreferencesManager.getInstance();
        await sharedPreferencesManager.setString(
            'accessToken', response.accessToken!);
        return true; // Login successful
      }
      return false; // Login failed
    } catch (e) {
      print('Login Error: $e');
      return false; // Login failed due to exception
    }
  }

  Future<void> logout() async {
    SharedPreferencesManager sharedPreferencesManager =
        await SharedPreferencesManager.getInstance();
    await sharedPreferencesManager.remove('accessToken');
  }

  Future<bool> isLoggedIn() async {
    SharedPreferencesManager sharedPreferencesManager =
        await SharedPreferencesManager.getInstance();
    final accessToken = sharedPreferencesManager.getString('accessToken');
    return accessToken != null && accessToken.isNotEmpty;
  }
}
