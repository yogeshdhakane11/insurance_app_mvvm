import 'package:flutter/material.dart';

class MedicalScreen1Viewmodel extends ChangeNotifier {
  bool _isApplicableChecked = false;
  bool _isNotApplicableChecked = false;
  bool showError = false; // Flag to control error display

  bool get isApplicableChecked => _isApplicableChecked;
  bool get isNotApplicableChecked => _isNotApplicableChecked;

  void toggleApplicableChecked(bool value) {
    _isApplicableChecked = value;
    if (value)
      _isNotApplicableChecked = false; // Ensure only one can be checked
    notifyListeners();
  }

  void toggleNotApplicableChecked(bool value) {
    _isNotApplicableChecked = value;
    if (value) _isApplicableChecked = false; // Ensure only one can be checked
    notifyListeners();
  }

  void validateCheckboxes() {
    // Check if neither checkbox is selected
    showError = !isApplicableChecked && !isNotApplicableChecked;
    notifyListeners();
  }
}
