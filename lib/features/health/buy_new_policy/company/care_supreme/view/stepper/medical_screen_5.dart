import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../../routes/routes_name.dart';
import '../../viewmodel/medical_5_viewmodel.dart';

class CareSupremeMedicalScreen5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (context) => CareSupremeMedical5ViewModel(),
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
        body: Consumer<CareSupremeMedical5ViewModel>(
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
                            'Is any of the person(s) to be insured, already covered under any other health insurance policy of Religare Health Insurance?',
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(screenWidth * 0.035), // Responsive padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: OutlinedButton(
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
              ),
              SizedBox(width: screenWidth * 0.04), // Responsive spacing
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.careSupremeNomineeScreen,
                    );
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
        // bottomNavigationBar: Padding(
        //   padding: EdgeInsets.all(screenWidth * 0.035), // Responsive padding
        //   child: Row(
        //     mainAxisAlignment:
        //         MainAxisAlignment.end, // Align button to the right
        //     children: [
        //       Expanded(
        //         flex: 2,
        //         child: ElevatedButton(
        //           onPressed: () {
        //             Navigator.pushNamed(
        //               context,
        //               RouteNames.careSupremeNomineeScreen,
        //             );
        //           },
        //           style: ElevatedButton.styleFrom(
        //             backgroundColor: Colors.blue,
        //             foregroundColor: Colors.white,
        //             padding: EdgeInsets.symmetric(
        //               vertical: screenHeight * 0.02, // Responsive padding
        //               horizontal: screenWidth * 0.1, // Responsive padding
        //             ),
        //             shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(
        //                 screenWidth * 0.017,
        //               ), // Responsive radius
        //             ),
        //           ),
        //           child: Text(
        //             'Submit',
        //             style: TextStyle(
        //               fontSize: screenWidth * 0.04,
        //             ), // Responsive font
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../viewmodel/checkbox_viewmodel.dart';
// import 'nominee_screen.dart';
//
// class CareSupremeMedicalScreen5 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => CheckboxViewModel(),
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back_ios),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           title: Row(
//             mainAxisSize: MainAxisSize.min,
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
//         body: Consumer<CheckboxViewModel>(
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
//                             'Is any of the person(s) to be insured, already covered under any other health insurance policy of Religare Health Insurance?',
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
//                                 viewModel.toggleYogeshChecked(value);
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
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//         bottomNavigationBar: Padding(
//           padding: const EdgeInsets.all(14),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     CupertinoPageRoute(
//                       builder: (context) => CareSupremeNomineeScreen(),
//                     ),
//                   );
//                 },
//                 child: Text('Submit'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   foregroundColor: Colors.white,
//                   padding: EdgeInsets.symmetric(vertical: 16, horizontal: 42),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(7),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
