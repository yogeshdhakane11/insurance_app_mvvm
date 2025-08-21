import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../res/component/custum_textform_field.dart';
import '../../../res/component/round_button.dart';
import '../viewmodel/plan_detail_viewmodel.dart';

class PlanDetailsScreen extends StatelessWidget {
  const PlanDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlanDetailViewModel(),
      child: Consumer<PlanDetailViewModel>(
        builder: (context, viewModel, _) {
          return DraggableScrollableSheet(
            initialChildSize: 0.72,
            minChildSize: 0.5,
            maxChildSize: 0.72,
            expand: false,
            builder: (context, scrollController) {
              double screenWidth = MediaQuery.of(context).size.width;
              double screenHeight = MediaQuery.of(context).size.height;

              return Material(
                elevation: 4,
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.06,
                        vertical: screenHeight * 0.014,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Plan Details",
                            style: TextStyle(
                              fontSize: screenWidth * 0.055,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Form(
                        child: ListView(
                          controller: scrollController,
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.05,
                          ),
                          children: [
                            const Text(
                              "Add details for your personalized plan",
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: screenHeight * 0.014),
                            CustomTextFormField(
                              label: 'Plan Nick Name',
                              hintText: 'Enter plan nickname',
                              controller: TextEditingController(
                                text: viewModel.planName,
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter the name';
                                }
                                return null;
                              },
                              onChanged: (value) =>
                                  viewModel.updatePlanName(value),
                            ),
                            SizedBox(height: screenHeight * 0.014),
                            GestureDetector(
                              onTap: () => _showCupertinoDatePicker(
                                context: context,
                                title: "Valid From",
                                initialDate: DateTime.now(),
                                onDateSelected: (selectedDate) {
                                  viewModel.updateValidFrom(
                                    DateFormat(
                                      'dd-MMM-yyyy',
                                    ).format(selectedDate),
                                  );
                                },
                              ),
                              child: AbsorbPointer(
                                child: CustomTextFormField(
                                  label: 'Valid From Date',
                                  hintText: 'Select date',
                                  controller: TextEditingController(
                                    text: viewModel.validFrom,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'Select Valid From Date';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.014),
                            GestureDetector(
                              onTap: () => _showCupertinoDatePicker(
                                context: context,
                                title: "Valid Till",
                                initialDate: DateTime.now(),
                                onDateSelected: (selectedDate) {
                                  viewModel.updateValidTill(
                                    DateFormat(
                                      'dd-MMM-yyyy',
                                    ).format(selectedDate),
                                  );
                                },
                              ),
                              child: AbsorbPointer(
                                child: CustomTextFormField(
                                  label: 'Valid Till Date',
                                  hintText: 'Select date',
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'Select Valid Till Date';
                                    }
                                    return null;
                                  },
                                  controller: TextEditingController(
                                    text: viewModel.validTill,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.014,
                              ),
                              padding: EdgeInsets.all(screenWidth * 0.04),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Policy Document",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.044,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  const Text(
                                    "Upload your policy document for proof",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        vertical: screenHeight * 0.02,
                                        horizontal: screenWidth * 0.18,
                                      ),
                                    ),
                                    onPressed: () => _showPickerBottomSheet(
                                      context,
                                      viewModel,
                                    ),
                                    icon: const Icon(Icons.upload_file),
                                    label: Text(
                                      "Upload",
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.04,
                                      ),
                                    ),
                                  ),
                                  if (viewModel.selectedFilePath != null) ...[
                                    SizedBox(height: screenHeight * 0.02),
                                    Text(
                                      "Selected File: ${viewModel.selectedFilePath}",
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.04,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            RoundButton(
                              title: "Submit",
                              width: double.infinity,
                              onPress: viewModel.submitPlanDetails,
                            ),
                            // SizedBox(height: screenHeight * 0.02),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _showCupertinoDatePicker({
    required BuildContext context,
    required String title,
    required DateTime initialDate,
    required ValueChanged<DateTime> onDateSelected,
  }) async {
    DateTime selectedDate = initialDate;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: initialDate,
                  onDateTimeChanged: (DateTime date) {
                    selectedDate = date;
                  },
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  onPressed: () {
                    onDateSelected(selectedDate);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showPickerBottomSheet(
    BuildContext context,
    PlanDetailViewModel viewModel,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return SizedBox(
          height: 150,
          child: Column(
            children: [
              const ListTile(title: Text("Choose One")),
              ListTile(
                leading: const Icon(Icons.image_search_outlined),
                title: const Text("Choose file"),
                onTap: () async {
                  Navigator.pop(context);
                  FilePickerResult? result = await FilePicker.platform
                      .pickFiles();
                  if (result != null && result.files.single.path != null) {
                    viewModel.updateSelectedFile(result.files.single.path);
                    debugPrint("Selected file: ${result.files.single.name}");
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// import '../../../res/component/custum_textform_field.dart';
// import '../../../res/component/round_button.dart';
//
// class PlanDetailsScreen extends StatefulWidget {
//   const PlanDetailsScreen({super.key});
//
//   @override
//   State<PlanDetailsScreen> createState() => _PlanDetailsScreenState();
// }
//
// class _PlanDetailsScreenState extends State<PlanDetailsScreen> {
//   final TextEditingController planNameController = TextEditingController();
//   final TextEditingController validFromController = TextEditingController();
//   final TextEditingController validTillController = TextEditingController();
//
//   final _formKey = GlobalKey<FormState>();
//
//   // Date picker bottom sheet show
//   Future<void> showCupertinoDatePicker({
//     required BuildContext context,
//     required String title,
//     required DateTime initialDate,
//     required ValueChanged<DateTime> onDateSelected,
//   }) async {
//     DateTime selectedDate = initialDate;
//
//     await showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.only(
//             top: 16,
//             left: 16,
//             right: 16,
//             bottom: 24,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.close),
//                     onPressed: () => Navigator.pop(context),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 200,
//                 child: CupertinoDatePicker(
//                   mode: CupertinoDatePickerMode.date,
//                   initialDateTime: initialDate,
//                   onDateTimeChanged: (DateTime date) {
//                     selectedDate = date;
//                   },
//                 ),
//               ),
//               const SizedBox(height: 16),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     padding: EdgeInsets.symmetric(vertical: 14),
//                     backgroundColor: Colors.blue,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(7),
//                     ),
//                   ),
//                   onPressed: () {
//                     onDateSelected(selectedDate);
//                     Navigator.pop(context);
//                   },
//                   child: const Text(
//                     "Save",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   PlatformFile? _selectedFile;
//
//   void _showPickerBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (ctx) {
//         return SizedBox(
//           height: 150,
//           child: Column(
//             children: [
//               const ListTile(title: Text("Choose One")),
//               ListTile(
//                 leading: const Icon(Icons.image_search_outlined),
//                 title: const Text("Choose file"),
//                 onTap: () async {
//                   Navigator.pop(context);
//                   FilePickerResult? result = await FilePicker.platform
//                       .pickFiles();
//                   if (result != null && result.files.single.path != null) {
//                     setState(() {
//                       _selectedFile = result.files.single;
//                     });
//                     debugPrint("Selected file: ${_selectedFile!.name}");
//                   }
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Get screen size for responsiveness
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//
//     return DraggableScrollableSheet(
//       initialChildSize: 0.7,
//       minChildSize: 0.5,
//       maxChildSize: 0.75,
//       expand: false,
//       builder: (context, scrollController) {
//         return Material(
//           elevation: 4,
//           color: Colors.white,
//           borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal:
//                       screenWidth * 0.06, // Responsive horizontal padding
//                   vertical: screenHeight * 0.02, // Responsive vertical padding
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Plan Details",
//                       style: TextStyle(
//                         fontSize: screenWidth * 0.055, // Responsive font size
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.close),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Form(
//                   key: _formKey,
//                   child: ListView(
//                     controller: scrollController,
//                     padding: EdgeInsets.symmetric(
//                       horizontal: screenWidth * 0.05,
//                     ), // Responsive padding
//                     children: [
//                       const Text(
//                         "Add details for your personalized plan",
//                         style: TextStyle(fontSize: 14),
//                       ),
//                       SizedBox(
//                         height: screenHeight * 0.01,
//                       ), // Responsive spacing
//                       CustomTextFormField(
//                         label: 'Plan Nick Name',
//                         hintText: 'Enter plan nickname',
//                         controller: planNameController,
//                         validator: (value) {
//                           if (value == null || value.trim().isEmpty) {
//                             return 'Please enter the name';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(
//                         height: screenHeight * 0.02,
//                       ), // Responsive spacing
//                       GestureDetector(
//                         onTap: () => showCupertinoDatePicker(
//                           context: context,
//                           title: "Valid From",
//                           initialDate: DateTime.now(),
//                           onDateSelected: (selectedDate) {
//                             validFromController.text = DateFormat(
//                               'dd-MMM-yyyy',
//                             ).format(selectedDate);
//                           },
//                         ),
//                         child: AbsorbPointer(
//                           child: CustomTextFormField(
//                             label: 'Valid From Date',
//                             hintText: 'Select date',
//                             controller: validFromController,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: screenHeight * 0.02,
//                       ), // Responsive spacing
//                       GestureDetector(
//                         onTap: () => showCupertinoDatePicker(
//                           context: context,
//                           title: "Valid Till",
//                           initialDate: DateTime.now(),
//                           onDateSelected: (selectedDate) {
//                             validTillController.text = DateFormat(
//                               'dd-MMM-yyyy',
//                             ).format(selectedDate);
//                           },
//                         ),
//                         child: AbsorbPointer(
//                           child: CustomTextFormField(
//                             label: 'Valid Till Date',
//                             hintText: 'Select date',
//                             controller: validTillController,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.symmetric(
//                           vertical: screenHeight * 0.03,
//                         ), // Responsive margin
//                         padding: EdgeInsets.all(
//                           screenWidth * 0.04,
//                         ), // Responsive padding
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(12.0),
//                           border: Border.all(color: Colors.grey.shade300),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Policy Document",
//                               style: TextStyle(
//                                 fontSize:
//                                     screenWidth * 0.044, // Responsive font size
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(
//                               height: screenHeight * 0.01,
//                             ), // Responsive spacing
//                             const Text(
//                               "Upload your policy document for proof",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             SizedBox(
//                               height: screenHeight * 0.01,
//                             ), // Responsive spacing
//                             ElevatedButton.icon(
//                               style: ElevatedButton.styleFrom(
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8.0),
//                                 ),
//                                 padding: EdgeInsets.symmetric(
//                                   vertical: screenHeight * 0.02,
//                                   horizontal: screenWidth * 0.18,
//                                 ),
//                               ),
//                               onPressed: () => _showPickerBottomSheet(context),
//                               icon: const Icon(Icons.upload_file),
//                               label: Text(
//                                 "Upload",
//                                 style: TextStyle(
//                                   fontSize: screenWidth * 0.04,
//                                 ), // Responsive font size
//                               ),
//                             ),
//                             if (_selectedFile != null) ...[
//                               SizedBox(
//                                 height: screenHeight * 0.02,
//                               ), // Responsive spacing
//                               Text(
//                                 "Selected File: ${_selectedFile!.name}",
//                                 style: TextStyle(
//                                   fontSize:
//                                       screenWidth *
//                                       0.04, // Responsive font size
//                                   color: Colors.black54,
//                                 ),
//                               ),
//                             ],
//                           ],
//                         ),
//                       ),
//                       RoundButton(
//                         title: "Submit",
//                         width: double.infinity,
//                         onPress: () {
//                           final inputDateFormat = DateFormat('dd-MMM-yyyy');
//                           final outputDateFormat = DateFormat('yyyy-MM-dd');
//
//                           final validFromDate = inputDateFormat.parse(
//                             validFromController.text.trim(),
//                           );
//                           final validTillDate = inputDateFormat.parse(
//                             validTillController.text.trim(),
//                           );
//
//                           final Map<String, dynamic> body = {
//                             "plan_nick_name": planNameController.text.trim(),
//                             "valid_from": outputDateFormat.format(
//                               validFromDate,
//                             ),
//                             "valid_till": outputDateFormat.format(
//                               validTillDate,
//                             ),
//                             "policy_document": _selectedFile!.path,
//                           };
//
//                           debugPrint('Body Data: $body');
//                           planDetailsApi(body, context);
//                         },
//                       ),
//                       SizedBox(
//                         height: screenHeight * 0.02,
//                       ), // Responsive spacing
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
