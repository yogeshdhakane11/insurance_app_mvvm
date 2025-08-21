// lib/viewmodel/niva_proposer_viewmodel.dart
import 'package:flutter/material.dart';

class NivaProposerViewModel extends ChangeNotifier {
  // Controllers for text input fields
  TextEditingController panController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  // State variables for the form fields
  bool _isPoliticallyExposed = false;
  String _maritalStatus = 'Single';
  String _occupation = 'Salaried';
  bool _hasEInsurance = false;

  // Getters to expose the state to the UI
  bool get isPoliticallyExposed => _isPoliticallyExposed;
  String get maritalStatus => _maritalStatus;
  String get occupation => _occupation;
  bool get hasEInsurance => _hasEInsurance;

  // Setters to update the state and notify listeners

  void updatePoliticallyExposed(bool value) {
    _isPoliticallyExposed = value;
    notifyListeners();
  }

  void updateMaritalStatus(String? value) {
    if (value != null) {
      _maritalStatus = value;
      notifyListeners();
    }
  }

  void updateOccupation(String? value) {
    if (value != null) {
      _occupation = value;
      notifyListeners();
    }
  }

  void updateEInsurance(bool value) {
    _hasEInsurance = value;
    notifyListeners();
  }

  // A method to handle the submission logic
  void submit() {
    // This is where you would handle the form data, e.g., send to an API.
    print('Form Submitted with the following data:');
    print('PAN: $panController');
    print('Politically Exposed: $_isPoliticallyExposed');
    print('Marital Status: $_maritalStatus');
    print('Occupation: $_occupation');
    print('Email: $emailController');
    print('Phone Number: $phoneNumberController');
    print('Address: $addressController');
    print('Has e-Insurance Account: $_hasEInsurance');
  }
}
