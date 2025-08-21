import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../repositories/term_repository.dart';
import '../../../../../utils/utils.dart';
import '../../recommentation/recomentation_screen.dart';

class PersonalizeViewModel extends ChangeNotifier {
  // TermRepository
  final TermRepository _termRepository = TermRepository();
  // Options lists
  final List<String> educationLevels = [
    'College graduates & above',
    '12th Pass',
    '10th Pass',
  ];

  final List<String> occupations = ['Salaried', 'Business Owner'];

  final List<String> incomes = [
    "3L to 5L",
    "5L to 7L",
    "7L to 10L",
    "10L to 15L",
    "15L to 25L",
    "25L+",
  ];

  final List<String> maritalStatusList = [
    'Single',
    'Married',
    'Divorced',
    'Widow',
  ];

  final List<String> genders = ['Male', 'Female', 'Other'];

  // Form controllers
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final dobController = TextEditingController();
  final pinCodeController = TextEditingController();

  // Form validation key
  final formKey = GlobalKey<FormState>();

  // loading
  bool _loading = false;
  bool get loading => _loading;

  // Education, Occupation, Income
  String? selectedEducation;
  String? selectedOccupation;
  String? selectedIncome;

  // Smoking, Marital Status, Gender
  bool? hasSmoked;
  String? maritalStatus;
  String? gender;

  // setLoading
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  // Setters
  void setEducation(String? value) {
    selectedEducation = value;
    notifyListeners();
  }

  void setOccupation(String? value) {
    selectedOccupation = value;
    notifyListeners();
  }

  void setIncome(String? value) {
    selectedIncome = value;
    notifyListeners();
  }

  void setSmokingStatus(bool? value) {
    hasSmoked = value;
    notifyListeners();
  }

  void setMaritalStatus(String? value) {
    maritalStatus = value;
    notifyListeners();
  }

  void setGender(String? value) {
    gender = value;
    notifyListeners();
  }

  // Term API
  Future<void> termRegisterApi(
    Map<String, dynamic> body,
    BuildContext context,
  ) async {
    setLoading(true);

    try {
      debugPrint("🔁 Sending body: $body");

      final response = await _termRepository.termRegisterApi(body);

      setLoading(false);

      // ✅ Check for success based on ID existence (since Statuscode is not available)
      if (response != null && response['id'] != null) {
        if (kDebugMode) {
          Utils.showSnackBar(context, 'Registered Successfully');

          debugPrint(
            "✅ Register successful, redirecting to RecommendationBottomSheet",
          );
        }

        // Step 1: Close current bottom sheet
        Navigator.pop(context);

        // Step 2: Show the next bottom sheet after a small delay
        Future.delayed(Duration.zero, () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (_) => TearmRecommendationScreen(),
          );
        });
      } else {
        // 🔴 Handle error returned from API
        final errorMessage = response['message'] ?? "Register failed";
        Utils.showFlushBar(context, errorMessage);

        if (kDebugMode) {
          debugPrint("❌ Register failed: $errorMessage");
          debugPrint("Server Response: ${response.toString()}");
        }
      }
    } catch (error) {
      setLoading(false);

      Utils.showFlushBar(context, "Something went wrong: ${error.toString()}");

      if (kDebugMode) {
        debugPrint("❌ Register error: $error");
      }
    }
  }
}
