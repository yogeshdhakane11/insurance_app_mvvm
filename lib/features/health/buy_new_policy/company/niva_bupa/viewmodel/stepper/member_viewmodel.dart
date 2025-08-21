import 'package:flutter/material.dart';

class MemberScreenViewModel extends ChangeNotifier {
  // loading
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
