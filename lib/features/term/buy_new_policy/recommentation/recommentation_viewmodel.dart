import 'package:flutter/cupertino.dart';

class RecommendationModel extends ChangeNotifier {
  String _selectedAmount = '₹50.0L';
  String _selectedAge = '60 years';
  String _selectedPayFor = '10 years';
  String _selectedFrequency = 'Annually';

  final List<String> amountOptions = [
    '₹25.0L',
    '₹50.0L',
    '₹1.0Cr',
    '₹2.0Cr',
    '₹3.0Cr',
    '₹4.0Cr',
    '₹5.0Cr',
  ];
  final List<String> ageOptions = [
    '55 years',
    '60 years',
    '65 years',
    '70 years',
  ];
  final List<String> payForOptions = [
    '10 years',
    '20 years',
    '30 years',
    '39 years',
  ];
  final List<String> frequencyOptions = [
    'Annually',
    'Half-Yearly',
    'Quarterly',
    'Monthly',
  ];

  // Public getters for the UI to access
  String get selectedAmount => _selectedAmount;
  String get selectedAge => _selectedAge;
  String get selectedPayFor => _selectedPayFor;
  String get selectedFrequency => _selectedFrequency;

  // Methods to update the values and notify listeners
  void updateAmount(String amount) {
    _selectedAmount = amount;
    notifyListeners();
  }

  void updateAge(String age) {
    _selectedAge = age;
    notifyListeners();
  }

  void updatePayFor(String payFor) {
    _selectedPayFor = payFor;
    notifyListeners();
  }

  void updateFrequency(String frequency) {
    _selectedFrequency = frequency;
    notifyListeners();
  }
}
