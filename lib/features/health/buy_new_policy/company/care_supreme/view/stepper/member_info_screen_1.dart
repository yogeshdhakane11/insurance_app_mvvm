import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:insurance/features/health/buy_new_policy/company/care_supreme/view/proposer_screen.dart';
import 'package:insurance/features/health/buy_new_policy/company/care_supreme/view/self_screen.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../../../routes/routes_name.dart';
import '../../viewmodel/member_info_1_viewmodel.dart';
import 'member_info_screen_2.dart';

class CareSupremeMemberInfoScreen_1 extends StatelessWidget {
  const CareSupremeMemberInfoScreen_1({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height using MediaQuery
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) => CareSupremeMemberInfoScreen_1ViewModel(),
      child: Consumer<CareSupremeMemberInfoScreen_1ViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, size: screenWidth * 0.055),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/care_logo.png',
                        height: screenHeight * 0.035,
                        width: screenWidth * 0.075,
                      ),
                      SizedBox(width: screenWidth * 0.025),
                      Text(
                        'Care Supreme',
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    '1 member • ₹10 Lakhs • 1 year',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Share.share('care supreme insurance app');
                  },
                  child: Text(
                    'View on Web',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Custom Horizontal Stepper Widget ---
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
                  // --- Content Section for Members ---
                  Text(
                    'Members Information',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Self Card
                  GestureDetector(
                    onTap: () {
                      print('Tapped on Self');
                      viewModel.toggleSelfCompleted();
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return const CareSupremeSelfBottomSheet();
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.015,
                        horizontal: screenWidth * 0.04,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: screenWidth * 0.0125,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Self',
                                style: TextStyle(fontSize: screenWidth * 0.04),
                              ),
                              if (viewModel.selfCompleted)
                                Text(
                                  '21 years • 168cm • 70kg',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.03,
                                    color: Colors.grey,
                                  ),
                                ),
                            ],
                          ),
                          Row(
                            children: [
                              if (viewModel.selfCompleted)
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.015,
                                    vertical: screenHeight * 0.0025,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.green[100],
                                    borderRadius: BorderRadius.circular(
                                      screenWidth * 0.01,
                                    ),
                                  ),
                                  child: Text(
                                    'Completed',
                                    style: TextStyle(
                                      color: Colors.green[700],
                                      fontSize: screenWidth * 0.03,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              else
                                Text(
                                  'Add Details',
                                  style: TextStyle(
                                    color: Colors.purple,
                                    fontSize: screenWidth * 0.035,
                                  ),
                                ),
                              SizedBox(width: screenWidth * 0.01),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: screenWidth * 0.035,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01375),
                  // Proposer Card
                  GestureDetector(
                    onTap: () {
                      print('Tapped on Proposer');
                      viewModel.toggleProposerCompleted();
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return CareSupremeProposerBottomSheet();
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.015,
                        horizontal: screenWidth * 0.04,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: screenWidth * 0.0125,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Proposer',
                                style: TextStyle(fontSize: screenWidth * 0.04),
                              ),
                              if (viewModel.proposerCompleted)
                                Text(
                                  'Self • Yogesh • 21 years',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.03,
                                    color: Colors.grey,
                                  ),
                                ),
                            ],
                          ),
                          Row(
                            children: [
                              if (viewModel.proposerCompleted)
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.015,
                                    vertical: screenHeight * 0.0025,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.green[100],
                                    borderRadius: BorderRadius.circular(
                                      screenWidth * 0.01,
                                    ),
                                  ),
                                  child: Text(
                                    'Completed',
                                    style: TextStyle(
                                      color: Colors.green[700],
                                      fontSize: screenWidth * 0.03,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              else
                                Text(
                                  'Add Details',
                                  style: TextStyle(
                                    color: Colors.purple,
                                    fontSize: screenWidth * 0.035,
                                  ),
                                ),
                              SizedBox(width: screenWidth * 0.01),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: screenWidth * 0.035,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  // --- Single "Next" Button ---
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RouteNames.careSupremeMemberInfoScreen_2,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            screenWidth * 0.02,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.12,
                          vertical: screenHeight * 0.0175,
                        ),
                        minimumSize: Size(double.infinity, screenHeight * 0.05),
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w600,
                        ),
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
// import 'package:insurance/features/health/buy_new_policy/company/care_supreme/view/proposer_screen.dart';
// import 'package:insurance/features/health/buy_new_policy/company/care_supreme/view/self_screen.dart';
// import 'package:share_plus/share_plus.dart';
//
// import '../../viewmodel/member_info_1_viewmodel.dart';
// import 'member_info_screen_2.dart';
//
// class CareSupremeMemberInfoScreen_1 extends StatelessWidget {
//   const CareSupremeMemberInfoScreen_1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => CareSupremeMemberInfoScreen_1ViewModel(),
//       child: Consumer<CareSupremeMemberInfoScreen_1ViewModel>(
//         builder: (context, viewModel, _) {
//           return Scaffold(
//             appBar: AppBar(
//               leading: IconButton(
//                 icon: const Icon(Icons.arrow_back_ios),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               title: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Image.asset(
//                         'assets/images/care_logo.png',
//                         height: 21,
//                         width: 21,
//                       ),
//                       const SizedBox(width: 7),
//                       const Text(
//                         'Care Supreme',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 4),
//                   const Text(
//                     '1 member • ₹10 Lakhs • 1 year',
//                     style: TextStyle(fontSize: 12, color: Colors.grey),
//                   ),
//                 ],
//               ),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Share.share('care supreme insurance app');
//                   },
//                   child: const Text(
//                     'View on Web',
//                     style: TextStyle(color: Colors.blue),
//                   ),
//                 ),
//               ],
//             ),
//             body: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // --- Custom Horizontal Stepper Widget ---
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
//                   // --- Content Section for Members ---
//                   const Text(
//                     'Members Information',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 16),
//                   // Self Card
//                   GestureDetector(
//                     onTap: () {
//                       print('Tapped on Self');
//                       viewModel.toggleSelfCompleted();
//                       showModalBottomSheet(
//                         context: context,
//                         isScrollControlled: true,
//                         builder: (BuildContext context) {
//                           return const CareSupremeSelfBottomSheet();
//                         },
//                       );
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 12.0,
//                         horizontal: 16.0,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8.0),
//                         border: Border.all(
//                           color: Colors.grey[300]!,
//                           width: 1.0,
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.2),
//                             spreadRadius: 1,
//                             blurRadius: 5,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 'Self',
//                                 style: TextStyle(fontSize: 16),
//                               ),
//                               if (viewModel.selfCompleted)
//                                 const Text(
//                                   '21 years • 168cm • 70kg', // Example data
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               if (viewModel.selfCompleted)
//                                 Container(
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 6,
//                                     vertical: 2,
//                                   ),
//                                   decoration: BoxDecoration(
//                                     color: Colors.green[100],
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   child: Text(
//                                     'Completed',
//                                     style: TextStyle(
//                                       color: Colors.green[700],
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 )
//                               else
//                                 Text(
//                                   'Add Details',
//                                   style: TextStyle(
//                                     color: Colors.purple,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               const SizedBox(width: 4),
//                               const Icon(
//                                 Icons.arrow_forward_ios,
//                                 size: 14,
//                                 color: Colors.grey,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 11),
//                   // Proposer Card
//                   GestureDetector(
//                     onTap: () {
//                       print('Tapped on Proposer');
//                       viewModel.toggleProposerCompleted();
//                       showModalBottomSheet(
//                         context: context,
//                         isScrollControlled: true,
//                         builder: (BuildContext context) {
//                           return CareSupremeProposerBottomSheet();
//                         },
//                       );
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 12.0,
//                         horizontal: 16.0,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8.0),
//                         border: Border.all(
//                           color: Colors.grey[300]!,
//                           width: 1.0,
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.2),
//                             spreadRadius: 1,
//                             blurRadius: 5,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 'Proposer',
//                                 style: TextStyle(fontSize: 16),
//                               ),
//                               if (viewModel.proposerCompleted)
//                                 const Text(
//                                   'Self • Yogesh • 21 years', // Example data
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               if (viewModel.proposerCompleted)
//                                 Container(
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 6,
//                                     vertical: 2,
//                                   ),
//                                   decoration: BoxDecoration(
//                                     color: Colors.green[100],
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   child: Text(
//                                     'Completed',
//                                     style: TextStyle(
//                                       color: Colors.green[700],
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 )
//                               else
//                                 Text(
//                                   'Add Details',
//                                   style: TextStyle(
//                                     color: Colors.purple,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               const SizedBox(width: 4),
//                               const Icon(
//                                 Icons.arrow_forward_ios,
//                                 size: 14,
//                                 color: Colors.grey,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const Spacer(), // Pushes button to the bottom
//                   // --- Single "Next" Button ---
//                   Align(
//                     alignment: Alignment.center,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Navigate to MedicalScreen and pass current step as 1
//                         Navigator.push(
//                           context,
//                           CupertinoPageRoute(
//                             builder: (context) =>
//                                 CareSupremeMemberInfoScreen_2(),
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 48,
//                           vertical: 14,
//                         ),
//                         minimumSize: const Size(double.infinity, 0),
//                       ),
//                       child: const Text(
//                         'Next',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
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
