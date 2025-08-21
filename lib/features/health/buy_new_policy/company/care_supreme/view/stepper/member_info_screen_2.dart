import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../routes/routes_name.dart';
import '../../viewmodel/member_info_2_viewmodel.dart';

class CareSupremeMemberInfoScreen_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (context) => CareSupremeMemberInfo_2_ViewModel(),
      child: Scaffold(
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
                'assets/images/care_logo.png',
                width: screenWidth * 0.08, // Responsive image width
                height: screenWidth * 0.08, // Responsive image height
              ),
              SizedBox(width: screenWidth * 0.03), // Responsive spacing
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Care Supreme',
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
        body: Consumer<CareSupremeMemberInfo_2_ViewModel>(
          builder: (context, viewModel, _) {
            return Padding(
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
                  SizedBox(height: screenHeight * 0.05), // Responsive spacing
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Please provide accurate responses to the medical questions',
                        style: TextStyle(
                          fontSize:
                              screenWidth * 0.0375, // Responsive font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.015,
                      ), // Responsive spacing
                      Text(
                        'Have any of the proposed to be insured been diagnosed with, suffered from/ is suffering from or is currently under medication for the following. Click on any name to view the list of diseases and if no issues, mark it as Not Applicable. If your response is Yes to any of the following questions, please specify details of the same in the additional information section.',
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                        ), // Responsive font size
                      ),
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
                          viewModel.toggleYogeshChecked(value!);
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
                          viewModel.toggleNotApplicableChecked(value!);
                        },
                      ),
                      SizedBox(
                        height: screenHeight * 0.015,
                      ), // Responsive spacing
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(screenWidth * 0.035), // Responsive padding
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                RouteNames.careSupremeMedicalScreen1,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.017, // Responsive padding
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
              style: TextStyle(fontSize: screenWidth * 0.04), // Responsive font
            ),
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
// import '../../viewmodel/member_info_2_viewmodel.dart';
// import 'medical_screen_1.dart';
//
// class CareSupremeMemberInfoScreen_2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => CareSupremeMemberInfo_2_ViewModel(),
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
//               Image.asset('assets/images/care_logo.png', width: 30, height: 30),
//               SizedBox(width: 11),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text(
//                     'Care Supreme',
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
//         body: Consumer<CareSupremeMemberInfo_2_ViewModel>(
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
//                         'Please provide accurate responses to the medical questions',
//                         style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 11),
//                       Text(
//                         'Have any of the proposed to be insured been diagnosed with, suffered from/ is suffering from or is currently under medication for the following. Click on any name to view the list of diseases and if no issues, mark it as Not Applicable. If your response is Yes to any of the following questions, please specify details of the same in the additional information section.',
//                         style: TextStyle(fontSize: 14),
//                       ),
//                       CheckboxListTile(
//                         title: Text('Yogesh Dhakane'),
//                         controlAffinity: ListTileControlAffinity.leading,
//                         activeColor: Colors.blue,
//                         contentPadding: EdgeInsets.zero,
//                         value: viewModel
//                             .isApplicableChecked, // Use value from ViewModel
//                         onChanged: (value) {
//                           viewModel.toggleYogeshChecked(
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
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//         bottomNavigationBar: Padding(
//           padding: const EdgeInsets.all(14),
//           child: ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 CupertinoPageRoute(
//                   builder: (context) => CareSupremeMedicalScreen1(),
//                 ),
//               );
//             },
//             child: Text('Next'),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue,
//               foregroundColor: Colors.white,
//               padding: EdgeInsets.symmetric(vertical: 14),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(7),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
