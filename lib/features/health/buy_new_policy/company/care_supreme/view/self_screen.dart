import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/self_viewmodel.dart';

class CareSupremeSelfBottomSheet extends StatelessWidget {
  const CareSupremeSelfBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery for responsive sizing
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) => CareSupremeSelfViewModel(),
      child: Consumer<CareSupremeSelfViewModel>(
        builder: (context, viewModel, _) {
          return DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.4,
            maxChildSize: 0.5,
            expand: false,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(screenWidth * 0.05),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Drag Handle
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(
                              bottom: screenHeight * 0.02,
                            ),
                            width: screenWidth * 0.1,
                            height: screenHeight * 0.005,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(
                                screenWidth * 0.005,
                              ),
                            ),
                          ),
                        ),
                        // Header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Self Details',
                              style: TextStyle(
                                fontSize: screenWidth * 0.05,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.close, size: screenWidth * 0.06),
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                ); // Close the bottom sheet
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        // Form Fields
                        Form(
                          key: viewModel.formKey,
                          child: Column(
                            children: [
                              // First Name and Last Name in One Row
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: viewModel.firstNameController,
                                      decoration: InputDecoration(
                                        labelText: 'First Name',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            screenWidth * 0.02,
                                          ),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: screenHeight * 0.0125,
                                          horizontal: screenWidth * 0.03,
                                        ),
                                        labelStyle: TextStyle(
                                          fontSize: screenWidth * 0.035,
                                        ),
                                      ),
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.04,
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your first name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.04),
                                  Expanded(
                                    child: TextFormField(
                                      controller: viewModel.lastNameController,
                                      decoration: InputDecoration(
                                        labelText: 'Last Name',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            screenWidth * 0.02,
                                          ),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: screenHeight * 0.0125,
                                          horizontal: screenWidth * 0.03,
                                        ),
                                        labelStyle: TextStyle(
                                          fontSize: screenWidth * 0.035,
                                        ),
                                      ),
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.04,
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your last name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              // Gender Dropdown
                              DropdownButtonFormField<String>(
                                value: viewModel.gender,
                                decoration: InputDecoration(
                                  labelText: 'Gender',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      screenWidth * 0.02,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.0125,
                                    horizontal: screenWidth * 0.03,
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: screenWidth * 0.035,
                                  ),
                                ),
                                style: TextStyle(fontSize: screenWidth * 0.04),
                                onChanged: (String? newValue) {
                                  viewModel.setGender(newValue);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select a gender';
                                  }
                                  return null;
                                },
                                items: const [
                                  DropdownMenuItem(
                                    value: 'Male',
                                    child: Text('Male'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Female',
                                    child: Text('Female'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Other',
                                    child: Text('Other'),
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              // Height and Weight in One Row
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: viewModel.heightController,
                                      decoration: InputDecoration(
                                        labelText: 'Height (cm)',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            screenWidth * 0.02,
                                          ),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: screenHeight * 0.0125,
                                          horizontal: screenWidth * 0.03,
                                        ),
                                        labelStyle: TextStyle(
                                          fontSize: screenWidth * 0.035,
                                        ),
                                      ),
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.04,
                                      ),
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your height';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.04),
                                  Expanded(
                                    child: TextFormField(
                                      controller: viewModel.weightController,
                                      decoration: InputDecoration(
                                        labelText: 'Weight (kg)',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            screenWidth * 0.02,
                                          ),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: screenHeight * 0.0125,
                                          horizontal: screenWidth * 0.03,
                                        ),
                                        labelStyle: TextStyle(
                                          fontSize: screenWidth * 0.035,
                                        ),
                                      ),
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.04,
                                      ),
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your weight';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.04),
                              // Continue Button
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  padding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.02,
                                  ),
                                  minimumSize: Size(
                                    double.infinity,
                                    screenHeight * 0.0625,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      screenWidth * 0.02,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  if (Form.of(context).validate()) {
                                    viewModel.submitSelfData(context);
                                  }
                                },
                                child: Text(
                                  viewModel.isLoading
                                      ? 'Submitting...'
                                      : 'Continue',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.04,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// import 'dart:ui';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../viewmodel/self_viewmodel.dart';
//
// class CareSupremeSelfBottomSheet extends StatelessWidget {
//   const CareSupremeSelfBottomSheet({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // MediaQuery for responsive sizing
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//
//     return ChangeNotifierProvider(
//       create: (_) => SelfViewModel(),
//       child: Consumer<SelfViewModel>(
//         builder: (context, viewModel, _) {
//           return DraggableScrollableSheet(
//             initialChildSize: 0.5,
//             minChildSize: 0.4,
//             maxChildSize: 0.5,
//             expand: false,
//             builder: (context, scrollController) {
//               return Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.vertical(
//                     top: Radius.circular(screenWidth * 0.05),
//                   ),
//                 ),
//                 child: SingleChildScrollView(
//                   controller: scrollController,
//                   child: Padding(
//                     padding: EdgeInsets.all(screenWidth * 0.04),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         // Drag Handle
//                         Center(
//                           child: Container(
//                             margin: EdgeInsets.only(
//                               bottom: screenHeight * 0.02,
//                             ),
//                             width: screenWidth * 0.1,
//                             height: screenHeight * 0.005,
//                             decoration: BoxDecoration(
//                               color: Colors.grey[300],
//                               borderRadius: BorderRadius.circular(
//                                 screenWidth * 0.005,
//                               ),
//                             ),
//                           ),
//                         ),
//                         // Header
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Self Details',
//                               style: TextStyle(
//                                 fontSize: screenWidth * 0.05,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             IconButton(
//                               icon: Icon(Icons.close, size: screenWidth * 0.06),
//                               onPressed: () {
//                                 Navigator.pop(
//                                   context,
//                                 ); // Close the bottom sheet
//                               },
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: screenHeight * 0.02),
//                         // Form Fields
//                         Form(
//                           key: GlobalKey<FormState>(),
//                           child: Column(
//                             children: [
//                               // First Name and Last Name in One Row
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: TextFormField(
//                                       controller: viewModel.firstNameController,
//                                       decoration: InputDecoration(
//                                         labelText: 'First Name',
//                                         border: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(
//                                             screenWidth * 0.02,
//                                           ),
//                                         ),
//                                         contentPadding: EdgeInsets.symmetric(
//                                           vertical: screenHeight * 0.0125,
//                                           horizontal: screenWidth * 0.03,
//                                         ),
//                                         labelStyle: TextStyle(
//                                           fontSize: screenWidth * 0.035,
//                                         ),
//                                       ),
//                                       style: TextStyle(
//                                         fontSize: screenWidth * 0.04,
//                                       ),
//                                       validator: (value) {
//                                         if (value == null || value.isEmpty) {
//                                           return 'Please enter your first name';
//                                         }
//                                         return null;
//                                       },
//                                     ),
//                                   ),
//                                   SizedBox(width: screenWidth * 0.04),
//                                   Expanded(
//                                     child: TextFormField(
//                                       controller: viewModel.lastNameController,
//                                       decoration: InputDecoration(
//                                         labelText: 'Last Name',
//                                         border: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(
//                                             screenWidth * 0.02,
//                                           ),
//                                         ),
//                                         contentPadding: EdgeInsets.symmetric(
//                                           vertical: screenHeight * 0.0125,
//                                           horizontal: screenWidth * 0.03,
//                                         ),
//                                         labelStyle: TextStyle(
//                                           fontSize: screenWidth * 0.035,
//                                         ),
//                                       ),
//                                       style: TextStyle(
//                                         fontSize: screenWidth * 0.04,
//                                       ),
//                                       validator: (value) {
//                                         if (value == null || value.isEmpty) {
//                                           return 'Please enter your last name';
//                                         }
//                                         return null;
//                                       },
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: screenHeight * 0.02),
//                               // Gender Dropdown
//                               DropdownButtonFormField<String>(
//                                 value: viewModel.gender,
//                                 decoration: InputDecoration(
//                                   labelText: 'Gender',
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(
//                                       screenWidth * 0.02,
//                                     ),
//                                   ),
//                                   contentPadding: EdgeInsets.symmetric(
//                                     vertical: screenHeight * 0.0125,
//                                     horizontal: screenWidth * 0.03,
//                                   ),
//                                   labelStyle: TextStyle(
//                                     fontSize: screenWidth * 0.035,
//                                   ),
//                                 ),
//                                 style: TextStyle(fontSize: screenWidth * 0.04),
//                                 onChanged: (String? newValue) {
//                                   viewModel.setGender(newValue);
//                                 },
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please select a gender';
//                                   }
//                                   return null;
//                                 },
//                                 items: const [
//                                   DropdownMenuItem(
//                                     value: 'Male',
//                                     child: Text('Male'),
//                                   ),
//                                   DropdownMenuItem(
//                                     value: 'Female',
//                                     child: Text('Female'),
//                                   ),
//                                   DropdownMenuItem(
//                                     value: 'Other',
//                                     child: Text('Other'),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: screenHeight * 0.02),
//                               // Height and Weight in One Row
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: TextFormField(
//                                       controller: viewModel.heightController,
//                                       decoration: InputDecoration(
//                                         labelText: 'Height (cm)',
//                                         border: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(
//                                             screenWidth * 0.02,
//                                           ),
//                                         ),
//                                         contentPadding: EdgeInsets.symmetric(
//                                           vertical: screenHeight * 0.0125,
//                                           horizontal: screenWidth * 0.03,
//                                         ),
//                                         labelStyle: TextStyle(
//                                           fontSize: screenWidth * 0.035,
//                                         ),
//                                       ),
//                                       style: TextStyle(
//                                         fontSize: screenWidth * 0.04,
//                                       ),
//                                       keyboardType: TextInputType.number,
//                                       validator: (value) {
//                                         if (value == null || value.isEmpty) {
//                                           return 'Please enter your height';
//                                         }
//                                         return null;
//                                       },
//                                     ),
//                                   ),
//                                   SizedBox(width: screenWidth * 0.04),
//                                   Expanded(
//                                     child: TextFormField(
//                                       controller: viewModel.weightController,
//                                       decoration: InputDecoration(
//                                         labelText: 'Weight (kg)',
//                                         border: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(
//                                             screenWidth * 0.02,
//                                           ),
//                                         ),
//                                         contentPadding: EdgeInsets.symmetric(
//                                           vertical: screenHeight * 0.0125,
//                                           horizontal: screenWidth * 0.03,
//                                         ),
//                                         labelStyle: TextStyle(
//                                           fontSize: screenWidth * 0.035,
//                                         ),
//                                       ),
//                                       style: TextStyle(
//                                         fontSize: screenWidth * 0.04,
//                                       ),
//                                       keyboardType: TextInputType.number,
//                                       validator: (value) {
//                                         if (value == null || value.isEmpty) {
//                                           return 'Please enter your weight';
//                                         }
//                                         return null;
//                                       },
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: screenHeight * 0.04),
//                               // Continue Button
//                               ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.blue,
//                                   padding: EdgeInsets.symmetric(
//                                     vertical: screenHeight * 0.02,
//                                   ),
//                                   minimumSize: Size(
//                                     double.infinity,
//                                     screenHeight * 0.0625,
//                                   ),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(
//                                       screenWidth * 0.02,
//                                     ),
//                                   ),
//                                 ),
//                                 onPressed: () {
//                                   if (Form.of(context).validate()) {
//                                     viewModel.submitSelfData(context);
//                                   }
//                                 },
//                                 child: Text(
//                                   viewModel.isLoading
//                                       ? 'Submitting...'
//                                       : 'Continue',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: screenWidth * 0.04,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class SelfBottomSheet extends StatefulWidget {
//   const SelfBottomSheet({super.key});
//
//   @override
//   _SelfBottomSheetState createState() => _SelfBottomSheetState();
// }
//
// class _SelfBottomSheetState extends State<SelfBottomSheet> {
//   final _formKey = GlobalKey<FormState>();
//   String? firstName, lastName, gender, height, weight;
//
//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       initialChildSize: 0.5, // Adjusted to fit the form
//       minChildSize: 0.4,
//       maxChildSize: 0.5,
//       expand: false,
//       builder: (context, scrollController) {
//         return Container(
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
//           ),
//           child: SingleChildScrollView(
//             controller: scrollController,
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // // Drag Handle
//                   Center(
//                     child: Container(
//                       margin: const EdgeInsets.only(bottom: 16.0),
//                       width: 40,
//                       height: 4,
//                       decoration: BoxDecoration(
//                         color: Colors.grey[300],
//                         borderRadius: BorderRadius.circular(2),
//                       ),
//                     ),
//                   ),
//                   // Header
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         'Self Details',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.close, size: 24),
//                         onPressed: () {
//                           Navigator.pop(context); // Close the bottom sheet
//                         },
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   // Form Fields
//                   Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         // First Name and Last Name in One Row
//                         Row(
//                           children: [
//                             Expanded(
//                               child: TextFormField(
//                                 decoration: InputDecoration(
//                                   labelText: 'First Name',
//                                   border: OutlineInputBorder(),
//                                   contentPadding: const EdgeInsets.symmetric(
//                                     vertical: 10,
//                                     horizontal: 12,
//                                   ),
//                                 ),
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter your first name';
//                                   }
//                                   return null;
//                                 },
//                                 onSaved: (value) => firstName = value,
//                               ),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: TextFormField(
//                                 decoration: InputDecoration(
//                                   labelText: 'Last Name',
//                                   border: OutlineInputBorder(),
//                                   contentPadding: const EdgeInsets.symmetric(
//                                     vertical: 10,
//                                     horizontal: 12,
//                                   ),
//                                 ),
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter your last name';
//                                   }
//                                   return null;
//                                 },
//                                 onSaved: (value) => lastName = value,
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 16),
//                         // Gender Dropdown
//                         DropdownButtonFormField<String>(
//                           value: gender,
//                           decoration: const InputDecoration(
//                             labelText: 'Gender',
//                             border: OutlineInputBorder(),
//                           ),
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               gender = newValue;
//                             });
//                           },
//                           onSaved: (value) => gender = value,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please select a gender';
//                             }
//                             return null;
//                           },
//                           items: const [
//                             DropdownMenuItem(
//                               value: 'Male',
//                               child: Text('Male'),
//                             ),
//                             DropdownMenuItem(
//                               value: 'Female',
//                               child: Text('Female'),
//                             ),
//                             DropdownMenuItem(
//                               value: 'Other',
//                               child: Text('Other'),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 16),
//                         // Height and Weight in One Row
//                         Row(
//                           children: [
//                             Expanded(
//                               child: TextFormField(
//                                 decoration: InputDecoration(
//                                   labelText: 'Height (cm)',
//                                   border: OutlineInputBorder(),
//                                   contentPadding: const EdgeInsets.symmetric(
//                                     vertical: 10,
//                                     horizontal: 12,
//                                   ),
//                                 ),
//                                 keyboardType: TextInputType.number,
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter your height';
//                                   }
//                                   return null;
//                                 },
//                                 onSaved: (value) => height = value,
//                               ),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: TextFormField(
//                                 decoration: InputDecoration(
//                                   labelText: 'Weight (kg)',
//                                   border: OutlineInputBorder(),
//                                   contentPadding: const EdgeInsets.symmetric(
//                                     vertical: 10,
//                                     horizontal: 12,
//                                   ),
//                                 ),
//                                 keyboardType: TextInputType.number,
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter your weight';
//                                   }
//                                   return null;
//                                 },
//                                 onSaved: (value) => weight = value,
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 32),
//                         // Continue Button
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.blue,
//                             padding: const EdgeInsets.symmetric(vertical: 16),
//                             minimumSize: const Size(double.infinity, 50),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                           ),
//                           onPressed: () {
//                             if (_formKey.currentState!.validate()) {
//                               _formKey.currentState!.save();
//                               // Handle form submission
//                               print('First Name: $firstName');
//                               print('Last Name: $lastName');
//                               print('Gender: $gender');
//                               print('Height: $height');
//                               print('Weight: $weight');
//                             }
//                           },
//                           child: const Text(
//                             'Continue',
//                             style: TextStyle(color: Colors.white, fontSize: 16),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
