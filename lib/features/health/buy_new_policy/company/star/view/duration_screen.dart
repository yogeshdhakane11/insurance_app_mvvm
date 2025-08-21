import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurance/features/health/buy_new_policy/company/star/view/policy_summey.dart';
import 'package:provider/provider.dart';
import '../../../../../../routes/routes_name.dart';
import '../viewmodel/duration_viewmodel.dart';

class StarDurationScreen extends StatelessWidget {
  const StarDurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (_) => StarDurationViewmodel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Duration'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Consumer<StarDurationViewmodel>(
          builder: (context, viewModel, _) {
            return Padding(
              padding: EdgeInsets.all(
                screenWidth * 0.04,
              ), // Adjust padding based on screen width
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select Policy Term',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  // Policy Term List
                  ...viewModel.durationList.map((item) {
                    final isSelected =
                        item.durationYear == viewModel.selectedDuration;
                    return GestureDetector(
                      onTap: () => viewModel.selectDuration(item.durationYear),
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: screenHeight * 0.02,
                        ), // Adjust bottom margin based on screen height
                        padding: EdgeInsets.symmetric(
                          vertical:
                              screenHeight *
                              0.015, // Adjust vertical padding based on screen height
                          horizontal:
                              screenWidth *
                              0.04, // Adjust horizontal padding based on screen width
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected
                                ? Colors.green
                                : Colors.grey.shade300,
                            width: isSelected ? 0.7 : 0.2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade100,
                              blurRadius: 6,
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
                                      fontSize:
                                          screenWidth *
                                          0.04, // Adjust font size based on screen width
                                      color: isSelected
                                          ? Colors.blue.shade400
                                          : Colors.blue.shade400,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item.planPrice,
                                    style: TextStyle(
                                      fontSize:
                                          screenWidth *
                                          0.035, // Adjust font size based on screen width
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (item.savePrice != null)
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      screenWidth *
                                      0.03, // Adjust horizontal padding based on screen width
                                  vertical:
                                      screenHeight *
                                      0.015, // Adjust vertical padding based on screen height
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green.shade50,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  'Save ${item.savePrice}',
                                  style: TextStyle(
                                    fontSize:
                                        screenWidth *
                                        0.03, // Adjust font size based on screen width
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            const SizedBox(width: 12),
                            Icon(
                              isSelected
                                  ? Icons.check_circle_rounded
                                  : Icons.radio_button_off,
                              color: isSelected ? Colors.green : Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),

                  const SizedBox(height: 24),
                  const Text(
                    'Discounts',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'With some smart trade-offs, you can save a lot on what you pay.',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 12),

                  // Discount Card
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(
                        screenWidth * 0.04,
                      ), // Adjust padding based on screen width
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          // Vertical Label
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  screenWidth *
                                  0.02, // Adjust horizontal padding based on screen width
                              vertical:
                                  screenHeight *
                                  0.01, // Adjust vertical padding based on screen height
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(color: Colors.grey.shade400),
                              ),
                            ),
                            child: RotatedBox(
                              quarterTurns: -1,
                              child: Text(
                                'Discount',
                                style: TextStyle(
                                  color: Colors.green.shade700,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),

                          // Main Content
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Aggregate Deductible',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'Get a discount on the premium by covering expenses up to the chosen deductible amount.',
                                  style: TextStyle(fontSize: 13),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            screenWidth *
                                            0.05, // Adjust horizontal padding based on screen width
                                        vertical:
                                            screenHeight *
                                            0.02, // Adjust vertical padding based on screen height
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(viewModel.selectedDeductible),
                                    ),
                                    const SizedBox(width: 70),
                                    ElevatedButton(
                                      onPressed: () {
                                        // viewModel.applyDeductible("25000");
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.blue,
                                      ),
                                      child: const Text('Apply'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),

                  // Continue Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RouteNames.starPolicySummaryScreen,
                        );
                        print(
                          'Selected Duration: ${viewModel.selectedDuration}',
                        );
                        print(
                          'Selected Deductible: ${viewModel.selectedDeductible}',
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          vertical:
                              screenHeight *
                              0.02, // Adjust vertical padding based on screen height
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                        ), // Adjust font size based on screen width
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
// import 'package:insurance/features/health/buy_new_policy/company/star/view/policy_summey.dart';
// import 'package:provider/provider.dart';
// import '../viewmodel/duration_viewmodel.dart';
//
// class StarDurationScreen extends StatelessWidget {
//   const StarDurationScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => StarDurationViewmodel(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Duration'),
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back_ios_new),
//             onPressed: () => Navigator.pop(context),
//           ),
//         ),
//         body: Consumer<StarDurationViewmodel>(
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
//
//                   const SizedBox(height: 24),
//                   const Text(
//                     'Discounts',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 4),
//                   const Text(
//                     'With some smart trade-offs, you can save a lot on what you pay.',
//                     style: TextStyle(fontSize: 14),
//                   ),
//                   const SizedBox(height: 12),
//
//                   // Discount Card
//                   Card(
//                     elevation: 0,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Row(
//                         children: [
//                           // Vertical Label
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 6,
//                               vertical: 4,
//                             ),
//                             decoration: BoxDecoration(
//                               border: Border(
//                                 right: BorderSide(color: Colors.grey.shade400),
//                               ),
//                             ),
//                             child: RotatedBox(
//                               quarterTurns: -1,
//                               child: Text(
//                                 'Discount',
//                                 style: TextStyle(
//                                   color: Colors.green.shade700,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 12),
//
//                           // Main Content
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text(
//                                   'Aggregate Deductible',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 15,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 const Text(
//                                   'Get a discount on the premium by covering expenses up to the chosen deductible amount.',
//                                   style: TextStyle(fontSize: 13),
//                                 ),
//                                 const SizedBox(height: 10),
//                                 Row(
//                                   children: [
//                                     Container(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 12,
//                                         vertical: 8,
//                                       ),
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                           color: Colors.grey.shade300,
//                                         ),
//                                         borderRadius: BorderRadius.circular(8),
//                                       ),
//                                       child: Text(viewModel.selectedDeductible),
//                                     ),
//                                     const SizedBox(width: 70),
//                                     ElevatedButton(
//                                       onPressed: () {
//                                         // viewModel.applyDeductible("25000");
//                                       },
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: Colors.white,
//                                         foregroundColor: Colors.blue,
//                                       ),
//                                       child: const Text('Apply'),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//
//                   // Continue Button
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           CupertinoPageRoute(
//                             builder: (context) => PolicySummaryScreen(),
//                           ),
//                         );
//                         print(
//                           'Selected Duration: ${viewModel.selectedDuration}',
//                         );
//                         print(
//                           'Selected Deductible: ${viewModel.selectedDeductible}',
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
