import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static late SharedPreferencesManager _instance;
  static late SharedPreferences _preferences;

  SharedPreferencesManager._();

  static Future<SharedPreferencesManager> getInstance() async {
    _instance = SharedPreferencesManager._();
    _preferences = await SharedPreferences.getInstance();
    return _instance;
  }

  static SharedPreferencesManager get instance => _instance;

  Future<bool> setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  String? getString(String key) {
    return _preferences.getString(key);
  }

  Future<bool> remove(String key) async {
    return await _preferences.remove(key);
  }

  static Future<void> initialize() async {
    _instance = await SharedPreferencesManager.getInstance();
  }
}
