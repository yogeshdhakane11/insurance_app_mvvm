import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart'; // use kDebugMode here
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../repositories/auth_repository.dart';
import '../../../utils/utils.dart';
import '../../dashboard/screen/dashboard_screen.dart';

class LoginViewmodel extends ChangeNotifier {
  // Declare AuthRepository create object
  final AuthRepository _authRepository = AuthRepository();

  // Declare loading
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  // API call
  Future<void> loginApi(dynamic body, BuildContext context) async {
    setLoading(true);
    try {
      print('Body Payload: $body');
      final response = await _authRepository.loginApi(body);
      setLoading(false);

      if (response['message'] == "Login successful") {
        Utils.showSnackBar(context, 'Login Success');

        if (response['user_id'] != null) {
          String userId = response['user_id'].toString();

          // Save token and userId UserSession class
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('userId', userId);

          if (kDebugMode) {
            debugPrint("Login successful: $response");
            print("Login User ID saved: $userId");
          }
          // Login Success Navigate DashBoard Screen
          // Use Future.delayed with a small delay to avoid the navigation issue
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => DashBoardScreen()),
          );
        } else {
          Utils.showFlushBar(context, 'Invalid user data');
        }
      } else {
        Utils.showFlushBar(context, response['message'] ?? 'Login failed');
        if (kDebugMode) debugPrint("Login failed: $response");
      }
    } catch (error) {
      setLoading(false);
      Utils.showFlushBar(context, error.toString());
      if (kDebugMode) debugPrint("Login error: $error");
    }
  }
}
