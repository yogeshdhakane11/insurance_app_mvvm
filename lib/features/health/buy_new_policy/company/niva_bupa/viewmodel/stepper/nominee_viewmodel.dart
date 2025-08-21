import 'package:flutter/cupertino.dart';

class NomineeViewModel extends ChangeNotifier {
  // Form controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  // Key
  final formKey = GlobalKey<FormState>();

  String? selectedRelationship;
  bool isAddressSameAsProposer = false;

  void toggleAddressCheckbox(bool value) {
    isAddressSameAsProposer = value;
    notifyListeners();
  }

  void setRelationship(String? value) {
    selectedRelationship = value;
    notifyListeners();
  }

  // Add additional validation methods or API calls as required.
}
