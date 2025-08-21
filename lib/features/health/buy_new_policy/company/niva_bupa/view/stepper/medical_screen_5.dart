import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../../routes/routes_name.dart';
import '../../viewmodel/stepper/medical_screen_5_viewmodel.dart';
import 'medical_screen_6.dart';

class NivaMedicalScreen5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (context) => MedicalScreen5Viewmodel(),
      child: Consumer<MedicalScreen5Viewmodel>(
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
                          SizedBox(
                            height: screenHeight * 0.015,
                          ), // Responsive spacing
                          Text(
                            'Does the Applicant have Hypertension or High Blood Pressure?',
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
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
                          if (viewModel.isApplicableChecked)
                            Form(
                              key: viewModel.formKey,
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
                                  // BP Dystolic Level
                                  TextFormField(
                                    controller: viewModel.bpDystolicController,
                                    decoration: InputDecoration(
                                      labelText: 'BP Dystolic level',
                                      hintText: 'Enter BP Dystolic level',
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
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'BP Dystolic level is required';
                                      }
                                      if (int.tryParse(value) == null) {
                                        return 'Please enter a valid number';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.018,
                                  ), // Responsive spacing
                                  // BP Systolic Level
                                  TextFormField(
                                    controller: viewModel.bpSystolicController,
                                    decoration: InputDecoration(
                                      labelText: 'BP Systolic level',
                                      hintText: 'Enter BP Systolic level',
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
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'BP Systolic level is required';
                                      }
                                      if (int.tryParse(value) == null) {
                                        return 'Please enter a valid number';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.018,
                                  ), // Responsive spacing
                                  // Details
                                  TextFormField(
                                    controller: viewModel.detailsController,
                                    decoration: InputDecoration(
                                      labelText: 'Details',
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
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Details are required';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.018,
                                  ), // Responsive spacing
                                  // Onset Date
                                  TextFormField(
                                    controller: viewModel.onsetDateController,
                                    decoration: InputDecoration(
                                      labelText: 'Onset Date',
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
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Onset Date is required';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.018,
                                  ), // Responsive spacing
                                  // Medicine Name
                                  TextFormField(
                                    controller:
                                        viewModel.medicineNameController,
                                    decoration: InputDecoration(
                                      labelText: 'Medicine Name',
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
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Medicine Name is required';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.018,
                                  ), // Responsive spacing
                                  // Dosage
                                  TextFormField(
                                    controller: viewModel.dosageController,
                                    decoration: InputDecoration(
                                      labelText: 'Dosage',
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
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Dosage is required';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.018,
                                  ), // Responsive spacing
                                  // Current Status
                                  TextFormField(
                                    controller:
                                        viewModel.currentStatusController,
                                    decoration: InputDecoration(
                                      labelText: 'Current Status',
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
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Current Status is required';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.018,
                                  ), // Responsive spacing
                                  // Treating Doctor's Details
                                  TextFormField(
                                    controller:
                                        viewModel.doctorDetailsController,
                                    decoration: InputDecoration(
                                      labelText: 'Treating Doctor\'s Details',
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
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Treating Doctor\'s Details are required';
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey, width: 0.4),
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02, // Responsive padding
                        horizontal: screenWidth * 0.1, // Responsive padding
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          screenWidth * 0.017,
                        ), // Responsive radius
                      ),
                    ),
                    child: Text(
                      'Previous',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                      ), // Responsive font
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.validateCheckboxes();
                      if (viewModel.isApplicableChecked) {
                        if (viewModel.formKey.currentState != null &&
                            viewModel.formKey.currentState!.validate()) {
                          Navigator.pushNamed(
                            context,
                            RouteNames.nivaMedicalScreen6,
                          );
                        }
                      } else if (viewModel.isNotApplicableChecked) {
                        Navigator.pushNamed(
                          context,
                          RouteNames.nivaMedicalScreen6,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02, // Responsive padding
                        horizontal: screenWidth * 0.1, // Responsive padding
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          screenWidth * 0.017,
                        ), // Responsive radius
                      ),
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                      ), // Responsive font
                    ),
                  ),
                ],
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
// import '../../viewmodel/stepper/medical_screen_5_viewmodel.dart';
// import 'medical_screen_6.dart';
//
// class NivaMedicalScreen5 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => MedicalScreen5Viewmodel(),
//       child: Consumer<MedicalScreen5Viewmodel>(
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
//                           SizedBox(height: 11),
//                           Text(
//                             'Does the Applicant have Hypertension or High Blood Pressure?',
//                             style: TextStyle(fontSize: 16),
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
//                           if (viewModel.isApplicableChecked)
//                             Form(
//                               key: viewModel.formKey,
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
//                                   // BP Dystolic Level
//                                   TextFormField(
//                                     controller: viewModel.bpDystolicController,
//                                     decoration: InputDecoration(
//                                       labelText: 'BP Dystolic level',
//                                       hintText: 'Enter BP Dystolic level',
//                                       border: OutlineInputBorder(),
//                                       contentPadding: EdgeInsets.symmetric(
//                                         vertical: 10,
//                                         horizontal: 12,
//                                       ),
//                                     ),
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'BP Dystolic level is required';
//                                       }
//                                       if (int.tryParse(value) == null) {
//                                         return 'Please enter a valid number';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   SizedBox(height: 15),
//
//                                   // BP Systolic Level
//                                   TextFormField(
//                                     controller: viewModel.bpSystolicController,
//                                     decoration: InputDecoration(
//                                       labelText: 'BP Systolic level',
//                                       hintText: 'Enter BP Systolic level',
//                                       border: OutlineInputBorder(),
//                                       contentPadding: EdgeInsets.symmetric(
//                                         vertical: 10,
//                                         horizontal: 12,
//                                       ),
//                                     ),
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'BP Systolic level is required';
//                                       }
//                                       if (int.tryParse(value) == null) {
//                                         return 'Please enter a valid number';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   SizedBox(height: 15),
//
//                                   // Details
//                                   TextFormField(
//                                     controller: viewModel.detailsController,
//                                     decoration: InputDecoration(
//                                       labelText: 'Details',
//                                       border: OutlineInputBorder(),
//                                       contentPadding: EdgeInsets.symmetric(
//                                         vertical: 10,
//                                         horizontal: 12,
//                                       ),
//                                     ),
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Details are required';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   SizedBox(height: 15),
//
//                                   // Onset Date
//                                   TextFormField(
//                                     controller: viewModel.onsetDateController,
//                                     decoration: InputDecoration(
//                                       labelText: 'Onset Date',
//                                       border: OutlineInputBorder(),
//                                       contentPadding: EdgeInsets.symmetric(
//                                         vertical: 10,
//                                         horizontal: 12,
//                                       ),
//                                     ),
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Onset Date is required';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   SizedBox(height: 15),
//
//                                   // Medicine Name
//                                   TextFormField(
//                                     controller:
//                                         viewModel.medicineNameController,
//                                     decoration: InputDecoration(
//                                       labelText: 'Medicine Name',
//                                       border: OutlineInputBorder(),
//                                       contentPadding: EdgeInsets.symmetric(
//                                         vertical: 10,
//                                         horizontal: 12,
//                                       ),
//                                     ),
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Medicine Name is required';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   SizedBox(height: 15),
//
//                                   // Dosage
//                                   TextFormField(
//                                     controller: viewModel.dosageController,
//                                     decoration: InputDecoration(
//                                       labelText: 'Dosage',
//                                       border: OutlineInputBorder(),
//                                       contentPadding: EdgeInsets.symmetric(
//                                         vertical: 10,
//                                         horizontal: 12,
//                                       ),
//                                     ),
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Dosage is required';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   SizedBox(height: 15),
//
//                                   // Current Status
//                                   TextFormField(
//                                     controller:
//                                         viewModel.currentStatusController,
//                                     decoration: InputDecoration(
//                                       labelText: 'Current Status',
//                                       border: OutlineInputBorder(),
//                                       contentPadding: EdgeInsets.symmetric(
//                                         vertical: 10,
//                                         horizontal: 12,
//                                       ),
//                                     ),
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Current Status is required';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   SizedBox(height: 15),
//
//                                   // Treating Doctor's Details
//                                   TextFormField(
//                                     controller:
//                                         viewModel.doctorDetailsController,
//                                     decoration: InputDecoration(
//                                       labelText: 'Treating Doctor\'s Details',
//                                       border: OutlineInputBorder(),
//                                       contentPadding: EdgeInsets.symmetric(
//                                         vertical: 10,
//                                         horizontal: 12,
//                                       ),
//                                     ),
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Treating Doctor\'s Details are required';
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
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   OutlinedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: Text('Previous'),
//                     style: OutlinedButton.styleFrom(
//                       side: BorderSide(color: Colors.grey, width: 0.4),
//                       padding: EdgeInsets.symmetric(
//                         vertical: 16,
//                         horizontal: 42,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(7),
//                       ),
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Validate checkboxes
//                       viewModel.validateCheckboxes();
//                       // If 'isApplicableChecked' is selected, validate the form
//                       if (viewModel.isApplicableChecked) {
//                         // Applicable checkbox is selected, validate the form
//                         if (viewModel.formKey.currentState != null &&
//                             viewModel.formKey.currentState!.validate()) {
//                           // If form is valid, proceed to next screen
//                           Navigator.push(
//                             context,
//                             CupertinoPageRoute(
//                               builder: (context) => NivaMedicalScreen6(),
//                             ),
//                           );
//                         }
//                       }
//                       // If 'isNotApplicableChecked' is selected, directly proceed to the next screen
//                       else if (viewModel.isNotApplicableChecked) {
//                         Navigator.push(
//                           context,
//                           CupertinoPageRoute(
//                             builder: (context) => NivaMedicalScreen6(),
//                           ),
//                         );
//                       }
//                     },
//                     child: Text('Next'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       foregroundColor: Colors.white,
//                       padding: EdgeInsets.symmetric(
//                         vertical: 16,
//                         horizontal: 42,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(7),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
