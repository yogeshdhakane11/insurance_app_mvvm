import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProposerViewModel extends ChangeNotifier {
  // Controllers
  final TextEditingController panController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController accountController = TextEditingController();
  final TextEditingController ifscController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Method to handle submission logic
  void submitProposerData(BuildContext context) async {
    setLoading(true);
    // Simulate an API call or data processing
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay

    // In a real application, you would send this data to an API
    print('Submitting Proposer Data:');
    print('PAN: ${panController.text}');
    print('Email: ${emailController.text}');
    print('Phone: ${phoneController.text}');
    print('Account Number: ${accountController.text}');
    print('IFSC Code: ${ifscController.text}');
    print('Address: ${addressController.text}');
    print('City: ${cityController.text}');
    print('State: ${stateController.text}');

    setLoading(false);
    Navigator.pop(context); // Close the bottom sheet after submission
    // You might want to show a success message here
    // Utils.showSnackBar(context, "Proposer data submitted successfully!");
  }

  // Dispose all controllers
  @override
  void dispose() {
    panController.dispose();
    emailController.dispose();
    phoneController.dispose();
    accountController.dispose();
    ifscController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    super.dispose();
  }
}

// import 'package:flutter/material.dart';
//
// class ProposerViewModel extends ChangeNotifier {
//   // Controllers
//   final TextEditingController panController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController accountController = TextEditingController();
//   final TextEditingController ifscController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//   final TextEditingController cityController = TextEditingController();
//   final TextEditingController stateController = TextEditingController();
//
//   bool _isLoading = false;
//   bool get isLoading => _isLoading;
//
//   void setLoading(bool value) {
//     _isLoading = value;
//     notifyListeners();
//   }
//
//   // Dispose all controllers
//   @override
//   void dispose() {
//     panController.dispose();
//     emailController.dispose();
//     phoneController.dispose();
//     accountController.dispose();
//     ifscController.dispose();
//     addressController.dispose();
//     cityController.dispose();
//     stateController.dispose();
//     super.dispose();
//   }
//
//   // Method to handle submission logic
//   void submitProposerData(BuildContext context) async {
//     setLoading(true);
//     // Simulate an API call or data processing
//     await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
//
//     // In a real application, you would send this data to an API
//     print('Submitting Proposer Data:');
//     print('PAN: ${panController.text}');
//     print('Email: ${emailController.text}');
//     print('Phone: ${phoneController.text}');
//     print('Account Number: ${accountController.text}');
//     print('IFSC Code: ${ifscController.text}');
//     print('Address: ${addressController.text}');
//     print('City: ${cityController.text}');
//     print('State: ${stateController.text}');
//
//     setLoading(false);
//     Navigator.pop(context); // Close the bottom sheet after submission
//     // You might want to show a success message here
//     // Utils.showSnackBar(context, "Proposer data submitted successfully!");
//   }
// }
