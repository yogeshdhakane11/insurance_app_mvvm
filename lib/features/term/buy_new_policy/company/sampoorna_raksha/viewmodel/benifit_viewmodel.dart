import 'package:flutter/cupertino.dart';

class SampoornaRakshaPromiseViewModel extends ChangeNotifier {
  // API loading
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setTabIndex(int index) {
    _tabIndex = index;
    notifyListeners(); // Notify listeners of state change
  }

  // API call
}
