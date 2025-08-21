import 'package:flutter/material.dart';

class CareSupremeSelfViewModel extends ChangeNotifier {
  // Controllers for form fields
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  // FormKey
  final formKey = GlobalKey<FormState>();

  String? _gender;
  bool _isLoading = false;

  String? get gender => _gender;
  bool get isLoading => _isLoading;

  void setGender(String? newValue) {
    _gender = newValue;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Method to handle form submission
  void submitSelfData(BuildContext context) async {
    setLoading(true);
    // Simulate an API call or data processing
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay

    // Print form data (replace with actual API call in a real app)
    print('First Name: ${firstNameController.text}');
    print('Last Name: ${lastNameController.text}');
    print('Gender: $_gender');
    print('Height: ${heightController.text}');
    print('Weight: ${weightController.text}');

    setLoading(false);
    Navigator.pop(context); // Close the bottom sheet after submission
  }

  // Dispose all controllers
  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }
}
