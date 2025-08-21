import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Nominee ViewModel
class CareSupremeNomineeViewModel extends ChangeNotifier {
  // Controllers for the fields
  final TextEditingController nomineeController = TextEditingController();
  final TextEditingController relationshipController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  // Key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? _nomineeRelationship;
  String? get nomineeRelationship => _nomineeRelationship;

  void setNomineeRelationship(String? value) {
    _nomineeRelationship = value;
    notifyListeners();
  }

  // Method to validate form before submission
  // bool validateForm() {
  //   return _nomineeRelationship != null && _nomineeRelationship!.isNotEmpty;
  // }

  // Validate form inputs
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  // Method to clear form
  void clearForm() {
    _nomineeRelationship = null;
    notifyListeners();
  }
}
