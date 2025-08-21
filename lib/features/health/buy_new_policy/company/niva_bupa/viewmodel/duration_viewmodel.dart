import 'package:flutter/cupertino.dart';

import '../model/duration.dart';

class NivaBupaDurationViewModel extends ChangeNotifier {
  // String? selectedDuration;
  String? selectedDuration = '1 year'; // Set default value to "1 year"
  String selectedDeductible = '25000';

  final List<PlanDurationModel> durationList = [
    PlanDurationModel(durationYear: '1 year', planPrice: '₹10,883'),
    PlanDurationModel(
      durationYear: '2 year',
      planPrice: '₹21,004',
      savePrice: '₹762',
    ),
    PlanDurationModel(
      durationYear: '3 year',
      planPrice: '₹30,528',
      savePrice: '₹2,121',
    ),
  ];

  void selectDuration(String year) {
    selectedDuration = year;
    notifyListeners();
  }

  void applyDeductible(String amount) {
    selectedDeductible = amount;
    notifyListeners();
  }
}
