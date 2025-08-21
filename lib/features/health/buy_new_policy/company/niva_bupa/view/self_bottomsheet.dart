import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/self_viewmodel.dart';

class NivaBupaSelfBottomSheet extends StatelessWidget {
  NivaBupaSelfBottomSheet({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (context) => NivaSelfViewModel(),
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.7,
        minChildSize: 0.4,
        maxChildSize: 0.90,
        builder: (context, scrollController) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FocusScope.of(context).unfocus(),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  screenWidth * 0.05,
                ), // 5% of screen width
                topRight: Radius.circular(
                  screenWidth * 0.05,
                ), // 5% of screen width
              ),
              child: Scaffold(
                backgroundColor: Colors.white,
                body: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04, // 4% of screen width
                    vertical: screenHeight * 0.015, // 1.5% of screen height
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Header with Title and Close button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Self",
                              style: TextStyle(
                                fontSize:
                                    screenWidth * 0.05, // 5% of screen width
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
                          height: screenHeight * 0.015,
                        ), // 1.5% of screen height
                        // Scrollable content
                        Expanded(
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Consumer<NivaSelfViewModel>(
                              builder: (context, viewModel, child) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: screenHeight * 0.01375,
                                    ), // 1.375% of screen height
                                    // First Name and Last Name Fields
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller:
                                                viewModel.firstNameController,
                                            decoration: InputDecoration(
                                              labelText: "First Name",
                                              hintText: "Enter as per PAN Card",
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      screenWidth * 0.02,
                                                    ), // 2% of screen width
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "Please enter first name";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.04,
                                        ), // 4% of screen width
                                        Expanded(
                                          child: TextFormField(
                                            controller:
                                                viewModel.lastNameController,
                                            decoration: InputDecoration(
                                              labelText: "Last Name",
                                              hintText: "Enter as per PAN Card",
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      screenWidth * 0.02,
                                                    ), // 2% of screen width
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "Please enter last name";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.015,
                                    ), // 1.5% of screen height
                                    // Gender Dropdown
                                    DropdownButtonFormField<String>(
                                      value: viewModel.gender,
                                      items: ['Male', 'Female', 'Other']
                                          .map(
                                            (gender) => DropdownMenuItem(
                                              value: gender,
                                              child: Text(gender),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (value) =>
                                          viewModel.updateGender(value),
                                      decoration: InputDecoration(
                                        labelText: 'Gender',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            screenWidth * 0.02,
                                          ), // 2% of screen width
                                        ),
                                      ),
                                      validator: (value) => value == null
                                          ? "Please select gender"
                                          : null,
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.015,
                                    ), // 1.5% of screen height
                                    // Height and Weight Fields
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller:
                                                viewModel.heightController,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              labelText: "Height (cm)",
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      screenWidth * 0.02,
                                                    ), // 2% of screen width
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "Please enter height";
                                              }
                                              if (double.tryParse(value) ==
                                                  null) {
                                                return "Please enter a valid number";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.04,
                                        ), // 4% of screen width
                                        Expanded(
                                          child: TextFormField(
                                            controller:
                                                viewModel.weightController,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              labelText: "Weight (kg)",
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      screenWidth * 0.02,
                                                    ), // 2% of screen width
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "Please enter weight";
                                              }
                                              if (double.tryParse(value) ==
                                                  null) {
                                                return "Please enter a valid number";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.015,
                                    ), // 1.5% of screen height
                                    // Educational Qualification Dropdown
                                    DropdownButtonFormField<String>(
                                      value: viewModel.educationalQualification,
                                      items:
                                          [
                                                '10th Pass',
                                                '12th Pass',
                                                'Graduate',
                                                'Post Graduate',
                                                'Doctorate',
                                              ]
                                              .map(
                                                (qual) => DropdownMenuItem(
                                                  value: qual,
                                                  child: Text(qual),
                                                ),
                                              )
                                              .toList(),
                                      onChanged: (value) => viewModel
                                          .updateEducationalQualification(
                                            value,
                                          ),
                                      decoration: InputDecoration(
                                        labelText: 'Educational Qualification',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            screenWidth * 0.02,
                                          ), // 2% of screen width
                                        ),
                                      ),
                                      validator: (value) => value == null
                                          ? "Please select educational qualification"
                                          : null,
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.015,
                                    ), // 1.5% of screen height
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        // Submit button
                        SizedBox(
                          height: screenHeight * 0.02,
                        ), // 2% of screen height
                        SizedBox(
                          width: double.infinity,
                          child: Consumer<NivaSelfViewModel>(
                            builder: (context, viewModel, child) {
                              return ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    viewModel.submit();
                                    Navigator.pop(context);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  padding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.01375,
                                  ), // 1.375% of screen height
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      screenWidth * 0.02,
                                    ), // 2% of screen width
                                  ),
                                ),
                                child: Text(
                                  'Continue',
                                  style: TextStyle(
                                    fontSize:
                                        screenWidth *
                                        0.045, // 4.5% of screen width
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },
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
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class NivaBupaSelfBottomSheet extends StatefulWidget {
//   const NivaBupaSelfBottomSheet({Key? key}) : super(key: key);
//
//   @override
//   State<NivaBupaSelfBottomSheet> createState() =>
//       _NivaBupaSelfBottomSheetState();
// }
//
// class _NivaBupaSelfBottomSheetState extends State<NivaBupaSelfBottomSheet> {
//   String? _selectedGender;
//   String? _selectedEducationalQualification;
//
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   final TextEditingController _heightController = TextEditingController();
//   final TextEditingController _weightController = TextEditingController();
//
//   @override
//   void dispose() {
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     _heightController.dispose();
//     _weightController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       // Wrap the entire bottom sheet in Material widget
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(
//             bottom: MediaQuery.of(context).viewInsets.bottom,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       'Self',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.close),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           child: _buildTextField(
//                             controller: _firstNameController,
//                             labelText: 'First Name',
//                             hintText: 'Enter as per PAN Card',
//                           ),
//                         ),
//                         const SizedBox(width: 16.0),
//                         Expanded(
//                           child: _buildTextField(
//                             controller: _lastNameController,
//                             labelText: 'Last name',
//                             hintText: 'Enter as per PAN Card',
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16.0),
//                     _buildDropdownField(
//                       labelText: 'Gender',
//                       value: _selectedGender,
//                       items: ['Male', 'Female', 'Other'],
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           _selectedGender = newValue;
//                         });
//                       },
//                     ),
//                     const SizedBox(height: 16.0),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: _buildTextField(
//                             controller: _heightController,
//                             labelText: 'Height(cm)',
//                             keyboardType: TextInputType.number,
//                           ),
//                         ),
//                         const SizedBox(width: 16.0),
//                         Expanded(
//                           child: _buildTextField(
//                             controller: _weightController,
//                             labelText: 'Weight(kg)',
//                             keyboardType: TextInputType.number,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16.0),
//                     _buildDropdownField(
//                       labelText: 'Educational Qualification',
//                       value: _selectedEducationalQualification,
//                       items: [
//                         '10th Pass',
//                         '12th Pass',
//                         'Graduate',
//                         'Post Graduate',
//                         'Doctorate',
//                       ],
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           _selectedEducationalQualification = newValue;
//                         });
//                       },
//                     ),
//                     const SizedBox(height: 24.0),
//                   ],
//                 ),
//               ),
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(16.0),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Handle continue button press
//                     print('First Name: ${_firstNameController.text}');
//                     print('Last Name: ${_lastNameController.text}');
//                     print('Gender: $_selectedGender');
//                     print('Height: ${_heightController.text}');
//                     print('Weight: ${_weightController.text}');
//                     print(
//                       'Educational Qualification: $_selectedEducationalQualification',
//                     );
//                     Navigator.pop(context); // Close the bottom sheet
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue, // Example button color
//                     foregroundColor: Colors.white, // Example text color
//                     padding: const EdgeInsets.symmetric(vertical: 16.0),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                   child: const Text('Continue', style: TextStyle(fontSize: 18)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String labelText,
//     String? hintText,
//     TextInputType keyboardType = TextInputType.text,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         TextField(
//           controller: controller,
//           keyboardType: keyboardType,
//           decoration: InputDecoration(
//             labelText: labelText,
//             hintText: hintText,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8.0),
//               borderSide: const BorderSide(color: Colors.grey),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8.0),
//               borderSide: const BorderSide(color: Colors.grey),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8.0),
//               borderSide: const BorderSide(color: Colors.blue),
//             ),
//             contentPadding: const EdgeInsets.symmetric(
//               horizontal: 12.0,
//               vertical: 12.0,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDropdownField({
//     required String labelText,
//     required String? value,
//     required List<String> items,
//     required ValueChanged<String?> onChanged,
//   }) {
//     return Material(
//       child: DropdownButtonFormField<String>(
//         value: value,
//         decoration: InputDecoration(
//           labelText: labelText,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.0),
//             borderSide: const BorderSide(color: Colors.grey),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.0),
//             borderSide: const BorderSide(color: Colors.grey),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.0),
//             borderSide: const BorderSide(color: Colors.blue),
//           ),
//           contentPadding: const EdgeInsets.symmetric(
//             horizontal: 12.0,
//             vertical: 12.0,
//           ),
//         ),
//         icon: const Icon(Icons.keyboard_arrow_down),
//         onChanged: onChanged,
//         items: items.map<DropdownMenuItem<String>>((String item) {
//           return DropdownMenuItem<String>(value: item, child: Text(item));
//         }).toList(),
//       ),
//     );
//   }
// }
//
// // import 'package:flutter/material.dart';
// //
// // class NivaBupaSelfBottomSheet extends StatefulWidget {
// //   const NivaBupaSelfBottomSheet({Key? key}) : super(key: key);
// //
// //   @override
// //   State<NivaBupaSelfBottomSheet> createState() =>
// //       _NivaBupaSelfBottomSheetState();
// // }
// //
// // class _NivaBupaSelfBottomSheetState extends State<NivaBupaSelfBottomSheet> {
// //   String? _selectedGender;
// //   String? _selectedEducationalQualification;
// //
// //   final TextEditingController _firstNameController = TextEditingController();
// //   final TextEditingController _lastNameController = TextEditingController();
// //   final TextEditingController _heightController = TextEditingController();
// //   final TextEditingController _weightController = TextEditingController();
// //
// //   @override
// //   void dispose() {
// //     _firstNameController.dispose();
// //     _lastNameController.dispose();
// //     _heightController.dispose();
// //     _weightController.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return SingleChildScrollView(
// //       child: Padding(
// //         padding: EdgeInsets.only(
// //           bottom: MediaQuery.of(context).viewInsets.bottom,
// //         ),
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Padding(
// //               padding: const EdgeInsets.all(16.0),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   const Text(
// //                     'Self',
// //                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //                   ),
// //                   IconButton(
// //                     icon: const Icon(Icons.close),
// //                     onPressed: () {
// //                       Navigator.pop(context);
// //                     },
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //               child: Column(
// //                 children: [
// //                   Row(
// //                     children: [
// //                       Expanded(
// //                         child: _buildTextField(
// //                           controller: _firstNameController,
// //                           labelText: 'First Name',
// //                           hintText: 'Enter as per PAN Card',
// //                         ),
// //                       ),
// //                       const SizedBox(width: 16.0),
// //                       Expanded(
// //                         child: _buildTextField(
// //                           controller: _lastNameController,
// //                           labelText: 'Last name',
// //                           hintText: 'Enter as per PAN Card',
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                   const SizedBox(height: 16.0),
// //                   _buildDropdownField(
// //                     labelText: 'Gender',
// //                     value: _selectedGender,
// //                     items: ['Male', 'Female', 'Other'],
// //                     onChanged: (String? newValue) {
// //                       setState(() {
// //                         _selectedGender = newValue;
// //                       });
// //                     },
// //                   ),
// //                   const SizedBox(height: 16.0),
// //                   Row(
// //                     children: [
// //                       Expanded(
// //                         child: _buildTextField(
// //                           controller: _heightController,
// //                           labelText: 'Height(cm)',
// //                           keyboardType: TextInputType.number,
// //                         ),
// //                       ),
// //                       const SizedBox(width: 16.0),
// //                       Expanded(
// //                         child: _buildTextField(
// //                           controller: _weightController,
// //                           labelText: 'Weight(kg)',
// //                           keyboardType: TextInputType.number,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                   const SizedBox(height: 16.0),
// //                   _buildDropdownField(
// //                     labelText: 'Educational Qualification',
// //                     value: _selectedEducationalQualification,
// //                     items: [
// //                       '10th Pass',
// //                       '12th Pass',
// //                       'Graduate',
// //                       'Post Graduate',
// //                       'Doctorate',
// //                     ],
// //                     onChanged: (String? newValue) {
// //                       setState(() {
// //                         _selectedEducationalQualification = newValue;
// //                       });
// //                     },
// //                   ),
// //                   const SizedBox(height: 24.0),
// //                 ],
// //               ),
// //             ),
// //             Container(
// //               width: double.infinity,
// //               padding: const EdgeInsets.all(16.0),
// //               child: ElevatedButton(
// //                 onPressed: () {
// //                   // Handle continue button press
// //                   print('First Name: ${_firstNameController.text}');
// //                   print('Last Name: ${_lastNameController.text}');
// //                   print('Gender: $_selectedGender');
// //                   print('Height: ${_heightController.text}');
// //                   print('Weight: ${_weightController.text}');
// //                   print(
// //                     'Educational Qualification: $_selectedEducationalQualification',
// //                   );
// //                   Navigator.pop(context); // Close the bottom sheet
// //                 },
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: Colors.blue, // Example button color
// //                   foregroundColor: Colors.white, // Example text color
// //                   padding: const EdgeInsets.symmetric(vertical: 16.0),
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(8.0),
// //                   ),
// //                 ),
// //                 child: const Text('Continue', style: TextStyle(fontSize: 18)),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildTextField({
// //     required TextEditingController controller,
// //     required String labelText,
// //     String? hintText,
// //     TextInputType keyboardType = TextInputType.text,
// //   }) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         TextField(
// //           controller: controller,
// //           keyboardType: keyboardType,
// //           decoration: InputDecoration(
// //             labelText: labelText,
// //             hintText: hintText,
// //             border: OutlineInputBorder(
// //               borderRadius: BorderRadius.circular(8.0),
// //               borderSide: const BorderSide(color: Colors.grey),
// //             ),
// //             enabledBorder: OutlineInputBorder(
// //               borderRadius: BorderRadius.circular(8.0),
// //               borderSide: const BorderSide(color: Colors.grey),
// //             ),
// //             focusedBorder: OutlineInputBorder(
// //               borderRadius: BorderRadius.circular(8.0),
// //               borderSide: const BorderSide(color: Colors.blue),
// //             ),
// //             contentPadding: const EdgeInsets.symmetric(
// //               horizontal: 12.0,
// //               vertical: 12.0,
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   Widget _buildDropdownField({
// //     required String labelText,
// //     required String? value,
// //     required List<String> items,
// //     required ValueChanged<String?> onChanged,
// //   }) {
// //     return DropdownButtonFormField<String>(
// //       value: value,
// //       decoration: InputDecoration(
// //         labelText: labelText,
// //         border: OutlineInputBorder(
// //           borderRadius: BorderRadius.circular(8.0),
// //           borderSide: const BorderSide(color: Colors.grey),
// //         ),
// //         enabledBorder: OutlineInputBorder(
// //           borderRadius: BorderRadius.circular(8.0),
// //           borderSide: const BorderSide(color: Colors.grey),
// //         ),
// //         focusedBorder: OutlineInputBorder(
// //           borderRadius: BorderRadius.circular(8.0),
// //           borderSide: const BorderSide(color: Colors.blue),
// //         ),
// //         contentPadding: const EdgeInsets.symmetric(
// //           horizontal: 12.0,
// //           vertical: 12.0,
// //         ),
// //       ),
// //       icon: const Icon(Icons.keyboard_arrow_down),
// //       onChanged: onChanged,
// //       items: items.map<DropdownMenuItem<String>>((String item) {
// //         return DropdownMenuItem<String>(value: item, child: Text(item));
// //       }).toList(),
// //     );
// //   }
// // }
