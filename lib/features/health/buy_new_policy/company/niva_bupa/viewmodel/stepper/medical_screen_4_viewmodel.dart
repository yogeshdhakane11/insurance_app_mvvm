import 'package:flutter/material.dart';

class MedicalScreen4Viewmodel extends ChangeNotifier {
  // Form key for validation
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Controllers for each field
  final TextEditingController hba1cController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController onsetDateController = TextEditingController();
  final TextEditingController medicineNameController = TextEditingController();
  final TextEditingController dosageController = TextEditingController();
  final TextEditingController currentStatusController = TextEditingController();
  final TextEditingController doctorDetailsController = TextEditingController();

  // State variables for the checkboxes
  bool _isApplicableChecked = false;
  bool _isNotApplicableChecked = false;
  bool _showError = false; // To control the error message visibility
  bool _isInsulin = false;

  // Getters for checkbox values
  bool get isApplicableChecked => _isApplicableChecked;
  bool get isNotApplicableChecked => _isNotApplicableChecked;
  bool get showError => _showError;
  bool get isInsulin => _isInsulin;

  // Methods to toggle checkbox values
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

  // Update the insulin state and notify listeners
  void setInsulin(bool value) {
    _isInsulin = value;
    notifyListeners(); // Notify the listeners of the change
  }

  // Method to validate the checkboxes and show error if both are unchecked
  void validateCheckboxes() {
    // Check if neither checkbox is selected
    _showError = !isApplicableChecked && !isNotApplicableChecked;
    notifyListeners();
  }
}
