import 'package:flutter/foundation.dart';

class CheckboxViewModel extends ChangeNotifier {
  bool _isApplicableChecked = false;
  bool _isNotApplicableChecked = false;
  bool showError = false; // Flag to control error display

  bool get isApplicableChecked => _isApplicableChecked;
  bool get isNotApplicableChecked => _isNotApplicableChecked;

  void toggleYogeshChecked(bool value) {
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

  bool _isInsulin = false;

  bool get isInsulin => _isInsulin;

  // Update the insulin state and notify listeners
  void setInsulin(bool value) {
    _isInsulin = value;
    notifyListeners(); // Notify the listeners of the change
  }

  // To track daily drinking (Yes/No)
  bool _isDailyDrinkerYes = false;
  bool get isDailyDrinkerYes => _isDailyDrinkerYes;

  bool _isDailyDrinkerNo = true; // Default "No" is selected
  bool get isDailyDrinkerNo => _isDailyDrinkerNo;

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
}
