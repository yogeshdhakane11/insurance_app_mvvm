import 'package:flutter/material.dart';

class StarScreenViewModel extends ChangeNotifier {
  // ValueNotifier for the selected segment (Riders, Highlights, Hospitals)
  ValueNotifier<int> selectedSegment = ValueNotifier<int>(0);

  String selectedSumInsured = '₹ 10 lakhs'; // Default sum insured value

  final List<String> sumOptions = [
    '₹ 5 lakhs',
    '₹ 7 lakhs',
    '₹ 7.5 lakhs',
    '₹ 10 lakhs',
    '₹ 12 lakhs',
    '₹ 15 lakhs',
    '₹ 20 lakhs',
    '₹ 25 lakhs',
    '₹ 30 lakhs',
    '₹ 1 Cr',
  ];

  void setSelectedSumInsured(String value) {
    selectedSumInsured = value;
    notifyListeners(); // Notify listeners to update the UI
  }
}
