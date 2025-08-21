import 'package:flutter/cupertino.dart';

import '../model/duration_model.dart';

class CareSupremeDurationViewModel extends ChangeNotifier {
  // String? selectedDuration;
  String? selectedDuration = '1 year'; // Set default value to "1 year"

  final List<CareSupremePlanDurationModel> durationList = [
    CareSupremePlanDurationModel(durationYear: '1 year', planPrice: '₹10,883'),
    CareSupremePlanDurationModel(
      durationYear: '2 year',
      planPrice: '₹21,004',
      savePrice: '₹762',
    ),
    CareSupremePlanDurationModel(
      durationYear: '3 year',
      planPrice: '₹30,528',
      savePrice: '₹2,121',
    ),
  ];

  void selectDuration(String year) {
    selectedDuration = year;
    notifyListeners();
  }
}
