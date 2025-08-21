import 'package:flutter/cupertino.dart';

class SampoornaRakshaPolicySummaryViewmodel extends ChangeNotifier {
  // API loading
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // API call
}
