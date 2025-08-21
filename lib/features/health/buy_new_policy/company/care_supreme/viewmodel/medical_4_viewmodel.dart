import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CareSupremeMedical4ViewModel extends ChangeNotifier {
  // Key
  final formKey = GlobalKey<FormState>();

  bool _isApplicableChecked = false;
  bool _isNotApplicableChecked = false;
  bool showError = false; // Flag to control error display

  bool get isApplicableChecked => _isApplicableChecked;
  bool get isNotApplicableChecked => _isNotApplicableChecked;

  // Toggle for "Applicable" checkbox
  void toggleApplicableChecked(bool value) {
    _isApplicableChecked = value;
    if (value) {
      _isNotApplicableChecked = false; // Ensure only one checkbox is checked
    }
    notifyListeners();
  }

  // Toggle for "Not Applicable" checkbox
  void toggleNotApplicableChecked(bool value) {
    _isNotApplicableChecked = value;
    if (value) {
      _isApplicableChecked = false; // Ensure only one checkbox is checked
    }
    notifyListeners();
  }

  // Validate checkboxes - Ensure one is selected
  bool validateCheckboxes() {
    if (!isApplicableChecked && !isNotApplicableChecked) {
      showError = true;
      notifyListeners(); // Notify UI for error display
      return false;
    }
    showError = false;
    return true;
  }

  // You can also validate the form, if needed
  bool validateForm() {
    // Validate form fields and checkboxes together
    if (formKey.currentState?.validate() ?? false) {
      return validateCheckboxes();
    }
    return false;
  }
}
