import 'package:flutter/cupertino.dart';

import '../../../repositories/mypolicy_repository.dart';
import '../../../utils/utils.dart';

class MyPolicyViewModel extends ChangeNotifier {
  final MyPolicyRepository _myPolicyRepository = MyPolicyRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<dynamic> _cards = [];
  List<dynamic> get cards => _cards;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> fetchPolicyCards(BuildContext context) async {
    try {
      isLoading = true;
      final response = await _myPolicyRepository.getCardApi();

      if (response != null && response is List) {
        _cards = response;
        debugPrint("✅ Cards loaded: ${_cards.length}");
      } else {
        Utils.showFlushBar(context, "Something went wrong");
      }
    } catch (e) {
      Utils.showFlushBar(context, "Exception: ${e.toString()}");
      debugPrint("❌ Error: $e");
    } finally {
      isLoading = false;
    }
  }
}

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
//
// import '../../../repositories/mypolicy_repository.dart';
// import '../../../utils/utils.dart';
//
// class MyPolicyViewModel extends ChangeNotifier {
//   final MyPolicyRepository _myPolicyRepository = MyPolicyRepository();
//
//   bool _isLoading = true;
//   bool get isLoading => _isLoading;
//
//   set isLoading(bool value) {
//     _isLoading = value;
//     notifyListeners();
//   }
//
//   Future<void> getCardDetailApi(BuildContext context) async {
//     try {
//       final response = await _myPolicyRepository.getCardApi();
//
//       if (response != null && response['id'] != null) {
//         if (kDebugMode) {
//           debugPrint("✅ Card Display Successfully");
//         }
//       } else {
//         Utils.showFlushBar(context, "Something went wrong");
//       }
//     } catch (e) {
//       Utils.showFlushBar(context, "Exception: ${e.toString()}");
//       debugPrint("❌ Exception: $e");
//     }
//   }
// }
