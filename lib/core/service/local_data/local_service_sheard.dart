import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  static late SharedPreferences _preferences;
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveToken(String token) async {
    await _preferences.setString('token', token);
  }

  static String? get token => _preferences.getString('token');
  
  static Future<void> clear() async {
    await _preferences.clear();
  }
}
