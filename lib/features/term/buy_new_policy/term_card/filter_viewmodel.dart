import 'package:flutter/material.dart';

class FilterViewModel extends ChangeNotifier {
  String lifeCover = '₹50.0L';
  String coverTillAge = '60 years';
  String payFor = '11 years';
  String paymentFreq = 'Annually';

  void updateLifeCover(String value) {
    lifeCover = value;
    notifyListeners();
  }

  void updateCoverTillAge(String value) {
    coverTillAge = value;
    notifyListeners();
  }

  void updatePayFor(String value) {
    payFor = value;
    notifyListeners();
  }

  void updatePaymentFreq(String value) {
    paymentFreq = value;
    notifyListeners();
  }
}
