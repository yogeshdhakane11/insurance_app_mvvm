import 'package:flutter/foundation.dart';

class CareSupremeViewModel extends ChangeNotifier {
  // Existing properties and methods...

  // final ValueNotifier<int> selectedSegment = ValueNotifier<int>(
  //   0,
  // ); // 0: Riders, 1: Highlights, 2: Hospitals
  //
  // void setSelectedSegment(int index) {
  //   if (selectedSegment.value != index) {
  //     selectedSegment.value = index;
  //     notifyListeners();
  //   }
  // }

  // Rider selection states
  bool _isStarExtraProtectSelected = false;
  bool _isPedBuyBackSelected = false;

  bool get isStarExtraProtectSelected => _isStarExtraProtectSelected;
  bool get isPedBuyBackSelected => _isPedBuyBackSelected;

  void toggleStarExtraProtect() {
    _isStarExtraProtectSelected = !_isStarExtraProtectSelected;
    notifyListeners();
  }

  void togglePedBuyBack() {
    _isPedBuyBackSelected = !_isPedBuyBackSelected;
    notifyListeners();
  }

  // Your existing sum options and selected sum insured
  final List<String> sumOptions = [
    '₹5 Lakh',
    '₹10 Lakh',
    '₹15 Lakh',
    '₹20 Lakh',
  ];
  String _selectedSumInsured = '₹10 Lakh'; // Default value

  String get selectedSumInsured => _selectedSumInsured;

  void setSelectedSumInsured(String value) {
    _selectedSumInsured = value;
    notifyListeners();
  }
}

// import 'package:flutter/foundation.dart';
//
// class CareSupremeViewModel extends ChangeNotifier {
//   // Existing properties and methods...
//
//   final ValueNotifier<int> selectedSegment = ValueNotifier<int>(
//     0,
//   ); // 0: Riders, 1: Highlights, 2: Hospitals
//
//   void setSelectedSegment(int index) {
//     if (selectedSegment.value != index) {
//       selectedSegment.value = index;
//       notifyListeners();
//     }
//   }
//
//   // Rider selection states
//   bool _isStarExtraProtectSelected = false;
//   bool _isPedBuyBackSelected = false;
//
//   bool get isStarExtraProtectSelected => _isStarExtraProtectSelected;
//   bool get isPedBuyBackSelected => _isPedBuyBackSelected;
//
//   void toggleStarExtraProtect() {
//     _isStarExtraProtectSelected = !_isStarExtraProtectSelected;
//     notifyListeners();
//   }
//
//   void togglePedBuyBack() {
//     _isPedBuyBackSelected = !_isPedBuyBackSelected;
//     notifyListeners();
//   }
//
//   // Your existing sum options and selected sum insured
//   final List<String> sumOptions = [
//     '₹5 Lakh',
//     '₹10 Lakh',
//     '₹15 Lakh',
//     '₹20 Lakh',
//   ];
//   String _selectedSumInsured = '₹10 Lakh'; // Default value
//
//   String get selectedSumInsured => _selectedSumInsured;
//
//   void setSelectedSumInsured(String value) {
//     _selectedSumInsured = value;
//     notifyListeners();
//   }
// }

// 1
// import 'package:flutter/material.dart';
//
// class CareSupremeViewModel extends ChangeNotifier {
//   // ValueNotifier for the selected segment (Riders, Highlights, Hospitals)
//   ValueNotifier<int> selectedSegment = ValueNotifier<int>(0);
//
//   String selectedSumInsured = '₹ 10 lakhs'; // Default sum insured value
//
//   final List<String> sumOptions = [
//     '₹ 5 lakhs',
//     '₹ 7 lakhs',
//     '₹ 7.5 lakhs',
//     '₹ 10 lakhs',
//     '₹ 12 lakhs',
//     '₹ 15 lakhs',
//     '₹ 20 lakhs',
//     '₹ 25 lakhs',
//     '₹ 30 lakhs',
//     '₹ 1 Cr',
//   ];
//
//   void setSelectedSumInsured(String value) {
//     selectedSumInsured = value;
//     notifyListeners(); // Notify listeners to update the UI
//   }
//
//   // final ValueNotifier<int> selectedSegment = ValueNotifier<int>(0);
//
//   void setSelectedSegment(int index) {
//     selectedSegment.value = index;
//     notifyListeners();
//   }
// }
