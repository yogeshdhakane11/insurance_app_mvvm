import 'package:flutter/material.dart';

class MemberInfoViewModel extends ChangeNotifier {
  int _currentStep = 0;

  int get currentStep => _currentStep;

  void setCurrentStep(int step) {
    if (_currentStep != step) {
      _currentStep = step;
      notifyListeners();
    }
  }

  List<Step> getSteps() => [
    Step(
      title: const Text('Members', style: TextStyle(fontSize: 12)),
      content: Container(),
      isActive: _currentStep >= 0,
      state: _currentStep > 0 ? StepState.complete : StepState.indexed,
    ),
    Step(
      title: const Text('Medical', style: TextStyle(fontSize: 12)),
      content: Container(),
      isActive: _currentStep >= 1,
      state: _currentStep > 1 ? StepState.complete : StepState.indexed,
    ),
    Step(
      title: const Text('Nominee', style: TextStyle(fontSize: 12)),
      content: Container(),
      isActive: _currentStep >= 2,
      state: _currentStep > 2 ? StepState.complete : StepState.indexed,
    ),
  ];

  // Methods for tap handlers if they involve ViewModel state/logic
  void onTapSelf(BuildContext context) {
    print('Tapped on Self - from ViewModel');
    // Example: showModalBottomSheet(context: context, builder: (...) => SelfBottomSheet());
    // You can put navigation logic here or keep it in the widget, depending on preference
  }

  void onTapProposer(BuildContext context) {
    print('Tapped on Proposer - from ViewModel');
    // Example: showModalBottomSheet(context: context, builder: (...) => ProposerBottomSheet());
  }
}
