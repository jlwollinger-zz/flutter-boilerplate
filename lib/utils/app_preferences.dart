import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static Future<String> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.get('token');
  }
}
