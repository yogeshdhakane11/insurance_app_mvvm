import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../../../routes/routes_name.dart';
import '../../viewmodel/nominee_viewmodel.dart';

class CareSupremeNomineeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) => CareSupremeNomineeViewModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: screenWidth * 0.06, // Responsive icon size
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Row(
            children: [
              Image.asset(
                'assets/images/care_logo.png',
                width: screenWidth * 0.08, // Responsive image width
                height: screenWidth * 0.08, // Responsive image height
              ),
              SizedBox(width: screenWidth * 0.02), // Responsive spacing
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Care Supreme',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04, // Responsive font size
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '1 member • ₹10 Lakhs • 1 year',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03, // Responsive font size
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
          child: Consumer<CareSupremeNomineeViewModel>(
            builder: (context, viewModel, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Progress Indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.green,
                                  width: 1,
                                ),
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: screenWidth * 0.03, // Responsive radius
                                child: Icon(
                                  Icons.check,
                                  size:
                                      screenWidth *
                                      0.04, // Responsive icon size
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height:
                                    screenHeight * 0.002, // Responsive height
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.green,
                                  width: 1,
                                ),
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: screenWidth * 0.03, // Responsive radius
                                child: Icon(
                                  Icons.check,
                                  size:
                                      screenWidth *
                                      0.04, // Responsive icon size
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height:
                                    screenHeight * 0.002, // Responsive height
                                color: Colors.grey[300],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 2),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: screenWidth * 0.03, // Responsive radius
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01), // Responsive spacing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Members',
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                        ), // Responsive font
                      ),
                      Text(
                        'Medical',
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                        ), // Responsive font
                      ),
                      Text(
                        'Nominee',
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                        ), // Responsive font
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.025), // Responsive spacing
                  Text(
                    'WHO DO YOU WANT TO MAKE NOMINEE?',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04, // Responsive font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025), // Responsive spacing
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: viewModel.formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: viewModel.nomineeController,
                              decoration: InputDecoration(
                                labelText: 'Choose Nominee',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    screenWidth * 0.02,
                                  ), // Responsive radius
                                  borderSide: BorderSide(
                                    color: Colors.grey[300]!,
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical:
                                      screenHeight *
                                      0.012, // Responsive padding
                                  horizontal:
                                      screenWidth * 0.03, // Responsive padding
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Nominee is required';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ), // Responsive spacing
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'Nominee Relationship',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    screenWidth * 0.02,
                                  ), // Responsive radius
                                  borderSide: BorderSide(
                                    color: Colors.grey[300]!,
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical:
                                      screenHeight *
                                      0.012, // Responsive padding
                                  horizontal:
                                      screenWidth * 0.03, // Responsive padding
                                ),
                              ),
                              value: viewModel.nomineeRelationship,
                              items: [
                                DropdownMenuItem(
                                  value: 'Spouse',
                                  child: Text(
                                    'Spouse',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                    ), // Responsive font
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'Child',
                                  child: Text(
                                    'Child',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                    ), // Responsive font
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'Parent',
                                  child: Text(
                                    'Parent',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                    ), // Responsive font
                                  ),
                                ),
                              ],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Nominee Relationship is required';
                                }
                                return null;
                              },
                              onChanged: (value) =>
                                  viewModel.setNomineeRelationship(value),
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ), // Responsive spacing
                            TextFormField(
                              controller: viewModel.nameController,
                              decoration: InputDecoration(
                                labelText: 'Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    screenWidth * 0.02,
                                  ), // Responsive radius
                                  borderSide: BorderSide(
                                    color: Colors.grey[300]!,
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical:
                                      screenHeight *
                                      0.012, // Responsive padding
                                  horizontal:
                                      screenWidth * 0.03, // Responsive padding
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Name is required';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ), // Responsive spacing
                            Text(
                              'Nominee’s Date of Birth',
                              style: TextStyle(
                                fontSize: screenWidth * 0.035,
                              ), // Responsive font
                            ),
                            TextFormField(
                              controller: viewModel.dobController,
                              readOnly: true,
                              onTap: () async {
                                DateTime selectedDate = DateTime.now();
                                bool isDateSelected = false;

                                String displayMonth = DateFormat.MMMM().format(
                                  selectedDate,
                                );
                                String displayDay = selectedDate.day.toString();
                                String displayYear = selectedDate.year
                                    .toString();

                                await showCupertinoModalPopup<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height:
                                          screenHeight *
                                          0.38, // Responsive height
                                      padding: EdgeInsets.only(
                                        top: screenHeight * 0.007,
                                      ),
                                      margin: EdgeInsets.only(
                                        bottom: MediaQuery.of(
                                          context,
                                        ).viewInsets.bottom,
                                      ),
                                      color: CupertinoColors.systemBackground
                                          .resolveFrom(context),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: screenHeight * 0.01,
                                            ),
                                            child: Text(
                                              'Nominee DOB',
                                              style: TextStyle(
                                                fontSize:
                                                    screenWidth *
                                                    0.04, // Responsive font
                                                color: Colors.black87,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height:
                                                screenHeight *
                                                0.25, // Responsive height
                                            child: CupertinoDatePicker(
                                              initialDateTime: selectedDate,
                                              mode:
                                                  CupertinoDatePickerMode.date,
                                              use24hFormat: true,
                                              onDateTimeChanged:
                                                  (DateTime newDate) {
                                                    selectedDate = newDate;
                                                    displayMonth =
                                                        DateFormat.MMMM()
                                                            .format(newDate);
                                                    displayDay = newDate.day
                                                        .toString();
                                                    displayYear = newDate.year
                                                        .toString();
                                                  },
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  screenWidth *
                                                  0.04, // Responsive padding
                                              vertical:
                                                  screenHeight *
                                                  0.01, // Responsive padding
                                            ),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                isDateSelected = true;
                                                Navigator.pop(context);
                                              },
                                              child: Text('Save'),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue,
                                                foregroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        screenWidth * 0.02,
                                                      ), // Responsive radius
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                if (isDateSelected) {
                                  viewModel.dobController.text =
                                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Nominee DOB',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    screenWidth * 0.02,
                                  ), // Responsive radius
                                  borderSide: BorderSide(
                                    color: Colors.grey[300]!,
                                  ),
                                ),
                                suffixIcon: Icon(
                                  Icons.calendar_today,
                                  size: screenWidth * 0.05,
                                ), // Responsive icon
                              ),
                              validator: (value) {
                                if ((value == null || value.isEmpty)) {
                                  return 'Date of Birth is required';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ), // Responsive spacing
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(screenWidth * 0.02), // Responsive padding
          child: Consumer<CareSupremeNomineeViewModel>(
            builder: (context, viewModel, child) {
              return ElevatedButton(
                onPressed: () {
                  // Trigger validation when button is pressed
                  if (viewModel.formKey.currentState?.validate() ?? false) {
                    // If form is valid, proceed with navigation
                    Navigator.pushNamed(
                      context,
                      RouteNames.careSupremeCheckoutScreen,
                    );
                    // Optionally clear form after submission
                    // viewModel.clearForm();
                  } else {
                    // Handle invalid form case, e.g., show an error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please fill in all required fields'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.017),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.017, // Responsive padding
                    horizontal: screenWidth * 0.1, // Responsive padding
                  ),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                  ), // Responsive font
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../viewmodel/nominee_viewmodel.dart';
//
// class CareSupremeNomineeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => CareSupremeNomineeViewModel(),
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back_ios, color: Colors.black),
//             onPressed: () => Navigator.pop(context),
//           ),
//           title: Row(
//             children: [
//               Image.asset('assets/images/care_logo.png', width: 30, height: 30),
//               SizedBox(width: 8),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Care Supreme',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Text(
//                     '1 member • ₹10 Lakhs • 1 year',
//                     style: TextStyle(fontSize: 12, color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           // actions: [
//           //   TextButton.icon(
//           //     icon: Icon(Icons.public, color: Colors.blue),
//           //     label: Text('View on Web', style: TextStyle(color: Colors.blue)),
//           //     onPressed: () {
//           //       // TODO: Implement view on web functionality
//           //     },
//           //   ),
//           // ],
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Consumer<CareSupremeNomineeViewModel>(
//             builder: (context, viewModel, child) {
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Progress Indicator
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Row(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 border: Border.all(
//                                   color: Colors.green,
//                                   width: 1,
//                                 ),
//                               ),
//                               child: CircleAvatar(
//                                 backgroundColor: Colors.green,
//                                 radius: 12,
//                                 child: Icon(
//                                   Icons.check,
//                                   size: 16,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: Container(height: 2, color: Colors.green),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         child: Row(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 border: Border.all(
//                                   color: Colors.green,
//                                   width: 1,
//                                 ),
//                               ),
//                               child: CircleAvatar(
//                                 backgroundColor: Colors.green,
//                                 radius: 12,
//                                 child: Icon(
//                                   Icons.check,
//                                   size: 16,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: Container(
//                                 height: 2,
//                                 color: Colors.grey[300],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(color: Colors.blue, width: 2),
//                         ),
//                         child: CircleAvatar(
//                           backgroundColor: Colors.white,
//                           radius: 12,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('Members', style: TextStyle(fontSize: 12)),
//                       Text('Medical', style: TextStyle(fontSize: 12)),
//                       Text('Nominee', style: TextStyle(fontSize: 12)),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     'WHO DO YOU WANT TO MAKE NOMINEE?',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 20),
//                   Expanded(
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           TextFormField(
//                             controller: viewModel.nomineeController,
//                             decoration: InputDecoration(
//                               labelText: 'Choose Nominee',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 borderSide: BorderSide(
//                                   color: Colors.grey[300]!,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 16),
//                           DropdownButtonFormField<String>(
//                             decoration: InputDecoration(
//                               labelText: 'Nominee Relationship',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 borderSide: BorderSide(
//                                   color: Colors.grey[300]!,
//                                 ),
//                               ),
//                             ),
//                             value: viewModel.nomineeRelationship,
//                             items: [
//                               DropdownMenuItem(
//                                 value: 'Spouse',
//                                 child: Text('Spouse'),
//                               ),
//                               DropdownMenuItem(
//                                 value: 'Child',
//                                 child: Text('Child'),
//                               ),
//                               DropdownMenuItem(
//                                 value: 'Parent',
//                                 child: Text('Parent'),
//                               ),
//                             ],
//                             onChanged: (value) =>
//                                 viewModel.setNomineeRelationship(value),
//                           ),
//                           SizedBox(height: 16),
//                           TextFormField(
//                             controller: viewModel.nameController,
//                             decoration: InputDecoration(
//                               labelText: 'Name',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 borderSide: BorderSide(
//                                   color: Colors.grey[300]!,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 16),
//                           TextFormField(
//                             controller: viewModel.dobController,
//                             decoration: InputDecoration(
//                               labelText: 'Nominee’s Date of Birth',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 borderSide: BorderSide(
//                                   color: Colors.grey[300]!,
//                                 ),
//                               ),
//                               suffixIcon: IconButton(
//                                 icon: Icon(Icons.calendar_today),
//                                 onPressed: () async {},
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 16),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//         bottomNavigationBar: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Consumer<CareSupremeNomineeViewModel>(
//             builder: (context, viewModel, child) {
//               return ElevatedButton(
//                 onPressed: viewModel.validateForm()
//                     ? () {
//                         // TODO: Implement submission logic
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(builder: (context) => NivaMedicalScreen2()),
//                         // );
//                         // viewModel.clearForm(); // Clear form after submission
//                       }
//                     : null,
//                 child: Text('Submit'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   foregroundColor: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(7),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
