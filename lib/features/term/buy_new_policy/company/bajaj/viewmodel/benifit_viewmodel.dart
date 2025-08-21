import 'package:flutter/cupertino.dart';

class BajajViewModel extends ChangeNotifier {
  int _tabIndex = 0;

  int get tabIndex => _tabIndex;

  void setTabIndex(int index) {
    _tabIndex = index;
    notifyListeners(); // Notify listeners of state change
  }
}
