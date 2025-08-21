import 'package:flutter/material.dart';
import 'package:insurance/routes/routes_name.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../res/component/custum_textform_field.dart';
import '../../../../../res/component/round_button.dart';
import '../../../../../utils/utils.dart';
import '../viewmodel/pesonalized_viewmodel.dart';

class PersonalizeBottomSheet extends StatelessWidget {
  const PersonalizeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PersonalizeViewModel>(context);

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.85,
      minChildSize: 0.4,
      maxChildSize: 0.90,
      builder: (context, scrollController) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).unfocus(),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Scaffold(
              backgroundColor: Colors.white,
              resizeToAvoidBottomInset: true,
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    children: [
                      // ✅ Header
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Personalize",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                          const Text(
                            "Hi Yogesh, Share basic info of the policy buyer.",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),

                      // ✅ Scrollable content
                      Expanded(
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextFormField(
                                label: "Enter Name as per ID proof",
                                hintText: "Name",
                                controller: viewModel.nameController,
                                validator: (value) => value!.isEmpty
                                    ? "Please enter your name"
                                    : null,
                              ),
                              const SizedBox(height: 12),
                              CustomTextFormField(
                                label: "Enter Mobile Number",
                                hintText: "Mobile Number",
                                controller: viewModel.mobileController,
                                keyboardType: TextInputType.phone,
                                validator: (value) => value!.length != 10
                                    ? "Enter valid 10-digit number"
                                    : null,
                              ),
                              const SizedBox(height: 12),
                              CustomTextFormField(
                                label: "Enter Email",
                                hintText: "Email",
                                controller: viewModel.emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) => value!.contains("@")
                                    ? null
                                    : "Enter valid email",
                              ),
                              const SizedBox(height: 12),
                              CustomTextFormField(
                                label: "Select Date of Birth",
                                hintText: "DOB",
                                controller: viewModel.dobController,
                                readOnly: true,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime(2000),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                  );
                                  if (pickedDate != null) {
                                    String formattedDate = DateFormat(
                                      'yyyy-MM-dd',
                                    ).format(pickedDate);
                                    viewModel.dobController.text =
                                        formattedDate;
                                  }
                                },
                                suffixIcon: const Icon(Icons.calendar_today),
                                validator: (value) => value!.isEmpty
                                    ? "Please select date of birth"
                                    : null,
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                "Select Education Level",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 6),
                              DropdownButtonFormField<String>(
                                value: viewModel.selectedEducation,
                                items: viewModel.educationLevels
                                    .map(
                                      (level) => DropdownMenuItem(
                                        value: level,
                                        child: Text(level),
                                      ),
                                    )
                                    .toList(),
                                onChanged: viewModel.setEducation,
                                decoration: const InputDecoration(
                                  hintText: "Education Level",
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 16,
                                  ),
                                ),
                                validator: (value) => value == null
                                    ? "Please select education level"
                                    : null,
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                "Select Occupation",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 6),
                              DropdownButtonFormField<String>(
                                value: viewModel.selectedOccupation,
                                items: viewModel.occupations
                                    .map(
                                      (occ) => DropdownMenuItem(
                                        value: occ,
                                        child: Text(occ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: viewModel.setOccupation,
                                decoration: const InputDecoration(
                                  hintText: "Occupation",
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 16,
                                  ),
                                ),
                                validator: (value) => value == null
                                    ? "Please select occupation"
                                    : null,
                              ),
                              const SizedBox(height: 12),
                              const Text("Select Annual Income"),
                              const SizedBox(height: 6),
                              DropdownButtonFormField<String>(
                                value: viewModel.selectedIncome,
                                items: viewModel.incomes
                                    .map(
                                      (income) => DropdownMenuItem(
                                        value: income,
                                        child: Text(income),
                                      ),
                                    )
                                    .toList(),
                                onChanged: viewModel.setIncome,
                                decoration: const InputDecoration(
                                  hintText: "Annual Income",
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 14,
                                  ),
                                ),
                                validator: (value) => value == null
                                    ? "Please select annual income"
                                    : null,
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                "Have you ever smoked or consumed tobacco?",
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio<bool>(
                                    value: true,
                                    groupValue: viewModel.hasSmoked,
                                    onChanged: viewModel.setSmokingStatus,
                                  ),
                                  const Text("Yes"),
                                  const SizedBox(width: 20),
                                  Radio<bool>(
                                    value: false,
                                    groupValue: viewModel.hasSmoked,
                                    onChanged: viewModel.setSmokingStatus,
                                  ),
                                  const Text("No"),
                                ],
                              ),
                              const SizedBox(height: 12),
                              const Text("Select Marital Status"),
                              DropdownButtonFormField<String>(
                                value: viewModel.maritalStatus,
                                items: viewModel.maritalStatusList
                                    .map(
                                      (status) => DropdownMenuItem(
                                        value: status,
                                        child: Text(status),
                                      ),
                                    )
                                    .toList(),
                                onChanged: viewModel.setMaritalStatus,
                                decoration: const InputDecoration(
                                  hintText: 'Marital Status',
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 14,
                                  ),
                                ),
                                validator: (value) => value == null
                                    ? "Please select marital status"
                                    : null,
                              ),
                              const SizedBox(height: 12),
                              const Text("Select Gender"),
                              DropdownButtonFormField<String>(
                                value: viewModel.gender,
                                items: viewModel.genders
                                    .map(
                                      (gender) => DropdownMenuItem(
                                        value: gender,
                                        child: Text(gender),
                                      ),
                                    )
                                    .toList(),
                                onChanged: viewModel.setGender,
                                decoration: const InputDecoration(
                                  hintText: 'Gender',
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 14,
                                  ),
                                ),
                                validator: (value) => value == null
                                    ? "Please select gender"
                                    : null,
                              ),
                              const SizedBox(height: 12),
                              CustomTextFormField(
                                label: "Enter PIN Code",
                                hintText: "PIN Code",
                                controller: viewModel.pinCodeController,
                                keyboardType: TextInputType.number,
                                validator: (value) =>
                                    value!.isEmpty ? "Enter PIN Code" : null,
                              ),
                              const SizedBox(height: 24),
                              Consumer<PersonalizeViewModel>(
                                builder: (context, viewModel, _) {
                                  return RoundButton(
                                    title: "Next",
                                    color: Colors.blue,
                                    loading: viewModel.loading,
                                    width: double.infinity,
                                    onPress: () {
                                      if (viewModel
                                              .nameController
                                              .text
                                              .isEmpty ||
                                          viewModel
                                              .mobileController
                                              .text
                                              .isEmpty ||
                                          viewModel
                                              .dobController
                                              .text
                                              .isEmpty ||
                                          viewModel
                                              .pinCodeController
                                              .text
                                              .isEmpty) {
                                        Utils.showSnackBar(
                                          context,
                                          "All fields are required",
                                        );
                                      } else {
                                        // Navigate
                                        Navigator.pushNamed(
                                          context,
                                          RouteNames.termPlanScreen,
                                        );

                                        // Map<String, dynamic> body = {
                                        //   "name": viewModel.nameController.text
                                        //       .trim(),
                                        //   "mobile_number": viewModel
                                        //       .mobileController
                                        //       .text
                                        //       .trim(),
                                        //   "email": viewModel
                                        //       .emailController
                                        //       .text
                                        //       .trim(),
                                        //   "date_of_birth": viewModel
                                        //       .dobController
                                        //       .text
                                        //       .trim(),
                                        //   "education_level":
                                        //       viewModel.selectedEducation,
                                        //   "occupation":
                                        //       viewModel.selectedOccupation,
                                        //   "annual_income":
                                        //       viewModel.selectedIncome,
                                        //   "tobacco_use":
                                        //       viewModel.hasSmoked == true
                                        //       ? "Yes"
                                        //       : "No",
                                        //   "marital_status":
                                        //       viewModel.maritalStatus,
                                        //   "gender": viewModel.gender,
                                        //   "pin_code": viewModel
                                        //       .pinCodeController
                                        //       .text
                                        //       .trim(),
                                        // };
                                        // viewModel.termRegisterApi(
                                        //   body,
                                        //   context,
                                        // );
                                      }
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
