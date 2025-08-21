import 'package:flutter/material.dart';

class MedicalScreen2Viewmodel extends ChangeNotifier {
  // TextEditingControllers for form fields
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController onsetDateController = TextEditingController();
  final TextEditingController medicineNameController = TextEditingController();
  final TextEditingController dosageController = TextEditingController();
  final TextEditingController currentStatusController = TextEditingController();
  final TextEditingController treatingDoctorController =
      TextEditingController();

  bool _isApplicableChecked = false;
  bool _isNotApplicableChecked = false;
  bool _showError = false; // Flag to control error display

  bool get isApplicableChecked => _isApplicableChecked;
  bool get isNotApplicableChecked => _isNotApplicableChecked;
  bool get showError => _showError;

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
    _showError = !isApplicableChecked && !isNotApplicableChecked;
    notifyListeners();
  }

  // Validate form fields when isApplicableChecked is true
  // bool validateForm() {
  //   if (_isApplicableChecked) {
  //     return detailsController.text.isNotEmpty &&
  //         onsetDateController.text.isNotEmpty &&
  //         medicineNameController.text.isNotEmpty &&
  //         dosageController.text.isNotEmpty &&
  //         currentStatusController.text.isNotEmpty &&
  //         treatingDoctorController.text.isNotEmpty;
  //   }
  //   return true; // No validation needed if isApplicableChecked is false
  // }

  // Clean up controllers when disposing
  void dispose() {
    detailsController.dispose();
    onsetDateController.dispose();
    medicineNameController.dispose();
    dosageController.dispose();
    currentStatusController.dispose();
    treatingDoctorController.dispose();
    super.dispose();
  }
}
