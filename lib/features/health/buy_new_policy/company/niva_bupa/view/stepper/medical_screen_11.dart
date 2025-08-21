import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../../routes/routes_name.dart';
import '../../../care_supreme/viewmodel/checkbox_viewmodel.dart';
import '../../viewmodel/stepper/medical_screen_11_viewmodel.dart';
import 'nominee_screen.dart';

class NivaMedicalScreen11 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (context) => MedicalScreen11Viewmodel(),
      child: Consumer<MedicalScreen11Viewmodel>(
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
                            'Does any of the applicants Chew tobacco / Gutkha / Pan Masala',
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
                          if (viewModel.isApplicableChecked)
                            Form(
                              key: viewModel.formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Please specify the consumption per day',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.04,
                                    ), // Responsive font size
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.015,
                                  ), // Responsive spacing
                                  TextFormField(
                                    controller: viewModel.noOfPouches,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      labelText: 'No. of pouches',
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
                                        return 'Please enter the number of pouches';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
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
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        viewModel.validateCheckboxes();
                        if (viewModel.isApplicableChecked) {
                          if (viewModel.formKey.currentState?.validate() ==
                              true) {
                            Navigator.pushNamed(
                              context,
                              RouteNames.nivaBupaNomineeScreen,
                            );
                          }
                        } else if (viewModel.isNotApplicableChecked) {
                          Navigator.pushNamed(
                            context,
                            RouteNames.nivaBupaNomineeScreen,
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
// import '../../viewmodel/stepper/medical_screen_11_viewmodel.dart';
// import 'nominee_screen.dart';
//
// class NivaMedicalScreen11 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => MedicalScreen11Viewmodel(),
//       child: Consumer<MedicalScreen11Viewmodel>(
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
//                             'Does any of the applicants Chew tobacco / Gutkha / Pan Masala',
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
//                           if (viewModel.isApplicableChecked)
//                             Form(
//                               key: viewModel.formKey,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Please specify the consumption per day',
//                                     style: TextStyle(fontSize: 16),
//                                   ),
//                                   SizedBox(height: 11),
//                                   TextFormField(
//                                     controller: viewModel.noOfPouches,
//                                     keyboardType: TextInputType.number,
//                                     decoration: InputDecoration(
//                                       labelText: 'No. of pouches',
//                                       border: OutlineInputBorder(),
//                                     ),
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Please enter the number of pouches';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ),
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
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         viewModel.validateCheckboxes();
//                         // Check if isApplicableChecked is selected, and validate the form
//                         if (viewModel.isApplicableChecked) {
//                           if (viewModel.formKey.currentState?.validate() ==
//                               true) {
//                             // If form is valid, navigate to next screen
//                             Navigator.push(
//                               context,
//                               CupertinoPageRoute(
//                                 builder: (context) => NivaBupaNomineeScreen(),
//                               ),
//                             );
//                           }
//                         }
//                         // If isNotApplicableChecked is selected, navigate directly
//                         else if (viewModel.isNotApplicableChecked) {
//                           Navigator.push(
//                             context,
//                             CupertinoPageRoute(
//                               builder: (context) => NivaBupaNomineeScreen(),
//                             ),
//                           );
//                         }
//                       },
//                       child: Text('Next'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         foregroundColor: Colors.white,
//                         padding: EdgeInsets.symmetric(
//                           vertical: 16,
//                           horizontal: 42,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(7),
//                         ),
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
