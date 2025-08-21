import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../../../routes/routes_name.dart';
import '../../viewmodel/stepper/nominee_viewmodel.dart';
import 'medical_screen_2.dart';

class NivaBupaNomineeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (context) => NomineeViewModel(),
      child: Consumer<NomineeViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            appBar: AppBar(
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
                    'assets/images/niva_bupa.png',
                    width: screenWidth * 0.08, // Responsive image width
                    height: screenWidth * 0.08, // Responsive image height
                  ),
                  SizedBox(width: screenWidth * 0.02), // Responsive spacing
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Niva Bupa ReAssure 2.0',
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Progress Indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Step 1: Members (Completed)
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
                      // Step 2: Medical (Completed)
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
                      // Step 3: Nominee (Current)
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
                  // Form Title
                  Text(
                    'WHO DO YOU WANT TO MAKE NOMINEE?',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04, // Responsive font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025), // Responsive spacing
                  // Form Fields
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Form(
                        key: viewModel.formKey,
                        child: Padding(
                          padding: EdgeInsets.all(
                            screenWidth * 0.017,
                          ), // Responsive padding
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.035,
                                ), // Responsive font
                              ),
                              TextFormField(
                                controller: viewModel.nameController,
                                decoration: InputDecoration(
                                  hintText: 'Name',
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
                                        screenWidth *
                                        0.03, // Responsive padding
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a name';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: screenHeight * 0.02,
                              ), // Responsive spacing
                              Text(
                                'Relationship',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.035,
                                ), // Responsive font
                              ),
                              DropdownButtonFormField<String>(
                                value: viewModel.selectedRelationship,
                                decoration: InputDecoration(
                                  hintText: 'Relationship',
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
                                        screenWidth *
                                        0.03, // Responsive padding
                                  ),
                                ),
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
                                onChanged: (value) {
                                  viewModel.setRelationship(value);
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please select a relationship';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: screenHeight * 0.02,
                              ), // Responsive spacing
                              Text(
                                'Nominee Date of Birth',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.035,
                                ), // Responsive font
                              ),
                              TextFormField(
                                controller: viewModel.dobController,
                                readOnly: true, // Prevents manual text input
                                onTap: () async {
                                  DateTime selectedDate = DateTime.now();
                                  bool isDateSelected = false;

                                  // Format the date initially
                                  String displayMonth = DateFormat.MMMM()
                                      .format(selectedDate); // Full month name
                                  String displayDay = selectedDate.day
                                      .toString();
                                  String displayYear = selectedDate.year
                                      .toString();

                                  await showCupertinoModalPopup<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        height:
                                            screenHeight *
                                            0.40, // Responsive height
                                        padding: EdgeInsets.only(
                                          top:
                                              screenHeight *
                                              0.007, // Responsive padding
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
                                            // Title
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical:
                                                    screenHeight *
                                                    0.01, // Responsive padding
                                              ),
                                              child: Text(
                                                'Select Date of Birth',
                                                style: TextStyle(
                                                  fontSize:
                                                      screenWidth *
                                                      0.04, // Responsive font size
                                                  color: Colors.black87,
                                                ),
                                              ),
                                            ),
                                            // Date Picker
                                            Container(
                                              height:
                                                  screenHeight *
                                                  0.25, // Responsive height
                                              child: CupertinoDatePicker(
                                                initialDateTime: selectedDate,
                                                mode: CupertinoDatePickerMode
                                                    .date,
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
                                            // Save Button
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
                                                child: Text(
                                                  'Save',
                                                  style: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.04,
                                                  ), // Responsive font
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                  // Update the text field only if Save button is pressed
                                  if (isDateSelected) {
                                    viewModel.dobController.text =
                                        '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: 'Nominee’s Date of Birth',
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
                                        screenWidth *
                                        0.03, // Responsive padding
                                  ),
                                  suffixIcon: Icon(
                                    Icons.calendar_today,
                                    size:
                                        screenWidth *
                                        0.05, // Responsive icon size
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select a date of birth';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: screenHeight * 0.02,
                              ), // Responsive spacing
                              Text(
                                'Phone Number',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.035,
                                ), // Responsive font
                              ),
                              TextFormField(
                                controller: viewModel.phoneController,
                                decoration: InputDecoration(
                                  hintText: 'Phone Number',
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
                                        screenWidth *
                                        0.03, // Responsive padding
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a phone number';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: screenHeight * 0.02,
                              ), // Responsive spacing
                              Text(
                                'Address',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.035,
                                ), // Responsive font
                              ),
                              TextFormField(
                                controller: viewModel.addressController,
                                decoration: InputDecoration(
                                  hintText: 'Address',
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
                                        screenWidth *
                                        0.03, // Responsive padding
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter an address';
                                  }
                                  return null;
                                },
                              ),
                              CheckboxListTile(
                                title: Text(
                                  'Address same as proposer',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.04,
                                  ), // Responsive font
                                ),
                                value: viewModel.isAddressSameAsProposer,
                                onChanged: (value) {
                                  viewModel.toggleAddressCheckbox(
                                    value ?? false,
                                  );
                                },
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.01,
                                ),
                                activeColor: Colors.blue,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(
                screenWidth * 0.027,
              ), // Responsive padding
              child: ElevatedButton(
                onPressed: () {
                  // Validate the form
                  if (viewModel.formKey.currentState?.validate() ?? false) {
                    // Navigate
                    Navigator.pushNamed(
                      context,
                      RouteNames.nivaCompleteKycScreen,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      screenWidth * 0.017,
                    ), // Responsive radius
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02, // Responsive padding
                    horizontal: screenWidth * 0.1, // Responsive padding
                  ),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                  ), // Responsive font
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
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
//
// import '../../viewmodel/stepper/nominee_viewmodel.dart';
// import 'medical_screen_2.dart';
//
// class NivaBupaNomineeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => NomineeViewModel(),
//       child: Consumer<NomineeViewModel>(
//         builder: (context, viewModel, _) {
//           return Scaffold(
//             appBar: AppBar(
//               leading: IconButton(
//                 icon: Icon(Icons.arrow_back_ios, color: Colors.black),
//                 onPressed: () => Navigator.pop(context),
//               ),
//               title: Row(
//                 children: [
//                   // Assuming the logo is available in assets
//                   Image.asset(
//                     'assets/images/niva_bupa.png',
//                     width: 30,
//                     height: 30,
//                   ),
//                   SizedBox(width: 8),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Niva Bupa ReAssure 2.0',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                         ),
//                       ),
//                       Text(
//                         '1 member • ₹10 Lakhs • 1 year',
//                         style: TextStyle(fontSize: 12, color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             body: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Progress Indicator
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Step 1: Members (Completed)
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
//                       // Step 2: Medical (Completed)
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
//                       // Step 3: Nominee (Current)
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
//                   // Form Title
//                   Text(
//                     'WHO DO YOU WANT TO MAKE NOMINEE?',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 20),
//                   // Form Fields
//                   Expanded(
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.vertical,
//                       child: Form(
//                         key: viewModel.formKey,
//                         child: Padding(
//                           padding: const EdgeInsets.all(7.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('Name'),
//                               TextFormField(
//                                 controller: viewModel.nameController,
//                                 decoration: InputDecoration(
//                                   hintText: 'Name',
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                     borderSide: BorderSide(
//                                       color: Colors.grey[300]!,
//                                     ),
//                                   ),
//                                 ),
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter a name';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                               SizedBox(height: 16),
//                               Text('Relationship'),
//                               DropdownButtonFormField<String>(
//                                 value: viewModel.selectedRelationship,
//                                 decoration: InputDecoration(
//                                   hintText: 'Relationship',
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                     borderSide: BorderSide(
//                                       color: Colors.grey[300]!,
//                                     ),
//                                   ),
//                                 ),
//                                 items: [
//                                   DropdownMenuItem(
//                                     value: 'Spouse',
//                                     child: Text('Spouse'),
//                                   ),
//                                   DropdownMenuItem(
//                                     value: 'Child',
//                                     child: Text('Child'),
//                                   ),
//                                   DropdownMenuItem(
//                                     value: 'Parent',
//                                     child: Text('Parent'),
//                                   ),
//                                 ],
//                                 onChanged: (value) {
//                                   viewModel.setRelationship(value);
//                                 },
//                                 validator: (value) {
//                                   if (value == null) {
//                                     return 'Please select a relationship';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                               SizedBox(height: 16),
//                               Text('Nominee Date of Birth'),
//                               TextFormField(
//                                 controller: viewModel.dobController,
//                                 readOnly: true, // Prevents manual text input
//                                 onTap: () async {
//                                   DateTime selectedDate = DateTime.now();
//                                   bool isDateSelected = false;
//
//                                   // Format the date initially
//                                   String displayMonth = DateFormat.MMMM()
//                                       .format(selectedDate); // Full month name
//                                   String displayDay = selectedDate.day
//                                       .toString();
//                                   String displayYear = selectedDate.year
//                                       .toString();
//
//                                   await showCupertinoModalPopup<void>(
//                                     context: context,
//                                     builder: (BuildContext context) {
//                                       return Container(
//                                         height:
//                                             311, // Adjusted height for better layout
//                                         padding: const EdgeInsets.only(
//                                           top: 6.0,
//                                         ),
//                                         margin: EdgeInsets.only(
//                                           bottom: MediaQuery.of(
//                                             context,
//                                           ).viewInsets.bottom,
//                                         ),
//                                         color: CupertinoColors.systemBackground
//                                             .resolveFrom(context),
//                                         child: Column(
//                                           children: [
//                                             // Title
//                                             Padding(
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                     vertical: 8.0,
//                                                   ),
//                                               child: Text(
//                                                 'Select Date of Birth',
//                                                 style: TextStyle(
//                                                   fontSize: 16,
//                                                   color: Colors.black87,
//                                                 ),
//                                               ),
//                                             ),
//                                             // Date Picker
//                                             Container(
//                                               height:
//                                                   200, // Adjusted height for date picker
//                                               child: CupertinoDatePicker(
//                                                 initialDateTime: selectedDate,
//                                                 mode: CupertinoDatePickerMode
//                                                     .date,
//                                                 use24hFormat: true,
//                                                 onDateTimeChanged:
//                                                     (DateTime newDate) {
//                                                       selectedDate = newDate;
//                                                       displayMonth =
//                                                           DateFormat.MMMM()
//                                                               .format(newDate);
//                                                       displayDay = newDate.day
//                                                           .toString();
//                                                       displayYear = newDate.year
//                                                           .toString();
//                                                     },
//                                               ),
//                                             ),
//                                             // Save Button
//                                             Container(
//                                               width: double.infinity,
//                                               padding: EdgeInsets.symmetric(
//                                                 horizontal: 16.0,
//                                                 vertical: 8.0,
//                                               ),
//                                               child: ElevatedButton(
//                                                 onPressed: () {
//                                                   isDateSelected = true;
//                                                   Navigator.pop(context);
//                                                 },
//                                                 child: Text('Save'),
//                                                 style: ElevatedButton.styleFrom(
//                                                   backgroundColor: Colors.blue,
//                                                   foregroundColor: Colors.white,
//                                                   shape: RoundedRectangleBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                           8,
//                                                         ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       );
//                                     },
//                                   );
//                                   // Update the text field only if Save button is pressed
//                                   if (isDateSelected) {
//                                     viewModel.dobController.text =
//                                         '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
//                                   }
//                                 },
//                                 decoration: InputDecoration(
//                                   hintText: 'Nominee’s Date of Birth',
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                     borderSide: BorderSide(
//                                       color: Colors.grey[300]!,
//                                     ),
//                                   ),
//                                   suffixIcon: Icon(Icons.calendar_today),
//                                 ),
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please select a date of birth';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                               SizedBox(height: 16),
//                               Text('Phone Number'),
//                               TextFormField(
//                                 controller: viewModel.phoneController,
//                                 decoration: InputDecoration(
//                                   hintText: 'Phone Number',
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                     borderSide: BorderSide(
//                                       color: Colors.grey[300]!,
//                                     ),
//                                   ),
//                                 ),
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter a phone number';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                               SizedBox(height: 16),
//                               Text('Address'),
//                               TextFormField(
//                                 // initialValue: 'chedechandgaon Shevgaon',
//                                 controller: viewModel.addressController,
//                                 decoration: InputDecoration(
//                                   hintText: 'Address',
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                     borderSide: BorderSide(
//                                       color: Colors.grey[300]!,
//                                     ),
//                                   ),
//                                 ),
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter an address';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                               SizedBox(height: 16),
//                               CheckboxListTile(
//                                 title: Text('Address same as proposer'),
//                                 value: viewModel.isAddressSameAsProposer,
//                                 onChanged: (value) {
//                                   viewModel.toggleAddressCheckbox(
//                                     value ?? false,
//                                   );
//                                 },
//                                 controlAffinity:
//                                     ListTileControlAffinity.leading,
//                                 activeColor: Colors.blue,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             bottomNavigationBar: Padding(
//               padding: const EdgeInsets.all(11.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Validate the form
//                   if (viewModel.formKey.currentState?.validate() ?? false) {
//                     // If form is valid, proceed to next screen
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => NivaMedicalScreen2(),
//                       ),
//                     );
//                   }
//                 },
//                 child: Text('Submit'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   foregroundColor: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(7),
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
