import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurance/features/health/buy_new_policy/company/care_supreme/view/proposer_screen.dart';
import 'package:provider/provider.dart';

import '../../../../../../routes/routes_name.dart';
import '../viewmodel/duration_viewmodel.dart';

class CareSupremeDurationScreen extends StatelessWidget {
  const CareSupremeDurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery for responsive sizing
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) => CareSupremeDurationViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Duration',
            style: TextStyle(fontSize: screenWidth * 0.045),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, size: screenWidth * 0.055),
            onPressed: () => Navigator.pop(context),
          ),
          centerTitle: true,
        ),
        body: Consumer<CareSupremeDurationViewModel>(
          builder: (context, viewModel, _) {
            return Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Policy Term',
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),

                  // Policy Term List
                  ...viewModel.durationList.map((item) {
                    final isSelected =
                        item.durationYear == viewModel.selectedDuration;
                    return GestureDetector(
                      onTap: () => viewModel.selectDuration(item.durationYear),
                      child: Container(
                        margin: EdgeInsets.only(bottom: screenHeight * 0.00875),
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.01375,
                          horizontal: screenWidth * 0.04,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected
                                ? Colors.green
                                : Colors.grey.shade300,
                            width: isSelected ? 0.7 : 0.2,
                          ),
                          borderRadius: BorderRadius.circular(
                            screenWidth * 0.03,
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade100,
                              blurRadius: screenWidth * 0.015,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.durationYear,
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.04,
                                      color: isSelected
                                          ? Colors.blue.shade400
                                          : Colors.blue.shade400,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.005),
                                  Text(
                                    item.planPrice,
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.0375,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (item.savePrice != null)
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.0175,
                                  vertical: screenHeight * 0.005,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green.shade50,
                                  borderRadius: BorderRadius.circular(
                                    screenWidth * 0.015,
                                  ),
                                ),
                                child: Text(
                                  'Save ${item.savePrice}',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.03,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            SizedBox(width: screenWidth * 0.03),
                            Icon(
                              isSelected
                                  ? Icons.check_circle_rounded
                                  : Icons.radio_button_off,
                              color: isSelected ? Colors.green : Colors.grey,
                              size: screenWidth * 0.06,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                  const Spacer(),

                  // Continue Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        print(
                          'Selected Duration: ${viewModel.selectedDuration}',
                        );
                        // Navigator.pushNamed(
                        //   context,
                        //   RouteNames.careSupremeCheckoutScreen,
                        // );
                        // Navigator.pushNamed(
                        //   context,
                        //   RouteNames.careSupremeProposerBottomSheet,
                        // );
                        // Navigator.pushNamed(
                        //   context,
                        //   RouteNames.careSupremeSelfBottomSheet,
                        // );
                        // Navigator.pushNamed(
                        //   context,
                        //   RouteNames.careSupremeCompleteKycScreen,
                        // );
                        Navigator.pushNamed(
                          context,
                          RouteNames.careSupremeMemberInfoScreen_1,
                        );
                        // Navigator.pushNamed(
                        //   context,
                        //   RouteNames.careSupremeMemberInfoScreen_2,
                        // );
                        // Navigator.pushNamed(
                        //   context,
                        //   RouteNames.careSupremeNomineeScreen,
                        // );
                        // Navigator.pushNamed(
                        //   context,
                        //   RouteNames.careSupremeMedicalScreen1,
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.0175,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            screenWidth * 0.03,
                          ),
                        ),
                      ),
                      child: Text(
                        'Continue',
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../viewmodel/duration_viewmodel.dart';
//
// class CareSupremeDurationScreen extends StatelessWidget {
//   const CareSupremeDurationScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => CareSupremeDurationViewModel(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Duration'),
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back_ios_new),
//             onPressed: () => Navigator.pop(context),
//           ),
//           centerTitle: true,
//         ),
//         body: Consumer<CareSupremeDurationViewModel>(
//           builder: (context, viewModel, _) {
//             return Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Select Policy Term',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 12),
//
//                   // Policy Term List
//                   ...viewModel.durationList.map((item) {
//                     final isSelected =
//                         item.durationYear == viewModel.selectedDuration;
//                     return GestureDetector(
//                       onTap: () => viewModel.selectDuration(item.durationYear),
//                       child: Container(
//                         margin: const EdgeInsets.only(bottom: 7),
//                         padding: const EdgeInsets.symmetric(
//                           vertical: 11,
//                           horizontal: 16,
//                         ),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: isSelected
//                                 ? Colors.green
//                                 : Colors.grey.shade300,
//                             width: isSelected ? 0.7 : 0.2,
//                           ),
//                           borderRadius: BorderRadius.circular(12),
//                           color: Colors.white,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.shade100,
//                               blurRadius: 6,
//                               offset: const Offset(0, 2),
//                             ),
//                           ],
//                         ),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     item.durationYear,
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       color: isSelected
//                                           ? Colors.blue.shade400
//                                           : Colors.blue.shade400,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   Text(
//                                     item.planPrice,
//                                     style: const TextStyle(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             if (item.savePrice != null)
//                               Container(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 7,
//                                   vertical: 4,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: Colors.green.shade50,
//                                   borderRadius: BorderRadius.circular(6),
//                                 ),
//                                 child: Text(
//                                   'Save ${item.savePrice}',
//                                   style: const TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.green,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                             const SizedBox(width: 12),
//                             Icon(
//                               isSelected
//                                   ? Icons.check_circle_rounded
//                                   : Icons.radio_button_off,
//                               color: isSelected ? Colors.green : Colors.grey,
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                   const Spacer(),
//
//                   // Continue Button
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Navigator.push(
//                         //   context,
//                         //   CupertinoPageRoute(
//                         //     builder: (context) => PolicySummaryScreen(),
//                         //   ),
//                         // );
//                         print(
//                           'Selected Duration: ${viewModel.selectedDuration}',
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         foregroundColor: Colors.white,
//                         padding: const EdgeInsets.symmetric(vertical: 14),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       child: const Text(
//                         'Continue',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
