import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../routes/routes_name.dart';
import '../viewmodel/proposer_viewmodel.dart';

class CareSupremeProposerBottomSheet extends StatelessWidget {
  CareSupremeProposerBottomSheet({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (context) => ProposerViewModel(),
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.6,
        minChildSize: 0.4,
        maxChildSize: 0.7,
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
                              "Proposer",
                              style: TextStyle(
                                fontSize:
                                    screenWidth * 0.05, // 5% of screen width
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.close, size: screenWidth * 0.06),
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
                            child: Consumer<ProposerViewModel>(
                              builder: (context, viewModel, child) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: screenHeight * 0.01375,
                                    ), // 1.375% of screen height
                                    // PAN Number Field
                                    TextFormField(
                                      controller: viewModel.panController,
                                      decoration: InputDecoration(
                                        labelText: "PAN Number",
                                        hintText: "Enter your PAN number",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            screenWidth * 0.02,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please enter your PAN number";
                                        }
                                        String pattern =
                                            r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$';
                                        RegExp regExp = RegExp(pattern);
                                        if (!regExp.hasMatch(value)) {
                                          return "Please enter a valid PAN number";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.02,
                                    ), // 2% of screen height
                                    // Email ID Field
                                    TextFormField(
                                      controller: viewModel.emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        labelText: "Email Id",
                                        hintText: "Enter your email",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            screenWidth * 0.02,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.isEmpty ||
                                            !value.contains("@")) {
                                          return "Please enter a valid email";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.005,
                                    ), // 0.5% of screen height
                                    Text(
                                      'Digital copy will be sent to this email',
                                      style: TextStyle(
                                        fontSize:
                                            screenWidth *
                                            0.03, // 3% of screen width
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.02,
                                    ), // 2% of screen height
                                    // Phone Number Field
                                    TextFormField(
                                      controller: viewModel.phoneController,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        labelText: "Phone Number",
                                        hintText: "Enter your phone number",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            screenWidth * 0.02,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please enter your phone number";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.02,
                                    ), // 2% of screen height
                                    // Account Number Field
                                    TextFormField(
                                      controller: viewModel.accountController,
                                      decoration: InputDecoration(
                                        labelText: "A/c Number",
                                        hintText: "Enter your account number",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            screenWidth * 0.02,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please enter your account number";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.02,
                                    ), // 2% of screen height
                                    // IFSC Code Field
                                    TextFormField(
                                      controller: viewModel.ifscController,
                                      decoration: InputDecoration(
                                        labelText: "IFSC Code",
                                        hintText: "Enter your IFSC code",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            screenWidth * 0.02,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please enter your IFSC code";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.02,
                                    ), // 2% of screen height
                                    // Address Field
                                    TextFormField(
                                      controller: viewModel.addressController,
                                      decoration: InputDecoration(
                                        labelText: "Address",
                                        hintText: "Enter your address",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            screenWidth * 0.02,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please enter your address";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.005,
                                    ), // 0.5% of screen height
                                    Text(
                                      'Your policy documents will be sent to this address',
                                      style: TextStyle(
                                        fontSize:
                                            screenWidth *
                                            0.03, // 3% of screen width
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.02,
                                    ), // 2% of screen height
                                    // City Field
                                    TextFormField(
                                      controller: viewModel.cityController,
                                      decoration: InputDecoration(
                                        labelText: "City",
                                        hintText: "Enter your city",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            screenWidth * 0.02,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please enter your city";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.02,
                                    ), // 2% of screen height
                                    // State Field
                                    TextFormField(
                                      controller: viewModel.stateController,
                                      decoration: InputDecoration(
                                        labelText: "State",
                                        hintText: "Enter your state",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            screenWidth * 0.02,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please enter your state";
                                        }
                                        return null;
                                      },
                                    ),
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
                          child: Consumer<ProposerViewModel>(
                            builder: (context, viewModel, child) {
                              return ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    viewModel.submitProposerData(context);
                                    // Assuming a similar navigation route as Niva
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  padding: EdgeInsets.symmetric(
                                    vertical:
                                        screenHeight *
                                        0.01375, // 1.375% of screen height
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      screenWidth * 0.02,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  viewModel.isLoading
                                      ? 'Submitting...'
                                      : 'Submit',
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

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../viewmodel/proposer_viewmodel.dart';
//
// class CareSupremeProposerBottomSheet extends StatelessWidget {
//   const CareSupremeProposerBottomSheet({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // MediaQuery for responsive sizing
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//
//     // Access the ViewModel
//     final viewModel = Provider.of<ProposerViewModel>(context);
//
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(screenWidth * 0.05),
//         ),
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(screenWidth * 0.04),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Header
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Proposer',
//                     style: TextStyle(
//                       fontSize: screenWidth * 0.05,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.close, size: screenWidth * 0.06),
//                     onPressed: () {
//                       Navigator.pop(context); // Close the bottom sheet
//                     },
//                   ),
//                 ],
//               ),
//               SizedBox(height: screenHeight * 0.02),
//               // Form Fields
//               Form(
//                 key: GlobalKey<FormState>(),
//                 child: Column(
//                   children: [
//                     // PAN Number TextField
//                     CustomTextField(
//                       controller: viewModel.panController,
//                       label: 'PAN Number',
//                       hint: 'Enter your PAN number',
//                       message: ' ',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your PAN number';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: screenHeight * 0.02),
//                     // Email ID TextField
//                     CustomTextField(
//                       controller: viewModel.emailController,
//                       label: 'Email Id',
//                       hint: 'Enter your email',
//                       message: 'Digital copy will be sent to this email',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your email';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: screenHeight * 0.02),
//                     // Phone Number TextField
//                     CustomTextField(
//                       controller: viewModel.phoneController,
//                       label: 'Phone Number',
//                       hint: 'Enter your phone number',
//                       message: '',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your phone number';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: screenHeight * 0.02),
//                     // Account Number TextField
//                     CustomTextField(
//                       controller: viewModel.accountController,
//                       label: 'A/c Number',
//                       hint: 'Enter your account number',
//                       message: '',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your account number';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: screenHeight * 0.02),
//                     // IFSC Code TextField
//                     CustomTextField(
//                       controller: viewModel.ifscController,
//                       label: 'IFSC Code',
//                       hint: 'Enter your IFSC code',
//                       message: '',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your IFSC code';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: screenHeight * 0.02),
//                     // Address TextField
//                     CustomTextField(
//                       controller: viewModel.addressController,
//                       label: 'Address',
//                       hint: 'Enter your address',
//                       message:
//                           'Your policy documents will be sent to this address',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your address';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: screenHeight * 0.02),
//                     // City TextField
//                     CustomTextField(
//                       controller: viewModel.cityController,
//                       label: 'City',
//                       hint: 'Enter your city',
//                       message: '',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your city';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: screenHeight * 0.02),
//                     // State TextField
//                     CustomTextField(
//                       controller: viewModel.stateController,
//                       label: 'State',
//                       hint: 'Enter your state',
//                       message: '',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your state';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: screenHeight * 0.0175),
//                     // Submit Button
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         padding: EdgeInsets.symmetric(
//                           vertical: screenHeight * 0.0175,
//                         ),
//                         minimumSize: Size(
//                           double.infinity,
//                           screenHeight * 0.0625,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(
//                             screenWidth * 0.02,
//                           ),
//                         ),
//                       ),
//                       onPressed: () {
//                         if (Form.of(context).validate()) {
//                           viewModel.submitProposerData(context);
//                         }
//                       },
//                       child: Text(
//                         viewModel.isLoading ? 'Submitting...' : 'Submit',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: screenWidth * 0.04,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // Custom TextField Widget
// class CustomTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String label;
//   final String hint;
//   final String message;
//   final FormFieldValidator<String> validator;
//
//   const CustomTextField({
//     Key? key,
//     required this.controller,
//     required this.label,
//     required this.hint,
//     required this.message,
//     required this.validator,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // MediaQuery for responsive sizing
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         TextFormField(
//           controller: controller,
//           decoration: InputDecoration(
//             labelText: label,
//             hintText: hint,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(screenWidth * 0.02),
//             ),
//             contentPadding: EdgeInsets.symmetric(
//               vertical: screenHeight * 0.015,
//               horizontal: screenWidth * 0.03,
//             ),
//             labelStyle: TextStyle(fontSize: screenWidth * 0.035),
//             hintStyle: TextStyle(fontSize: screenWidth * 0.035),
//           ),
//           style: TextStyle(fontSize: screenWidth * 0.04),
//           validator: validator,
//         ),
//         if (message.isNotEmpty)
//           Padding(
//             padding: EdgeInsets.only(top: screenHeight * 0.01),
//             child: Text(
//               message,
//               style: TextStyle(
//                 color: Colors.grey[600],
//                 fontSize: screenWidth * 0.03,
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class ProposerBottomSheet extends StatefulWidget {
//   const ProposerBottomSheet({super.key});
//
//   @override
//   _ProposerBottomSheetState createState() => _ProposerBottomSheetState();
// }
//
// class _ProposerBottomSheetState extends State<ProposerBottomSheet> {
//   final _formKey = GlobalKey<FormState>();
//
//   // Controllers for each TextFormField
//   final TextEditingController _panController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _accountController = TextEditingController();
//   final TextEditingController _ifscController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _cityController = TextEditingController();
//   final TextEditingController _stateController = TextEditingController();
//
//   @override
//   void dispose() {
//     // Dispose controllers when not needed
//     _emailController.dispose();
//     _phoneController.dispose();
//     _accountController.dispose();
//     _ifscController.dispose();
//     _addressController.dispose();
//     _cityController.dispose();
//     _stateController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Header
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Proposer',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.close, size: 24),
//                     onPressed: () {
//                       Navigator.pop(context); // Close the bottom sheet
//                     },
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               // Form Fields
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     // PAN Number TextField
//                     CustomTextField(
//                       controller: _panController,
//                       label: 'PAN Number',
//                       hint: 'Enter your PAN number',
//                       message: ' ',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your PAN number';
//                         }
//                         return null;
//                       },
//                     ),
//                     // Email ID TextField
//                     CustomTextField(
//                       controller: _emailController,
//                       label: 'Email Id',
//                       hint: 'Enter your email',
//                       message: 'Digital copy will be sent to this email',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your email';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 16),
//                     // Phone Number TextField
//                     CustomTextField(
//                       controller: _phoneController,
//                       label: 'Phone Number',
//                       hint: 'Enter your phone number',
//                       message: '',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your phone number';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 16),
//                     // Account Number TextField
//                     CustomTextField(
//                       controller: _accountController,
//                       label: 'A/c Number',
//                       hint: 'Enter your account number',
//                       message: '',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your account number';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 16),
//                     // IFSC Code TextField
//                     CustomTextField(
//                       controller: _ifscController,
//                       label: 'IFSC Code',
//                       hint: 'Enter your IFSC code',
//                       message: '',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your IFSC code';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 16),
//                     // Address TextField
//                     CustomTextField(
//                       controller: _addressController,
//                       label: 'Address',
//                       hint: 'Enter your address',
//                       message:
//                           'Your policy documents will be sent to this address',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your address';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 16),
//                     // City TextField
//                     CustomTextField(
//                       controller: _cityController,
//                       label: 'City',
//                       hint: 'Enter your city',
//                       message: '',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your city';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 16),
//                     // State TextField
//                     CustomTextField(
//                       controller: _stateController,
//                       label: 'State',
//                       hint: 'Enter your state',
//                       message: '',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your state';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 14),
//                     // Submit Button
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         padding: const EdgeInsets.symmetric(vertical: 14),
//                         minimumSize: const Size(double.infinity, 50),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           // Handle form submission
//                           print('Email: ${_emailController.text}');
//                           print('Phone: ${_phoneController.text}');
//                           print('Account Number: ${_accountController.text}');
//                           print('IFSC Code: ${_ifscController.text}');
//                           print('Address: ${_addressController.text}');
//                           print('City: ${_cityController.text}');
//                           print('State: ${_stateController.text}');
//                         }
//                       },
//                       child: const Text(
//                         'Submit',
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // Custom TextField Widget
// class CustomTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String label;
//   final String hint;
//   final String message;
//   final FormFieldValidator<String> validator;
//
//   const CustomTextField({
//     Key? key,
//     required this.controller,
//     required this.label,
//     required this.hint,
//     required this.message,
//     required this.validator,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         TextFormField(
//           controller: controller,
//           decoration: InputDecoration(
//             labelText: label,
//             hintText: hint,
//             border: OutlineInputBorder(),
//             contentPadding: const EdgeInsets.symmetric(
//               vertical: 12,
//               horizontal: 12,
//             ),
//           ),
//           validator: validator,
//         ),
//         if (message.isNotEmpty)
//           Padding(
//             padding: const EdgeInsets.only(top: 8.0),
//             child: Text(
//               message,
//               style: TextStyle(color: Colors.grey[600], fontSize: 12),
//             ),
//           ),
//       ],
//     );
//   }
// }
