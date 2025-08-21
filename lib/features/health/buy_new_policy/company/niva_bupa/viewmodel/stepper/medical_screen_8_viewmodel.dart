import 'package:flutter/material.dart';

class MedicalScreen8Viewmodel extends ChangeNotifier {
  // State variables for the checkboxes
  bool _isApplicableChecked = false;
  bool _isNotApplicableChecked = false;
  bool _showError = false; // To control the error message visibility

  // Getters for checkbox values
  bool get isApplicableChecked => _isApplicableChecked;
  bool get isNotApplicableChecked => _isNotApplicableChecked;
  bool get showError => _showError;

  // Methods to toggle checkbox values At a Time ony one checkbox are check
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

  // Method to validate the checkboxes and show error if both are unchecked
  void validateCheckboxes() {
    // Check if neither checkbox is selected
    _showError = !isApplicableChecked && !isNotApplicableChecked;
    notifyListeners();
  }
}
