import 'package:shared_preferences/shared_preferences.dart';

class UserSession {
  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }

  static Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('id');

    // ✅ Debug prints (only in debug mode)
    final id = prefs.getString('id');

    print("🧹 Session cleared");
    print("User ID after clear: $id"); // should be null
  }
}
