import 'package:flutter/material.dart';

class MedicalScreen10Viewmodel extends ChangeNotifier {
  // Form key for validation
  final formKey = GlobalKey<FormState>();

  // Controller
  final TextEditingController mlPerWeekController = TextEditingController();

  // State variables for the checkboxes
  bool _isApplicableChecked = false;
  bool _isNotApplicableChecked = false;
  bool _showError = false; // To control the error message visibility

  // To track daily drinking (Yes/No)
  bool _isDailyDrinkerYes = false;
  bool _isDailyDrinkerNo = true; // Default "No" is selected

  // Getters for checkbox values
  bool get isApplicableChecked => _isApplicableChecked;
  bool get isNotApplicableChecked => _isNotApplicableChecked;
  bool get showError => _showError;
  bool get isDailyDrinkerNo => _isDailyDrinkerNo;
  bool get isDailyDrinkerYes => _isDailyDrinkerYes;

  // Method to toggle 'Yes' for daily drinker
  void toggleDailyDrinkerYes(bool value) {
    _isDailyDrinkerYes = value;
    if (value) {
      _isDailyDrinkerNo = false; // If 'Yes' is selected, 'No' is unselected
    }
    notifyListeners();
  }

  // Method to toggle 'No' for daily drinker
  void toggleDailyDrinkerNo(bool value) {
    _isDailyDrinkerNo = value;
    if (value) {
      _isDailyDrinkerYes = false; // If 'No' is selected, 'Yes' is unselected
    }
    notifyListeners();
  }

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
