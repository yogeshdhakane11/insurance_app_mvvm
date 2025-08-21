import 'package:flutter/material.dart';

class NivaSelfViewModel extends ChangeNotifier {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String? _gender;
  String? _educationalQualification;

  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get heightController => _heightController;
  TextEditingController get weightController => _weightController;
  String? get gender => _gender;
  String? get educationalQualification => _educationalQualification;

  void updateGender(String? value) {
    _gender = value;
    notifyListeners();
  }

  void updateEducationalQualification(String? value) {
    _educationalQualification = value;
    notifyListeners();
  }

  void submit() {
    // Handle form submission logic, e.g., send data to a server or process it
    print('First Name: ${_firstNameController.text}');
    print('Last Name: ${_lastNameController.text}');
    print('Gender: $_gender');
    print('Height: ${_heightController.text}');
    print('Weight: ${_weightController.text}');
    print('Educational Qualification: $_educationalQualification');
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }
}
