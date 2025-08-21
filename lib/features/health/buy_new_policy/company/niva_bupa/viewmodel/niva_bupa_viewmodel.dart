import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ViewModel to manage state
class NivaBupaViewModel extends ChangeNotifier {
  String _selectedSumInsured = '₹ 10 lakhs';
  String _selectedPlanType = 'Platinum +';

  String get selectedSumInsured => _selectedSumInsured;
  String get selectedPlanType => _selectedPlanType;

  void setSelectedSumInsured(String value) {
    _selectedSumInsured = value;
    notifyListeners();
  }

  void setSelectedPlanType(String value) {
    _selectedPlanType = value;
    notifyListeners();
  }

  int _selectedTabIndex = 0;
  int get selectedTabIndex => _selectedTabIndex;

  void setSelectedTabIndex(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  void saveSelectedOptions({
    required String sumInsured,
    required String planType,
  }) {
    // TODO: Replace with real API logic
    print('Posting to API: $sumInsured, $planType');

    // Example API call or logic
  }
}

// import 'package:flutter/material.dart';
//
// class NivaBupaViewModel extends ChangeNotifier {
//   String _selectedSumInsured = '₹ 10 lakhs';
//   String _selectedPlanType = 'Platinum +';
//
//   String get selectedSumInsured => _selectedSumInsured;
//   String get selectedPlanType => _selectedPlanType;
//
//   void setSumInsured(String value) {
//     _selectedSumInsured = value;
//     notifyListeners();
//   }
//
//   void setPlanType(String value) {
//     _selectedPlanType = value;
//     notifyListeners();
//   }
// }
