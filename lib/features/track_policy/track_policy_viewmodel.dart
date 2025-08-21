import 'package:flutter/material.dart';

class TrackPolicyViewModel extends ChangeNotifier {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  int get selectedIndex => _selectedIndex;
  PageController get pageController => _pageController;

  void onTabTapped(int index) {
    _selectedIndex = index;
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  void onPageChanged(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
