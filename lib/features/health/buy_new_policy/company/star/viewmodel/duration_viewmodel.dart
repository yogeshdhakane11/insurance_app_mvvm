import 'package:flutter/cupertino.dart';

import '../model/duration_model.dart';

class StarDurationViewmodel extends ChangeNotifier {
  String? selectedDuration;
  String selectedDeductible = '25000';

  final List<StarPlanDurationModel> durationList = [
    StarPlanDurationModel(durationYear: '1 year', planPrice: '₹10,883'),
    StarPlanDurationModel(
      durationYear: '2 year',
      planPrice: '₹21,004',
      savePrice: '₹762',
    ),
    StarPlanDurationModel(
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

  // Method to update the deductible
  void selectDeductible(String deductible) {
    selectedDeductible = deductible;
    notifyListeners(); // Notify listeners to rebuild the widget with the new deductible
  }
}
