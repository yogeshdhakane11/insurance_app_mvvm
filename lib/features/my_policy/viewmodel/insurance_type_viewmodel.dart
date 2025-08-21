import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../repositories/mypolicy_repository.dart';
import '../../../utils/utils.dart';
import '../policy_screen/plan_detail.dart';

enum InsuranceType { health, term, motor, other }

extension InsuranceTypeExtension on InsuranceType {
  String get displayName {
    switch (this) {
      case InsuranceType.health:
        return "Health Insurance";
      case InsuranceType.term:
        return "Term Insurance";
      case InsuranceType.motor:
        return "Motor Insurance";
      case InsuranceType.other:
        return "Other Insurance";
    }
  }
}

class InsuranceTypeViewModel extends ChangeNotifier {
  // Repository
  final MyPolicyRepository _myPolicyRepository = MyPolicyRepository();

  InsuranceType? _selectedType;

  InsuranceType? get selectedType => _selectedType;

  void setSelectedType(InsuranceType? type) {
    _selectedType = type;
    notifyListeners();
  }

  Future<void> myPolicySendApi(
    Map<String, dynamic> body,
    BuildContext context,
  ) async {
    try {
      debugPrint("🔁 Submitting MyPolicy: $body");

      final response = await _myPolicyRepository.myPolicyRegisterApi(body);

      if (response != null && response['id'] != null) {
        if (kDebugMode) {
          Utils.showSnackBar(context, "MyPolicy Submitted Successfully");
          debugPrint("✅ MyPolicy Submitted Successfully");

          Navigator.pop(context);

          Future.delayed(Duration.zero, () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => PlanDetailsScreen(),
            );
          });
        }
      } else {
        Utils.showFlushBar(context, "Something went wrong");
      }
    } catch (e) {
      Utils.showFlushBar(context, "Exception: ${e.toString()}");
      debugPrint("❌ Exception: $e");
    }
  }
}
