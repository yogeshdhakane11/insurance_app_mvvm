import 'package:flutter/cupertino.dart';

class CareSupremeMemberInfoScreen_1ViewModel extends ChangeNotifier {
  bool _selfCompleted = false;
  bool _proposerCompleted = false;

  bool get selfCompleted => _selfCompleted;
  bool get proposerCompleted => _proposerCompleted;

  void toggleSelfCompleted() {
    _selfCompleted = !_selfCompleted;
    notifyListeners();
  }

  void toggleProposerCompleted() {
    _proposerCompleted = !_proposerCompleted;
    notifyListeners();
  }
}
