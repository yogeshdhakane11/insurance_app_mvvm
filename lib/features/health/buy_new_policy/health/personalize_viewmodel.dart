// personalize_viewmodel.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart'; // For kDebugMode
import 'dart:convert'; // For jsonEncode, though typically handled by NetworkApiService
import 'package:insurance/utils/utils.dart';

import '../../../../repositories/health_repository.dart';
import '../insurance_card/view/health_choose_your_plan.dart'; // Assuming this path for Utils

class PersonalizeViewModel with ChangeNotifier {
  // Map to store selected dates for various members (e.g., 'Self', 'Spouse', 'Son 1', 'Mother')
  final Map<String, String> _selectedDates = {};
  // Controller for the pincode input field
  final TextEditingController pincodeController = TextEditingController();

  // Counts for dynamic children fields
  int _sonCount = 0;
  int _daughterCount = 0;

  // List to keep track of selected parents/in-laws (e.g., 'Mother', 'Father-in-law')
  final List<String> _selectedParents = [];

  // Instance of HealthRepository for API calls
  final HealthRepository _healthRepository = HealthRepository();

  // Loading state for UI feedback
  bool _isLoading = false;

  // Getters for accessing private state variables
  bool get isLoading => _isLoading;
  Map<String, String> get selectedDates => _selectedDates;
  int getSonCount() => _sonCount;
  int getDaughterCount() => _daughterCount;
  List<String> get selectedParents => _selectedParents;

  // Setter for updating loading state and notifying listeners
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // --- Date and Member Management ---

  // Updates the DOB for a specific member and notifies listeners
  void updateDate(String member, String dob) {
    _selectedDates[member] = dob;
    notifyListeners();
  }

  // Removes the DOB for a specific member and notifies listeners
  void removeDate(String member) {
    _selectedDates.remove(member);
    notifyListeners();
  }

  // Updates the count of sons, removing DOBs of removed sons if count decreases
  void updateSonCount(int count) {
    if (count < _sonCount) {
      for (int i = _sonCount; i > count; i--) {
        _selectedDates.remove('Son $i');
      }
    }
    _sonCount = count;
    notifyListeners();
  }

  // Updates the count of daughters, removing DOBs of removed daughters if count decreases
  void updateDaughterCount(int count) {
    if (count < _daughterCount) {
      for (int i = _daughterCount; i > count; i--) {
        _selectedDates.remove('Daughter $i');
      }
    }
    _daughterCount = count;
    notifyListeners();
  }

  // Updates the list of selected parents/in-laws, removing DOBs of deselected parents
  void updateParents(List<String> parents) {
    final List<String> deselectedParents = _selectedParents
        .where((parent) => !parents.contains(parent))
        .toList();

    for (var parent in deselectedParents) {
      _selectedDates.remove(parent);
    }

    _selectedParents.clear();
    _selectedParents.addAll(parents);
    notifyListeners();
  }

  // Calculates age from a DOB string
  int? calculateAge(String? dobString) {
    if (dobString == null || dobString.isEmpty) return null;
    try {
      final dob = DateFormat('dd-MMM-yyyy').parse(dobString);
      final currentDate = DateTime.now();
      int age = currentDate.year - dob.year;
      if (currentDate.month < dob.month ||
          (currentDate.month == dob.month && currentDate.day < dob.day)) {
        age--;
      }
      return age;
    } catch (e) {
      debugPrint('Error parsing DOB for age calculation: $e');
      return null;
    }
  }

  // Helper function to reformat date string from 'dd-MMM-yyyy' to 'yyyy-MM-dd' for API payload
  String? _reformatDateForApi(String? date) {
    if (date == null || date.isEmpty) return null;
    try {
      final dateTime = DateFormat('dd-MMM-yyyy').parse(date);
      return DateFormat('yyyy-MM-dd').format(dateTime);
    } catch (e) {
      debugPrint('Date parsing error for API payload ($date): $e');
      return null; // Return null if parsing fails, as API might expect specific format or null
    }
  }

  // --- API Call Logic ---

  /// Submits personalized health data to the API.
  /// This method constructs the payload from the ViewModel's internal state.
  Future<void> submitHealthPersonalizeData(BuildContext context) async {
    setLoading(true); // Set loading state to true

    // Construct the API payload based on ViewModel's current state
    final Map<String, dynamic> payload = {
      "self_dob": _reformatDateForApi(_selectedDates['Self']),
      "spouse_dob": _reformatDateForApi(_selectedDates['Spouse']),
      "pincode": pincodeController.text.isEmpty
          ? null
          : pincodeController.text.trim(),
    };

    // Add DOBs for sons
    for (int i = 1; i <= _sonCount; i++) {
      payload['son${i}_dob'] = _reformatDateForApi(_selectedDates['Son $i']);
    }
    // Add DOBs for daughters
    for (int i = 1; i <= _daughterCount; i++) {
      payload['daughter${i}_dob'] = _reformatDateForApi(
        _selectedDates['Daughter $i'],
      );
    }

    // Add DOBs for selected parents/in-laws
    for (var parent in _selectedParents) {
      String key =
          parent.toLowerCase().replaceAll('-', '_') +
          '_dob'; // e.g., "Mother-in-law" -> "mother_in_law_dob"
      payload[key] = _reformatDateForApi(_selectedDates[parent]);
    }

    // Remove any null or empty string values from the payload before sending
    // This ensures the API receives a clean JSON body.
    payload.removeWhere(
      (key, value) => value == null || (value is String && value.isEmpty),
    );

    if (kDebugMode) {
      debugPrint("🔁 Submitting Health Data Payload: ${jsonEncode(payload)}");
    }

    try {
      // Make the actual API call using the HealthRepository
      // Assuming healthRegisterApi handles dynamic body and returns dynamic (Map or custom model)
      final response = await _healthRepository.healthRegisterApi(payload);

      setLoading(false); // Set loading state to false after API call completes

      // Process the API response
      if (response != null && response['id'] != null) {
        if (kDebugMode) {
          Utils.showSnackBar(context, "Health Register Submitted Successfully");
          debugPrint("✅ Health Info Submitted Successfully");
        }
        // Navigate to the next screen on success
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HealthChoosePlanScreen()),
        );
      } else {
        // Handle API error messages
        final error = response['message'] ?? "Something went wrong";
        Utils.showFlushBar(context, error);
        debugPrint("❌ API Error: $error");
      }
    } catch (e) {
      setLoading(false); // Ensure loading is off even if an exception occurs
      Utils.showFlushBar(context, "Exception: ${e.toString()}");
      debugPrint("❌ API Exception: $e");
    }
  }
}

// gemini 2
// import 'package:flutter/cupertino.dart';
// import 'package:intl/intl.dart'; // Import for date formatting
//
// class PersonalizeViewModel with ChangeNotifier {
//   final Map<String, String> _selectedDates = {};
//   final TextEditingController pincodeController = TextEditingController();
//   int _sonCount = 0;
//   int _daughterCount = 0;
//   final List<String> _selectedParents =
//       []; // Stores names like 'Mother', 'Father-in-law'
//
//   Map<String, String> get selectedDates => _selectedDates;
//   int getSonCount() => _sonCount;
//   int getDaughterCount() => _daughterCount;
//   List<String> get selectedParents => _selectedParents;
//
//   void updateDate(String member, String dob) {
//     _selectedDates[member] = dob;
//     notifyListeners();
//   }
//
//   void removeDate(String member) {
//     _selectedDates.remove(member);
//     notifyListeners();
//   }
//
//   void updateSonCount(int count) {
//     if (count < _sonCount) {
//       // If count is decreasing, remove DOBs for removed sons
//       for (int i = _sonCount; i > count; i--) {
//         _selectedDates.remove('Son $i');
//       }
//     }
//     _sonCount = count;
//     notifyListeners();
//   }
//
//   void updateDaughterCount(int count) {
//     if (count < _daughterCount) {
//       // If count is decreasing, remove DOBs for removed daughters
//       for (int i = _daughterCount; i > count; i--) {
//         _selectedDates.remove('Daughter $i');
//       }
//     }
//     _daughterCount = count;
//     notifyListeners();
//   }
//
//   void updateParents(List<String> parents) {
//     // Determine which parents were deselected and remove their DOBs
//     final List<String> deselectedParents = _selectedParents
//         .where((parent) => !parents.contains(parent))
//         .toList();
//
//     for (var parent in deselectedParents) {
//       _selectedDates.remove(parent);
//     }
//
//     _selectedParents.clear();
//     _selectedParents.addAll(parents);
//     notifyListeners();
//   }
//
//   // Helper to calculate age from DOB string (dd-MMM-yyyy)
//   int? calculateAge(String? dobString) {
//     if (dobString == null || dobString.isEmpty) return null;
//     try {
//       final dob = DateFormat('dd-MMM-yyyy').parse(dobString);
//       final currentDate = DateTime.now();
//       int age = currentDate.year - dob.year;
//       if (currentDate.month < dob.month ||
//           (currentDate.month == dob.month && currentDate.day < dob.day)) {
//         age--;
//       }
//       return age;
//     } catch (e) {
//       debugPrint('Error parsing DOB for age calculation: $e');
//       return null;
//     }
//   }
// }

// 4
// import 'package:flutter/cupertino.dart';
//
// class PersonalizeViewModel with ChangeNotifier {
//   final Map<String, String> _selectedDates = {};
//   final TextEditingController pincodeController = TextEditingController();
//   int _sonCount = 0;
//   int _daughterCount = 0;
//   final List<String> _selectedParents = [];
//
//   Map<String, String> get selectedDates => _selectedDates;
//   int getSonCount() => _sonCount;
//   int getDaughterCount() => _daughterCount;
//   List<String> get selectedParents => _selectedParents;
//
//   void updateDate(String member, String dob) {
//     _selectedDates[member] = dob;
//     notifyListeners();
//   }
//
//   void updateSonCount(int count) {
//     _sonCount = count;
//     notifyListeners();
//   }
//
//   void updateDaughterCount(int count) {
//     _daughterCount = count;
//     notifyListeners();
//   }
//
//   void updateParents(List<String> parents) {
//     _selectedParents.clear();
//     _selectedParents.addAll(parents);
//     notifyListeners();
//   }
// }

// api 1
// import 'package:flutter/cupertino.dart';
//
// class PersonalizeViewModel with ChangeNotifier {
//   final Map<String, String> _selectedDates = {};
//   final TextEditingController pincodeController = TextEditingController();
//   int _sonCount = 0;
//   int _daughterCount = 0;
//
//   Map<String, String> get selectedDates => _selectedDates;
//   int getSonCount() => _sonCount;
//   int getDaughterCount() => _daughterCount;
//
//   void updateDate(String member, String dob) {
//     _selectedDates[member] = dob;
//     notifyListeners();
//   }
//
//   void updateSonCount(int count) {
//     _sonCount = count;
//     notifyListeners();
//   }
//
//   void updateDaughterCount(int count) {
//     _daughterCount = count;
//     notifyListeners();
//   }
// }

// 2
// import 'package:flutter/cupertino.dart';
//
// class PersonalizeViewModel with ChangeNotifier {
//   final Map<String, String> _selectedDates = {};
//   final TextEditingController pincodeController = TextEditingController();
//   int _sonCount = 0;
//   int _daughterCount = 0;
//
//   Map<String, String> get selectedDates => _selectedDates;
//   int getSonCount() => _sonCount;
//   int getDaughterCount() => _daughterCount;
//
//   void updateDate(String member, String dob) {
//     _selectedDates[member] = dob;
//     notifyListeners();
//   }
//
//   void updateSonCount(int count) {
//     _sonCount = count;
//     notifyListeners();
//   }
//
//   void updateDaughterCount(int count) {
//     _daughterCount = count;
//     notifyListeners();
//   }
// }

// 1
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class PersonalizeViewModel with ChangeNotifier {
//   final Map<String, String> _selectedDates = {};
//
//   final pincodeController = TextEditingController();
//
//   Map<String, String> get selectedDates => _selectedDates;
//
//   void updateDate(String member, String dob) {
//     _selectedDates[member] = dob;
//     notifyListeners();
//   }
//
//   void removeChild(String childType) {
//     _selectedDates.remove(childType);
//     notifyListeners();
//   }
//
//   int getSonCount() {
//     return _selectedDates.keys.where((key) => key.startsWith('Son')).length;
//   }
//
//   int getDaughterCount() {
//     return _selectedDates.keys
//         .where((key) => key.startsWith('Daughter'))
//         .length;
//   }
// }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class PersonalizeViewModel with ChangeNotifier {
//   final Map<String, String> _selectedDates = {};
//
//   Map<String, String> get selectedDates => _selectedDates;
//
//   void updateDate(String member, String dob) {
//     _selectedDates[member] = dob;
//     notifyListeners();
//   }
//
//   void removeChild(String childType) {
//     _selectedDates.remove(childType);
//     notifyListeners();
//   }
//
//   int getSonCount() {
//     return _selectedDates.keys.where((key) => key.startsWith('Son')).length;
//   }
//
//   int getDaughterCount() {
//     return _selectedDates.keys
//         .where((key) => key.startsWith('Daughter'))
//         .length;
//   }
// }
