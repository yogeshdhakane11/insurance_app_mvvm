import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../routes/routes_name.dart';
import '../viewmodel/proposer_viewmodel.dart';

class NivaBupaProposerBottomSheet extends StatelessWidget {
  NivaBupaProposerBottomSheet({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (context) => NivaProposerViewModel(),
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
                ), // 20 -> 5% of screen width
                topRight: Radius.circular(
                  screenWidth * 0.05,
                ), // 20 -> 5% of screen width
              ),
              child: Scaffold(
                backgroundColor: Colors.white,
                body: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04, // 16 -> 4% of screen width
                    vertical:
                        screenHeight * 0.015, // 12 -> 1.5% of screen height
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
                                    screenWidth *
                                    0.05, // 20 -> 5% of screen width
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.015,
                        ), // 12 -> 1.5% of screen height
                        // Scrollable content
                        Expanded(
                          child: SingleChildScrollView(
                            controller: scrollController,
                            // Use Consumer to rebuild the form content when the ViewModel changes
                            child: Consumer<NivaProposerViewModel>(
                              builder: (context, viewModel, child) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: screenHeight * 0.01375,
                                    ), // 11 -> 1.375% of screen height
                                    // PAN Field
                                    TextFormField(
                                      controller:
                                          viewModel.phoneNumberController,
                                      decoration: InputDecoration(
                                        labelText: "PAN",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            screenWidth * 0.02,
                                          ), // 8 -> 2% of screen width (default for OutlineInputBorder)
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please enter PAN";
                                        }

                                        // Simple PAN format validation (adjust based on your requirements)
                                        String pattern =
                                            r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$';
                                        RegExp regExp = RegExp(pattern);

                                        if (!regExp.hasMatch(value)) {
                                          return "Please enter a valid PAN number";
                                        }

                                        return null; // Return null if validation is successful
                                      },
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.011,
                                    ), // 12 -> 1.5% of screen height
                                    // Politically Exposed Person Checkbox
                                    CheckboxListTile(
                                      title: Text(
                                        'Are you a Politically Exposed Person?',
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.036,
                                        ), // 14 -> 3.5% of screen width
                                      ),
                                      value: viewModel.isPoliticallyExposed,
                                      onChanged: (value) =>
                                          viewModel.updatePoliticallyExposed(
                                            value ?? false,
                                          ),
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      activeColor: Colors.blue,
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.011,
                                    ), // 12 -> 1.5% of screen height
                                    // Marital Status Dropdown
                                    DropdownButtonFormField<String>(
                                      value: viewModel.maritalStatus,
                                      items:
                                          [
                                                'Single',
                                                'Married',
                                                'Divorced',
                                                'Widow',
                                              ]
                                              .map(
                                                (status) => DropdownMenuItem(
                                                  value: status,
                                                  child: Text(status),
                                                ),
                                              )
                                              .toList(),
                                      onChanged: (value) =>
                                          viewModel.updateMaritalStatus(value),
                                      decoration: InputDecoration(
                                        labelText: 'Marital Status',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            screenWidth * 0.02,
                                          ), // 8 -> 2% of screen width (default for OutlineInputBorder)
                                        ),
                                      ),
                                      validator: (value) => value == null
                                          ? "Please select marital status"
                                          : null,
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.015,
                                    ), // 12 -> 1.5% of screen height
                                    // Occupation Dropdown
                                    DropdownButtonFormField<String>(
                                      value: viewModel.occupation,
                                      items:
                                          [
                                                'Salaried',
                                                'Business Owner',
                                                'Self-Employed',
                                                'Student',
                                              ]
                                              .map(
                                                (occ) => DropdownMenuItem(
                                                  value: occ,
                                                  child: Text(occ),
                                                ),
                                              )
                                              .toList(),
                                      onChanged: (value) =>
                                          viewModel.updateOccupation(value),
                                      decoration: InputDecoration(
                                        labelText: 'Occupation',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            screenWidth * 0.02,
                                          ), // 8 -> 2% of screen width (default for OutlineInputBorder)
                                        ),
                                      ),
                                      validator: (value) => value == null
                                          ? "Please select occupation"
                                          : null,
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.015,
                                    ), // 12 -> 1.5% of screen height
                                    // Email Field
                                    TextFormField(
                                      controller: viewModel.emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        labelText: 'Email ID',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            screenWidth * 0.02,
                                          ), // 8 -> 2% of screen width (default for OutlineInputBorder)
                                        ),
                                      ),
                                      validator: (value) =>
                                          value!.isEmpty || !value.contains("@")
                                          ? "Enter a valid email"
                                          : null,
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.005,
                                    ), // 4 -> 0.5% of screen height
                                    Text(
                                      'Digital copy will be sent to this email',
                                      style: TextStyle(
                                        fontSize:
                                            screenWidth *
                                            0.03, // 12 -> 3% of screen width
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.015,
                                    ), // 12 -> 1.5% of screen height
                                    // Phone Number Field
                                    TextFormField(
                                      controller:
                                          viewModel.phoneNumberController,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        labelText: 'Phone Number',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            screenWidth * 0.02,
                                          ), // 8 -> 2% of screen width (default for OutlineInputBorder)
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.015,
                                    ), // 12 -> 1.5% of screen height
                                    // Address Field
                                    TextFormField(
                                      controller: viewModel.addressController,
                                      // maxLines: 2,
                                      decoration: InputDecoration(
                                        labelText: 'Address',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            screenWidth * 0.02,
                                          ), // 8 -> 2% of screen width (default for OutlineInputBorder)
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.005,
                                    ), // 4 -> 0.5% of screen height
                                    Text(
                                      'Enter as per Address Proof. Your policy documents will be sent to this address',
                                      style: TextStyle(
                                        fontSize:
                                            screenWidth *
                                            0.03, // 12 -> 3% of screen width
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.015,
                                    ), // 12 -> 1.5% of screen height
                                    // e-Insurance Account Radio Buttons
                                    Text(
                                      'Do you have e-Insurance Account?',
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.044,
                                      ), // 14 -> 3.5% of screen width (assumed, as not explicitly specified)
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Radio<bool>(
                                          value: true,
                                          groupValue: viewModel.hasEInsurance,
                                          onChanged: (value) => viewModel
                                              .updateEInsurance(value ?? false),
                                        ),
                                        Text('Yes'),
                                        Radio<bool>(
                                          value: false,
                                          groupValue: viewModel.hasEInsurance,
                                          onChanged: (value) => viewModel
                                              .updateEInsurance(value ?? false),
                                        ),
                                        Text('No'),
                                      ],
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
                        ), // 16 -> 2% of screen height
                        SizedBox(
                          width: double.infinity,
                          child: Consumer<NivaProposerViewModel>(
                            builder: (context, viewModel, child) {
                              return ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    viewModel.submit();
                                    // Navigator.pop(context);
                                    Navigator.pushNamed(
                                      context,
                                      RouteNames.nivaMedicalScreen1,
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  padding: EdgeInsets.symmetric(
                                    vertical:
                                        screenHeight *
                                        0.01375, // 11 -> 1.375% of screen height
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      screenWidth * 0.02,
                                    ), // 8 -> 2% of screen width
                                  ),
                                ),
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                    fontSize:
                                        screenWidth *
                                        0.045, // 18 -> 4.5% of screen width
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
// import 'package:provider/provider.dart';
//
// import '../viewmodel/proposer_viewmodel.dart';
//
// class ProposerBottomSheet extends StatelessWidget {
//   ProposerBottomSheet({super.key});
//
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     // We move the ChangeNotifierProvider inside the widget itself.
//     // This makes the ProposerBottomSheet responsible for providing its own ViewModel.
//     // The Consumer further down in the tree will now find the provider.
//     return ChangeNotifierProvider(
//       create: (context) => NivaProposerViewModel(),
//       child: DraggableScrollableSheet(
//         expand: false,
//         initialChildSize: 0.7,
//         minChildSize: 0.4,
//         maxChildSize: 0.90,
//         builder: (context, scrollController) {
//           return GestureDetector(
//             behavior: HitTestBehavior.opaque,
//             onTap: () => FocusScope.of(context).unfocus(),
//             child: ClipRRect(
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 topRight: Radius.circular(20),
//               ),
//               child: Scaffold(
//                 backgroundColor: Colors.white,
//                 body: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 12,
//                   ),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         // Header with Title and Close button
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Text(
//                               "Proposer",
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.close),
//                               onPressed: () => Navigator.pop(context),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 12),
//
//                         // Scrollable content
//                         Expanded(
//                           child: SingleChildScrollView(
//                             controller: scrollController,
//                             // Use Consumer to rebuild the form content when the ViewModel changes
//                             child: Consumer<NivaProposerViewModel>(
//                               builder: (context, viewModel, child) {
//                                 return Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     SizedBox(height: 11),
//                                     // PAN Field
//                                     TextFormField(
//                                       initialValue: viewModel.pan,
//                                       decoration: const InputDecoration(
//                                         labelText: "PAN",
//                                         border: OutlineInputBorder(),
//                                       ),
//                                       onChanged: (value) =>
//                                           viewModel.updatePan(value),
//                                       validator: (value) => value!.isEmpty
//                                           ? "Please enter PAN"
//                                           : null,
//                                     ),
//                                     const SizedBox(height: 12),
//
//                                     // Politically Exposed Person Checkbox
//                                     CheckboxListTile(
//                                       title: const Text(
//                                         'Are you a Politically Exposed Person?',
//                                         style: TextStyle(fontSize: 14),
//                                       ),
//                                       value: viewModel.isPoliticallyExposed,
//                                       onChanged: (value) =>
//                                           viewModel.updatePoliticallyExposed(
//                                             value ?? false,
//                                           ),
//                                       controlAffinity:
//                                           ListTileControlAffinity.leading,
//                                       contentPadding: EdgeInsets.zero,
//                                     ),
//                                     const SizedBox(height: 12),
//
//                                     // Marital Status Dropdown
//                                     DropdownButtonFormField<String>(
//                                       value: viewModel.maritalStatus,
//                                       items:
//                                           [
//                                                 'Single',
//                                                 'Married',
//                                                 'Divorced',
//                                                 'Widow',
//                                               ]
//                                               .map(
//                                                 (status) => DropdownMenuItem(
//                                                   value: status,
//                                                   child: Text(status),
//                                                 ),
//                                               )
//                                               .toList(),
//                                       onChanged: (value) =>
//                                           viewModel.updateMaritalStatus(value),
//                                       decoration: const InputDecoration(
//                                         labelText: 'Marital Status',
//                                         border: OutlineInputBorder(),
//                                       ),
//                                       validator: (value) => value == null
//                                           ? "Please select marital status"
//                                           : null,
//                                     ),
//                                     const SizedBox(height: 12),
//
//                                     // Occupation Dropdown
//                                     DropdownButtonFormField<String>(
//                                       value: viewModel.occupation,
//                                       items:
//                                           [
//                                                 'Salaried',
//                                                 'Business Owner',
//                                                 'Self-Employed',
//                                                 'Student',
//                                               ]
//                                               .map(
//                                                 (occ) => DropdownMenuItem(
//                                                   value: occ,
//                                                   child: Text(occ),
//                                                 ),
//                                               )
//                                               .toList(),
//                                       onChanged: (value) =>
//                                           viewModel.updateOccupation(value),
//                                       decoration: const InputDecoration(
//                                         labelText: 'Occupation',
//                                         border: OutlineInputBorder(),
//                                       ),
//                                       validator: (value) => value == null
//                                           ? "Please select occupation"
//                                           : null,
//                                     ),
//                                     const SizedBox(height: 12),
//
//                                     // Email Field
//                                     TextFormField(
//                                       initialValue: viewModel.email,
//                                       keyboardType: TextInputType.emailAddress,
//                                       decoration: const InputDecoration(
//                                         labelText: 'Email ID',
//                                         border: OutlineInputBorder(),
//                                       ),
//                                       onChanged: (value) =>
//                                           viewModel.updateEmail(value),
//                                       validator: (value) =>
//                                           value!.isEmpty || !value.contains("@")
//                                           ? "Enter a valid email"
//                                           : null,
//                                     ),
//                                     const SizedBox(height: 4),
//                                     const Text(
//                                       'Digital copy will be sent to this email',
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         color: Colors.grey,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 12),
//
//                                     // Phone Number Field
//                                     TextFormField(
//                                       initialValue: viewModel.phoneNumber,
//                                       keyboardType: TextInputType.phone,
//                                       decoration: const InputDecoration(
//                                         labelText: 'Phone Number',
//                                         border: OutlineInputBorder(),
//                                       ),
//                                       onChanged: (value) =>
//                                           viewModel.updatePhoneNumber(value),
//                                       validator: (value) => value!.length != 10
//                                           ? "Enter valid 10-digit number"
//                                           : null,
//                                     ),
//                                     const SizedBox(height: 12),
//
//                                     // Address Field
//                                     TextFormField(
//                                       initialValue: viewModel.address,
//                                       maxLines: 2,
//                                       decoration: const InputDecoration(
//                                         labelText: 'Address',
//                                         border: OutlineInputBorder(),
//                                       ),
//                                       onChanged: (value) =>
//                                           viewModel.updateAddress(value),
//                                       validator: (value) => value!.isEmpty
//                                           ? "Please enter an address"
//                                           : null,
//                                     ),
//                                     const SizedBox(height: 4),
//                                     const Text(
//                                       'Enter as per Address Proof. Your policy documents will be sent to this address',
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         color: Colors.grey,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 12),
//
//                                     // e-Insurance Account Radio Buttons
//                                     const Text(
//                                       'Do you have e-Insurance Account?',
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         Radio<bool>(
//                                           value: true,
//                                           groupValue: viewModel.hasEInsurance,
//                                           onChanged: (value) => viewModel
//                                               .updateEInsurance(value ?? false),
//                                         ),
//                                         const Text('Yes'),
//                                         Radio<bool>(
//                                           value: false,
//                                           groupValue: viewModel.hasEInsurance,
//                                           onChanged: (value) => viewModel
//                                               .updateEInsurance(value ?? false),
//                                         ),
//                                         const Text('No'),
//                                       ],
//                                     ),
//                                   ],
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//
//                         // Submit button
//                         const SizedBox(height: 16),
//                         SizedBox(
//                           width: double.infinity,
//                           child: Consumer<NivaProposerViewModel>(
//                             builder: (context, viewModel, child) {
//                               return ElevatedButton(
//                                 onPressed: () {
//                                   if (_formKey.currentState!.validate()) {
//                                     viewModel.submit();
//                                     Navigator.pop(context);
//                                   }
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.blue,
//                                   padding: const EdgeInsets.symmetric(
//                                     vertical: 11,
//                                   ),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                 ),
//                                 child: const Text(
//                                   'Submit',
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                         // const SizedBox(height: 16),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
