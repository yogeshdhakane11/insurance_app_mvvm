import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../routes/routes_name.dart';
import '../../viewmodel/stepper/medical_screen_1_viewmodel.dart';
import 'medical_screen_2.dart';

class NivaMedicalScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MediaQuery for responsive sizing
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (context) => MedicalScreen1Viewmodel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, size: screenWidth * 0.055),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/niva_bupa.png',
                width: screenWidth * 0.075,
                height: screenWidth * 0.075,
              ),
              SizedBox(width: screenWidth * 0.0275),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Niva Bupa ReAssure 2.0',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '1 member • ₹10 Lakhs • 1 year',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Consumer<MedicalScreen1Viewmodel>(
          builder: (context, viewModel, _) {
            return Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
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
                          radius: screenWidth * 0.03,
                          child: Icon(
                            Icons.check,
                            size: screenWidth * 0.04,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: 1,
                          minHeight: screenHeight * 0.0025,
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
                          radius: screenWidth * 0.03,
                          backgroundColor: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: 0,
                          minHeight: screenHeight * 0.0025,
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
                          radius: screenWidth * 0.03,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01375),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Members',
                        style: TextStyle(fontSize: screenWidth * 0.035),
                      ),
                      Text(
                        'Medical',
                        style: TextStyle(fontSize: screenWidth * 0.035),
                      ),
                      Text(
                        'Nominee',
                        style: TextStyle(fontSize: screenWidth * 0.035),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.0525),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Are you a politically exposed person (PEP) or a close relative to one?',
                        style: TextStyle(fontSize: screenWidth * 0.040),
                      ),
                      CheckboxListTile(
                        title: Text(
                          'Yogesh Dhakane',
                          style: TextStyle(fontSize: screenWidth * 0.040),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Colors.blue,
                        contentPadding: EdgeInsets.zero,
                        value: viewModel.isApplicableChecked,
                        onChanged: (value) {
                          viewModel.toggleApplicableChecked(value!);
                        },
                      ),
                      CheckboxListTile(
                        title: Text(
                          'Not Applicable',
                          style: TextStyle(fontSize: screenWidth * 0.040),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Colors.blue,
                        contentPadding: EdgeInsets.zero,
                        value: viewModel.isNotApplicableChecked,
                        onChanged: (value) {
                          viewModel.toggleNotApplicableChecked(value!);
                        },
                      ),
                      SizedBox(height: screenHeight * 0.01375),
                      // Show error only if validation was triggered and checkboxes are not selected
                      if (viewModel.showError)
                        Text(
                          '* Required',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(screenWidth * 0.035),
          child: Consumer<MedicalScreen1Viewmodel>(
            builder: (context, viewModel, _) {
              return ElevatedButton(
                onPressed: () {
                  viewModel.validateCheckboxes();
                  if (viewModel.isApplicableChecked ||
                      viewModel.isNotApplicableChecked) {
                    // Navigate
                    Navigator.pushNamed(context, RouteNames.nivaMedicalScreen2);
                  }
                },
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.016),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.0175),
                  ),
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
// import '../../viewmodel/stepper/medical_screen_1_viewmodel.dart';
// import 'medical_screen_2.dart';
//
// class NivaMedicalScreen1 extends StatelessWidget {
//   // CheckBox
//   bool isApplicableChecked = false;
//   bool isNotApplicableChecked = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => MedicalScreen1Viewmodel(), // Provide the ViewModel(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back_ios), // Back arrow icon
//             onPressed: () {
//               // Handle back button press
//               Navigator.pop(context);
//             },
//           ),
//           title: Row(
//             mainAxisSize:
//                 MainAxisSize.min, // To make the row only take necessary space
//             children: [
//               Image.asset('assets/images/niva_bupa.png', width: 30, height: 30),
//               SizedBox(width: 11),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text(
//                     'Niva Bupa ReAssure 2.0',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                   ),
//                   Text(
//                     '1 member • ₹10 Lakhs • 1 year',
//                     style: TextStyle(fontSize: 12, color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         body: Consumer<MedicalScreen1Viewmodel>(
//           builder: (context, viewModel, _) {
//             return Padding(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(
//                             color: Colors.green,
//                             width: 1,
//                           ), // Green border
//                         ),
//                         child: CircleAvatar(
//                           backgroundColor: Colors.green, // White background
//                           radius: 12,
//                           child: Icon(
//                             Icons.check,
//                             size: 16,
//                             color: Colors.white,
//                           ), // Adjust icon color if needed
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
//                       // CircleAvatar(radius: 12),
//                       Container(
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(
//                             color: Colors.grey,
//                             width: 1,
//                           ), // Border with green color
//                         ),
//                         child: CircleAvatar(
//                           radius: 12,
//                           backgroundColor:
//                               Colors.white, // Background color is white
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
//                       // CircleAvatar(radius: 12),
//                       Container(
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(
//                             color: Colors.grey,
//                             width: 1,
//                           ), // Border with green color
//                         ),
//                         child: CircleAvatar(
//                           radius: 12,
//                           backgroundColor:
//                               Colors.white, // Background color is white
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
//                   SizedBox(height: 42),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Are you a politically exposed person (PEP) or a close relative to one?',
//                         style: TextStyle(fontSize: 15),
//                       ),
//                       CheckboxListTile(
//                         title: Text('Yogesh Dhakane'),
//                         controlAffinity: ListTileControlAffinity.leading,
//                         activeColor: Colors.blue,
//                         contentPadding: EdgeInsets.zero,
//                         value: viewModel
//                             .isApplicableChecked, // Use value from ViewModel
//                         onChanged: (value) {
//                           viewModel.toggleApplicableChecked(
//                             value!,
//                           ); // Update ViewModel state
//                         },
//                       ),
//                       CheckboxListTile(
//                         title: Text('Not Applicable'),
//                         controlAffinity: ListTileControlAffinity.leading,
//                         activeColor: Colors.blue,
//                         contentPadding: EdgeInsets.zero,
//                         value: viewModel
//                             .isNotApplicableChecked, // Use value from ViewModel
//                         onChanged: (value) {
//                           viewModel.toggleNotApplicableChecked(
//                             value!,
//                           ); // Update ViewModel state
//                         },
//                       ),
//                       SizedBox(height: 11),
//
//                       // added
//                       // Show error only if validation was triggered and checkboxes are not selected
//                       if (viewModel.showError)
//                         Text('* Required', style: TextStyle(color: Colors.red)),
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//         bottomNavigationBar: Padding(
//           padding: const EdgeInsets.all(14),
//           child: Consumer<MedicalScreen1Viewmodel>(
//             builder: (context, viewModel, _) {
//               return ElevatedButton(
//                 onPressed: () {
//                   // Trigger validation when "Next" button is clicked
//                   viewModel.validateCheckboxes();
//
//                   // If at least one checkbox is checked, navigate to the next screen
//                   if (viewModel.isApplicableChecked ||
//                       viewModel.isNotApplicableChecked) {
//                     Navigator.push(
//                       context,
//                       CupertinoPageRoute(
//                         builder: (context) => NivaMedicalScreen2(),
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
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
