import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../repositories/health_repository.dart';
import '../../../../../utils/utils.dart';

class HealthChoosePlanViewModel extends ChangeNotifier {
  final HealthRepository _healthRepository = HealthRepository();

  bool _isLoading = false;
  Map<String, double> _premiums = {}; // Map of plan_name -> premium
  String _selectedSumInsured = '₹ 10 lakhs';

  bool get isLoading => _isLoading;
  Map<String, double> get premiums => _premiums;
  String get selectedSumInsured => _selectedSumInsured;

  void setSelectedSumInsured(String value) {
    _selectedSumInsured = value;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Helper: convert display string to int
  int _parseSumInsured(String sumInsured) {
    final cleaned = sumInsured.replaceAll(RegExp(r'[^0-9.]'), '');
    if (sumInsured.contains('Cr')) {
      return (double.parse(cleaned) * 10000000).toInt();
    } else if (sumInsured.contains('lakhs')) {
      return (double.parse(cleaned) * 100000).toInt();
    }
    return int.tryParse(cleaned) ?? 0;
  }

  // Fetch premium for all plans using user_id and sum_insured
  Future<void> fetchPremium(
    BuildContext context, {
    String? overrideSumInsured,
  }) async {
    setLoading(true);
    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('userId');
      if (userId == null) {
        setLoading(false);
        Utils.showFlushBar(context, "User not logged in.");
        return;
      }
      final sumInsuredStr = overrideSumInsured ?? _selectedSumInsured;
      final sumInsuredInt = _parseSumInsured(sumInsuredStr);

      final body = {"user_id": int.parse(userId), "sum_insured": sumInsuredInt};

      final response = await _healthRepository.getPremiumForSumInsured(body);

      setLoading(false);

      if (response != null && response is List && response.isNotEmpty) {
        _premiums = {};
        for (final plan in response) {
          _premiums[plan['plan_name']] = (plan['premium'] as num).toDouble();
        }
        notifyListeners();
        Utils.showSnackBar(context, 'Premium fetched successfully');
      } else {
        final errorMessage = (response is Map && response['message'] != null)
            ? response['message']
            : "Failed to fetch premium";
        Utils.showFlushBar(context, errorMessage);
      }
    } catch (error) {
      setLoading(false);
      Utils.showFlushBar(context, "Something went wrong: ${error.toString()}");
    }
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../../../../../repositories/health_repository.dart';
// import '../../../../../utils/utils.dart';
//
// class HealthChoosePlanViewModel extends ChangeNotifier {
//   final HealthRepository _healthRepository = HealthRepository();
//
//   bool _isLoading = false;
//   String _premium = '';
//   String _selectedSumInsured = '₹ 10 lakhs';
//
//   // Getters
//   bool get isLoading => _isLoading;
//   String get premium => _premium;
//   String get selectedSumInsured => _selectedSumInsured;
//
//   // Setters
//   void setSelectedSumInsured(String value) {
//     _selectedSumInsured = value;
//     notifyListeners();
//   }
//
//   void setLoading(bool value) {
//     _isLoading = value;
//     notifyListeners();
//   }
//
//   // Api call to fetch premium based on selected sum insured
//   Future<void> fetchPremium(String sumInsured, BuildContext context) async {
//     setLoading(true);
//     try {
//       debugPrint("🔁 Sending body: { 'sum_insured': $sumInsured }");
//
//       // Prepare the body with sumInsured
//       final response = await _healthRepository.getPremiumForSumInsured(
//         sumInsured,
//       );
//
//       setLoading(false);
//
//       // Check for success based on response, assuming 'premium' is returned
//       if (response != null && response.isNotEmpty) {
//         // Assuming response is a list and you want to access the first item
//         final premiumResponse = response[0]; // Extracting the first item
//         _premium = premiumResponse['premium']
//             .toString(); // Update premium value
//         notifyListeners(); // Notify UI to update
//
//         // Optionally, display a success message
//         Utils.showSnackBar(context, 'Premium fetched successfully');
//       } else {
//         final errorMessage = response['message'] ?? "Failed to fetch premium";
//         Utils.showFlushBar(context, errorMessage);
//         debugPrint("❌ Fetch premium failed: $errorMessage");
//         debugPrint("Server Response: ${response.toString()}");
//       }
//     } catch (error) {
//       setLoading(false);
//       Utils.showFlushBar(context, "Something went wrong: ${error.toString()}");
//       debugPrint("❌ Fetch premium error: $error");
//     }
//   }
// }
