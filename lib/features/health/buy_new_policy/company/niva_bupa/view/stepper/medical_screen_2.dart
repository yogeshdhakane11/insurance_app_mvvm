import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../../../routes/routes_name.dart';
import '../../viewmodel/stepper/medical_screen_2_viewmodel.dart';

class NivaMedicalScreen2 extends StatelessWidget {
  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (context) => MedicalScreen2Viewmodel(),
      child: Consumer<MedicalScreen2Viewmodel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: screenWidth * 0.06, // Responsive icon size
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/niva_bupa.png',
                    width: screenWidth * 0.08, // Responsive image width
                    height: screenWidth * 0.08, // Responsive image height
                  ),
                  SizedBox(width: screenWidth * 0.03), // Responsive spacing
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Niva Bupa ReAssure 2.0',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04, // Responsive font size
                          fontWeight: FontWeight.w500,
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
              padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.green, width: 1),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: screenWidth * 0.03, // Responsive radius
                          child: Icon(
                            Icons.check,
                            size: screenWidth * 0.04, // Responsive icon size
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: 1,
                          minHeight: screenHeight * 0.002, // Responsive height
                          color: Colors.green,
                          backgroundColor: Colors.grey[300],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: CircleAvatar(
                          radius: screenWidth * 0.03, // Responsive radius
                          backgroundColor: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: 0,
                          minHeight: screenHeight * 0.002, // Responsive height
                          color: Colors.green,
                          backgroundColor: Colors.grey[300],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: CircleAvatar(
                          radius: screenWidth * 0.03, // Responsive radius
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.015), // Responsive spacing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Members',
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                        ), // Responsive font
                      ),
                      Text(
                        'Medical',
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                        ), // Responsive font
                      ),
                      Text(
                        'Nominee',
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                        ), // Responsive font
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.025), // Responsive spacing
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Answer the upcoming medical history questions carefully',
                            style: TextStyle(
                              fontSize:
                                  screenWidth * 0.04, // Responsive font size
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.015,
                          ), // Responsive spacing
                          Text(
                            'Other than common cold, flu, infections, minor injury or other minor ailments: has the Applicant ever been diagnosed with any disease and / or hospitalized for more than 5 days and / or undergone / advised to undergo any surgical procedures and / or taken any medication/ had any symptoms for more than 14 days? Medication is including but not limited to inhalers, injections, oral drugs and external medical applications on body parts.',
                            style: TextStyle(
                              fontSize: screenWidth * 0.038,
                            ), // Responsive font size
                          ),
                          SizedBox(
                            height: screenHeight * 0.015,
                          ), // Responsive spacing
                          CheckboxListTile(
                            title: Text(
                              'Yogesh Dhakane',
                              style: TextStyle(
                                fontSize: screenWidth * 0.04,
                              ), // Responsive font
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: Colors.blue,
                            contentPadding: EdgeInsets.zero,
                            value: viewModel.isApplicableChecked,
                            onChanged: (value) {
                              if (value != null) {
                                viewModel.toggleApplicableChecked(value);
                              }
                            },
                          ),
                          CheckboxListTile(
                            title: Text(
                              'Not Applicable',
                              style: TextStyle(
                                fontSize: screenWidth * 0.04,
                              ), // Responsive font
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: Colors.blue,
                            contentPadding: EdgeInsets.zero,
                            value: viewModel.isNotApplicableChecked,
                            onChanged: (value) {
                              if (value != null) {
                                viewModel.toggleNotApplicableChecked(value);
                              }
                            },
                          ),
                          SizedBox(
                            height: screenHeight * 0.015,
                          ), // Responsive spacing
                          if (viewModel.isApplicableChecked)
                            Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Please provide details for member(s) suffering from declared condition(s)',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                    ), // Responsive font
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.015,
                                  ), // Responsive spacing
                                  Text(
                                    'Details of symptom(s) or investigation(s) or diagnosis or procedure/surgery undergone',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                    ), // Responsive font
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.025,
                                  ), // Responsive spacing
                                  Text(
                                    'Yogesh Dhakane',
                                    style: TextStyle(
                                      fontSize:
                                          screenWidth *
                                          0.04, // Responsive font size
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.015,
                                  ), // Responsive spacing
                                  Text(
                                    'Details',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                    ), // Responsive font
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Details',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical:
                                            screenHeight *
                                            0.012, // Responsive padding
                                        horizontal:
                                            screenWidth *
                                            0.03, // Responsive padding
                                      ),
                                    ),
                                    controller: viewModel.detailsController,
                                    validator: (value) {
                                      if (viewModel.isApplicableChecked &&
                                          (value == null || value.isEmpty)) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.018,
                                  ), // Responsive spacing
                                  Text(
                                    'Onset Date',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                    ), // Responsive font
                                  ),
                                  TextFormField(
                                    controller: viewModel.onsetDateController,
                                    readOnly: true,
                                    onTap: () async {
                                      DateTime selectedDate = DateTime.now();
                                      bool isDateSelected = false;

                                      String displayMonth = DateFormat.MMMM()
                                          .format(selectedDate);
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
                                                0.38, // Responsive height
                                            padding: EdgeInsets.only(
                                              top: screenHeight * 0.007,
                                            ),
                                            margin: EdgeInsets.only(
                                              bottom: MediaQuery.of(
                                                context,
                                              ).viewInsets.bottom,
                                            ),
                                            color: CupertinoColors
                                                .systemBackground
                                                .resolveFrom(context),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical:
                                                        screenHeight * 0.01,
                                                  ),
                                                  child: Text(
                                                    'Select Onset Date',
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
                                                    initialDateTime:
                                                        selectedDate,
                                                    mode:
                                                        CupertinoDatePickerMode
                                                            .date,
                                                    use24hFormat: true,
                                                    onDateTimeChanged:
                                                        (DateTime newDate) {
                                                          selectedDate =
                                                              newDate;
                                                          displayMonth =
                                                              DateFormat.MMMM()
                                                                  .format(
                                                                    newDate,
                                                                  );
                                                          displayDay = newDate
                                                              .day
                                                              .toString();
                                                          displayYear = newDate
                                                              .year
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
                                                      backgroundColor:
                                                          Colors.blue,
                                                      foregroundColor:
                                                          Colors.white,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              screenWidth *
                                                                  0.02,
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
                                        viewModel.onsetDateController.text =
                                            '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
                                      }
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Onset Date',
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
                                      if (viewModel.isApplicableChecked &&
                                          (value == null || value.isEmpty)) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.018,
                                  ), // Responsive spacing
                                  Text(
                                    'Medicine Name',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                    ), // Responsive font
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Medicine Name',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical:
                                            screenHeight *
                                            0.012, // Responsive padding
                                        horizontal:
                                            screenWidth *
                                            0.03, // Responsive padding
                                      ),
                                    ),
                                    controller:
                                        viewModel.medicineNameController,
                                    validator: (value) {
                                      if (viewModel.isApplicableChecked &&
                                          (value == null || value.isEmpty)) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.018,
                                  ), // Responsive spacing
                                  Text(
                                    'Dosage',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                    ), // Responsive font
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Dosage',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical:
                                            screenHeight *
                                            0.012, // Responsive padding
                                        horizontal:
                                            screenWidth *
                                            0.03, // Responsive padding
                                      ),
                                    ),
                                    controller: viewModel.dosageController,
                                    validator: (value) {
                                      if (viewModel.isApplicableChecked &&
                                          (value == null || value.isEmpty)) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.018,
                                  ), // Responsive spacing
                                  Text(
                                    'Current Status',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                    ), // Responsive font
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Current Status',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical:
                                            screenHeight *
                                            0.012, // Responsive padding
                                        horizontal:
                                            screenWidth *
                                            0.03, // Responsive padding
                                      ),
                                    ),
                                    controller:
                                        viewModel.currentStatusController,
                                    validator: (value) {
                                      if (viewModel.isApplicableChecked &&
                                          (value == null || value.isEmpty)) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.018,
                                  ), // Responsive spacing
                                  Text(
                                    'Treating Doctor\'s Details',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                    ), // Responsive font
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Treating Doctor\'s Details',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical:
                                            screenHeight *
                                            0.012, // Responsive padding
                                        horizontal:
                                            screenWidth *
                                            0.03, // Responsive padding
                                      ),
                                    ),
                                    controller:
                                        viewModel.treatingDoctorController,
                                    validator: (value) {
                                      if (viewModel.isApplicableChecked &&
                                          (value == null || value.isEmpty)) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.015,
                                  ), // Responsive spacing
                                ],
                              ),
                            ),
                          if (viewModel.showError)
                            Text(
                              '* Required',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize:
                                    screenWidth * 0.035, // Responsive font
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(
                screenWidth * 0.035,
              ), // Responsive padding
              child: ElevatedButton(
                onPressed: () {
                  viewModel.validateCheckboxes();
                  if (viewModel.isApplicableChecked) {
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      Navigator.pushNamed(
                        context,
                        RouteNames.nivaMedicalScreen3,
                      );
                    }
                  } else if (viewModel.isNotApplicableChecked) {
                    Navigator.pushNamed(context, RouteNames.nivaMedicalScreen3);
                  }
                },
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                  ), // Responsive font
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.017,
                  ), // Responsive padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      screenWidth * 0.017,
                    ), // Responsive radius
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
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
//
// import '../../viewmodel/stepper/medical_screen_2_viewmodel.dart';
// import 'medical_screen_3.dart';
//
// class NivaMedicalScreen2 extends StatelessWidget {
//   // Form key for validation
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => MedicalScreen2Viewmodel(),
//       child: Consumer<MedicalScreen2Viewmodel>(
//         builder: (context, viewModel, _) {
//           return Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.white,
//               leading: IconButton(
//                 icon: const Icon(Icons.arrow_back_ios),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               title: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Image.asset(
//                     'assets/images/niva_bupa.png',
//                     width: 30,
//                     height: 30,
//                   ),
//                   SizedBox(width: 11),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: const [
//                       Text(
//                         'Niva Bupa ReAssure 2.0',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
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
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(color: Colors.green, width: 1),
//                         ),
//                         child: CircleAvatar(
//                           backgroundColor: Colors.green,
//                           radius: 12,
//                           child: Icon(
//                             Icons.check,
//                             size: 16,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: LinearProgressIndicator(
//                           value: 1,
//                           minHeight: 2,
//                           color: Colors.green,
//                           backgroundColor: Colors.grey[300],
//                         ),
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(color: Colors.grey, width: 1),
//                         ),
//                         child: CircleAvatar(
//                           radius: 12,
//                           backgroundColor: Colors.white,
//                         ),
//                       ),
//                       Expanded(
//                         child: LinearProgressIndicator(
//                           value: 0,
//                           minHeight: 2,
//                           color: Colors.green,
//                           backgroundColor: Colors.grey[300],
//                         ),
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(color: Colors.grey, width: 1),
//                         ),
//                         child: CircleAvatar(
//                           radius: 12,
//                           backgroundColor: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 11),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('Members'),
//                       Text('Medical'),
//                       Text('Nominee'),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Expanded(
//                     child: SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Answer the upcoming medical history questions carefully',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 11),
//                           Text(
//                             'Other than common cold, flu, infections, minor injury or other minor ailments: has the Applicant ever been diagnosed with any disease and / or hospitalized for more than 5 days and / or undergone / advised to undergo any surgical procedures and / or taken any medication/ had any symptoms for more than 14 days? Medication is including but not limited to inhalers, injections, oral drugs and external medical applications on body parts.',
//                             style: TextStyle(fontSize: 15),
//                           ),
//                           SizedBox(height: 11),
//                           CheckboxListTile(
//                             title: Text('Yogesh Dhakane'),
//                             controlAffinity: ListTileControlAffinity.leading,
//                             activeColor: Colors.blue,
//                             contentPadding: EdgeInsets.zero,
//                             value: viewModel.isApplicableChecked,
//                             onChanged: (value) {
//                               if (value != null) {
//                                 viewModel.toggleApplicableChecked(value);
//                               }
//                             },
//                           ),
//                           CheckboxListTile(
//                             title: Text('Not Applicable'),
//                             controlAffinity: ListTileControlAffinity.leading,
//                             activeColor: Colors.blue,
//                             contentPadding: EdgeInsets.zero,
//                             value: viewModel.isNotApplicableChecked,
//                             onChanged: (value) {
//                               if (value != null) {
//                                 viewModel.toggleNotApplicableChecked(value);
//                               }
//                             },
//                           ),
//                           SizedBox(height: 11),
//                           if (viewModel.isApplicableChecked)
//                             Form(
//                               key: _formKey,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Please provide details for member(s) suffering from declared condition(s)',
//                                     style: TextStyle(fontSize: 14),
//                                   ),
//                                   SizedBox(height: 11),
//                                   Text(
//                                     'Details of symptom(s) or investigation(s) or diagnosis or procedure/surgery undergone',
//                                     style: TextStyle(fontSize: 14),
//                                   ),
//                                   SizedBox(height: 20),
//                                   Text(
//                                     'Yogesh Dhakane',
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.blue,
//                                     ),
//                                   ),
//                                   SizedBox(height: 11),
//                                   Text('Details'),
//                                   TextFormField(
//                                     decoration: InputDecoration(
//                                       hintText: 'Details',
//                                       border: OutlineInputBorder(),
//                                       contentPadding: EdgeInsets.symmetric(
//                                         vertical: 10,
//                                         horizontal: 12,
//                                       ),
//                                     ),
//                                     controller: viewModel.detailsController,
//                                     validator: (value) {
//                                       if (viewModel.isApplicableChecked &&
//                                           (value == null || value.isEmpty)) {
//                                         return 'This field is required';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   SizedBox(height: 15),
//                                   Text('Onset Date'),
//                                   TextFormField(
//                                     controller: viewModel.onsetDateController,
//                                     readOnly:
//                                         true, // Prevents manual text input
//                                     onTap: () async {
//                                       DateTime selectedDate = DateTime.now();
//                                       bool isDateSelected = false;
//
//                                       // Format the date initially
//                                       String displayMonth = DateFormat.MMMM()
//                                           .format(
//                                             selectedDate,
//                                           ); // Full month name
//                                       String displayDay = selectedDate.day
//                                           .toString();
//                                       String displayYear = selectedDate.year
//                                           .toString();
//
//                                       await showCupertinoModalPopup<void>(
//                                         context: context,
//                                         builder: (BuildContext context) {
//                                           return Container(
//                                             height:
//                                                 311, // Adjusted height for better layout
//                                             padding: const EdgeInsets.only(
//                                               top: 6.0,
//                                             ),
//                                             margin: EdgeInsets.only(
//                                               bottom: MediaQuery.of(
//                                                 context,
//                                               ).viewInsets.bottom,
//                                             ),
//                                             color: CupertinoColors
//                                                 .systemBackground
//                                                 .resolveFrom(context),
//                                             child: Column(
//                                               children: [
//                                                 // Title
//                                                 Padding(
//                                                   padding:
//                                                       const EdgeInsets.symmetric(
//                                                         vertical: 8.0,
//                                                       ),
//                                                   child: Text(
//                                                     'Select Date of Birth',
//                                                     style: TextStyle(
//                                                       fontSize: 16,
//                                                       color: Colors.black87,
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 // Date Picker
//                                                 Container(
//                                                   height:
//                                                       200, // Adjusted height for date picker
//                                                   child: CupertinoDatePicker(
//                                                     initialDateTime:
//                                                         selectedDate,
//                                                     mode:
//                                                         CupertinoDatePickerMode
//                                                             .date,
//                                                     use24hFormat: true,
//                                                     onDateTimeChanged:
//                                                         (DateTime newDate) {
//                                                           selectedDate =
//                                                               newDate;
//                                                           displayMonth =
//                                                               DateFormat.MMMM()
//                                                                   .format(
//                                                                     newDate,
//                                                                   );
//                                                           displayDay = newDate
//                                                               .day
//                                                               .toString();
//                                                           displayYear = newDate
//                                                               .year
//                                                               .toString();
//                                                         },
//                                                   ),
//                                                 ),
//                                                 // Save Button
//                                                 Container(
//                                                   width: double.infinity,
//                                                   padding: EdgeInsets.symmetric(
//                                                     horizontal: 16.0,
//                                                     vertical: 8.0,
//                                                   ),
//                                                   child: ElevatedButton(
//                                                     onPressed: () {
//                                                       isDateSelected = true;
//                                                       Navigator.pop(context);
//                                                     },
//                                                     child: Text('Save'),
//                                                     style: ElevatedButton.styleFrom(
//                                                       backgroundColor:
//                                                           Colors.blue,
//                                                       foregroundColor:
//                                                           Colors.white,
//                                                       shape: RoundedRectangleBorder(
//                                                         borderRadius:
//                                                             BorderRadius.circular(
//                                                               8,
//                                                             ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           );
//                                         },
//                                       );
//                                       // Update the text field only if Save button is pressed
//                                       if (isDateSelected) {
//                                         viewModel.onsetDateController.text =
//                                             '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
//                                       }
//                                     },
//                                     decoration: InputDecoration(
//                                       hintText: 'Onset Date',
//                                       border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(8),
//                                         borderSide: BorderSide(
//                                           color: Colors.grey[300]!,
//                                         ),
//                                       ),
//                                       suffixIcon: Icon(Icons.calendar_today),
//                                     ),
//                                     validator: (value) {
//                                       if (viewModel.isApplicableChecked &&
//                                           (value == null || value.isEmpty)) {
//                                         return 'This field is required';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   SizedBox(height: 15),
//                                   Text('Medicine Name'),
//                                   TextFormField(
//                                     decoration: InputDecoration(
//                                       hintText: 'Medicine Name',
//                                       border: OutlineInputBorder(),
//                                       contentPadding: EdgeInsets.symmetric(
//                                         vertical: 10,
//                                         horizontal: 12,
//                                       ),
//                                     ),
//                                     controller:
//                                         viewModel.medicineNameController,
//                                     validator: (value) {
//                                       if (viewModel.isApplicableChecked &&
//                                           (value == null || value.isEmpty)) {
//                                         return 'This field is required';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   SizedBox(height: 15),
//                                   Text('Dosage'),
//                                   TextFormField(
//                                     decoration: InputDecoration(
//                                       hintText: 'Dosage',
//                                       border: OutlineInputBorder(),
//                                       contentPadding: EdgeInsets.symmetric(
//                                         vertical: 10,
//                                         horizontal: 12,
//                                       ),
//                                     ),
//                                     controller: viewModel.dosageController,
//                                     validator: (value) {
//                                       if (viewModel.isApplicableChecked &&
//                                           (value == null || value.isEmpty)) {
//                                         return 'This field is required';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   SizedBox(height: 15),
//                                   Text('Current Status'),
//                                   TextFormField(
//                                     decoration: InputDecoration(
//                                       hintText: 'Current Status',
//                                       border: OutlineInputBorder(),
//                                       contentPadding: EdgeInsets.symmetric(
//                                         vertical: 10,
//                                         horizontal: 12,
//                                       ),
//                                     ),
//                                     controller:
//                                         viewModel.currentStatusController,
//                                     validator: (value) {
//                                       if (viewModel.isApplicableChecked &&
//                                           (value == null || value.isEmpty)) {
//                                         return 'This field is required';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   SizedBox(height: 15),
//                                   Text('Treating Doctor\'s Details'),
//                                   TextFormField(
//                                     decoration: InputDecoration(
//                                       hintText: 'Treating Doctor\'s Details',
//                                       border: OutlineInputBorder(),
//                                       contentPadding: EdgeInsets.symmetric(
//                                         vertical: 10,
//                                         horizontal: 12,
//                                       ),
//                                     ),
//                                     controller:
//                                         viewModel.treatingDoctorController,
//                                     validator: (value) {
//                                       if (viewModel.isApplicableChecked &&
//                                           (value == null || value.isEmpty)) {
//                                         return 'This field is required';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   SizedBox(height: 11),
//                                 ],
//                               ),
//                             ),
//                           if (viewModel.showError)
//                             Text(
//                               '* Required',
//                               style: TextStyle(color: Colors.red),
//                             ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             bottomNavigationBar: Padding(
//               padding: const EdgeInsets.all(14),
//               child: ElevatedButton(
//                 onPressed: () {
//                   viewModel.validateCheckboxes();
//                   // If 'isApplicableChecked' is selected, validate the form
//                   if (viewModel.isApplicableChecked) {
//                     if (_formKey.currentState != null &&
//                         _formKey.currentState!.validate()) {
//                       // If form is valid, proceed to next screen
//                       Navigator.push(
//                         context,
//                         CupertinoPageRoute(
//                           builder: (context) => NivaMedicalScreen3(),
//                         ),
//                       );
//                     }
//                   }
//                   // If 'isNotApplicableChecked' is selected, directly proceed to the next screen
//                   else if (viewModel.isNotApplicableChecked) {
//                     Navigator.push(
//                       context,
//                       CupertinoPageRoute(
//                         builder: (context) => NivaMedicalScreen3(),
//                       ),
//                     );
//                   }
//                 },
//                 child: Text('Next'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   foregroundColor: Colors.white,
//                   padding: EdgeInsets.symmetric(vertical: 14),
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
