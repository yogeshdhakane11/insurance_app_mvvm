import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../routes/routes_name.dart';
import '../viewmodel/duration_viewmodel.dart';

class NivaBupaDurationScreen extends StatelessWidget {
  const NivaBupaDurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions using MediaQuery
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) => NivaBupaDurationViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Customize your Plan',
            style: TextStyle(
              fontSize: screenWidth * 0.045,
            ), // Responsive font size
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: screenWidth * 0.06,
            ), // Responsive icon size
            onPressed: () => Navigator.pop(context),
          ),
          centerTitle: true,
        ),
        body: Consumer<NivaBupaDurationViewModel>(
          builder: (context, viewModel, _) {
            return Padding(
              padding: EdgeInsets.all(
                screenWidth * 0.04,
              ), // Responsive padding (was 16)
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Policy Term',
                    style: TextStyle(
                      fontSize:
                          screenWidth * 0.045, // Responsive font size (was 18)
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.015,
                  ), // Responsive spacing (was 12),
                  // Policy Term List
                  ...viewModel.durationList.map((item) {
                    final isSelected =
                        item.durationYear == viewModel.selectedDuration;
                    return GestureDetector(
                      onTap: () => viewModel.selectDuration(item.durationYear),
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: screenHeight * 0.00875,
                        ), // Responsive margin (was 7)
                        padding: EdgeInsets.symmetric(
                          vertical:
                              screenHeight *
                              0.01375, // Responsive padding (was 11)
                          horizontal:
                              screenWidth * 0.04, // Responsive padding (was 16)
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected
                                ? Colors.green
                                : Colors.grey.shade300,
                            width: isSelected
                                ? screenWidth * 0.00175
                                : screenWidth *
                                      0.0005, // Responsive border width (was 0.7, 0.2)
                          ),
                          borderRadius: BorderRadius.circular(
                            screenWidth * 0.03,
                          ), // Responsive border radius (was 12)
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade100,
                              blurRadius:
                                  screenWidth *
                                  0.015, // Responsive blur radius (was 6)
                              offset: Offset(
                                0,
                                screenHeight * 0.0025,
                              ), // Responsive offset (was 2)
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
                                          0.04, // Responsive font size (was 16)
                                      color: isSelected
                                          ? Colors.blue.shade400
                                          : Colors.blue.shade400,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.005,
                                  ), // Responsive spacing (was 4)
                                  Text(
                                    item.planPrice,
                                    style: TextStyle(
                                      fontSize:
                                          screenWidth *
                                          0.0375, // Responsive font size (was 15)
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
                                      0.0175, // Responsive padding (was 7)
                                  vertical:
                                      screenHeight *
                                      0.005, // Responsive padding (was 4)
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green.shade50,
                                  borderRadius: BorderRadius.circular(
                                    screenWidth * 0.015,
                                  ), // Responsive border radius (was 6)
                                ),
                                child: Text(
                                  'Save ${item.savePrice}',
                                  style: TextStyle(
                                    fontSize:
                                        screenWidth *
                                        0.03, // Responsive font size (was 12)
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ), // Responsive spacing (was 12)
                            Icon(
                              isSelected
                                  ? Icons.check_circle_rounded
                                  : Icons.radio_button_off,
                              color: isSelected ? Colors.green : Colors.grey,
                              size: screenWidth * 0.06, // Responsive icon size
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),

                  SizedBox(
                    height: screenHeight * 0.03,
                  ), // Responsive spacing (was 24)
                  Text(
                    'Discounts',
                    style: TextStyle(
                      fontSize:
                          screenWidth * 0.045, // Responsive font size (was 18)
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.005,
                  ), // Responsive spacing (was 4)
                  Text(
                    'With some smart trade-offs, you can save a lot on what you pay.',
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                    ), // Responsive font size (was 14)
                  ),
                  SizedBox(
                    height: screenHeight * 0.015,
                  ), // Responsive spacing (was 12),
                  // Discount Card
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        screenWidth * 0.03,
                      ), // Responsive border radius (was 12)
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(
                        screenWidth * 0.04,
                      ), // Responsive padding (was 16)
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          screenWidth * 0.03,
                        ), // Responsive border radius (was 12)
                      ),
                      child: Row(
                        children: [
                          // Vertical Label
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  screenWidth *
                                  0.015, // Responsive padding (was 6)
                              vertical:
                                  screenHeight *
                                  0.005, // Responsive padding (was 4)
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
                                  fontSize:
                                      screenWidth *
                                      0.035, // Responsive font size
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.03,
                          ), // Responsive spacing (was 12),
                          // Main Content
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Aggregate Deductible',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        screenWidth *
                                        0.0375, // Responsive font size (was 15)
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.005,
                                ), // Responsive spacing (was 4)
                                Text(
                                  'Get a discount on the premium by covering expenses up to the chosen deductible amount.',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.0325,
                                  ), // Responsive font size (was 13)
                                ),
                                SizedBox(
                                  height: screenHeight * 0.0125,
                                ), // Responsive spacing (was 10)
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            screenWidth *
                                            0.03, // Responsive padding (was 12)
                                        vertical:
                                            screenHeight *
                                            0.01, // Responsive padding (was 8)
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          screenWidth * 0.02,
                                        ), // Responsive border radius (was 8)
                                      ),
                                      child: Text(
                                        viewModel.selectedDeductible,
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.035,
                                        ), // Responsive font size
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.175,
                                    ), // Responsive spacing (was 70)
                                    ElevatedButton(
                                      onPressed: () {
                                        // viewModel.applyDeductible("25000");
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.blue,
                                        padding: EdgeInsets.symmetric(
                                          horizontal:
                                              screenWidth *
                                              0.03, // Responsive padding
                                          vertical:
                                              screenHeight *
                                              0.01, // Responsive padding
                                        ),
                                      ),
                                      child: Text(
                                        'Apply',
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.035,
                                        ), // Responsive font size
                                      ),
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
                        print(
                          'Selected Duration: ${viewModel.selectedDuration}',
                        );
                        print(
                          'Selected Deductible: ${viewModel.selectedDeductible}',
                        );
                        // Navigate
                        Navigator.pushNamed(
                          context,
                          RouteNames.nivaBupaMembersScreen,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.0175,
                        ), // Responsive padding (was 14)
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            screenWidth * 0.03,
                          ), // Responsive border radius (was 12)
                        ),
                      ),
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                        ), // Responsive font size (was 16)
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
// class NivaBupaDurationScreen extends StatelessWidget {
//   const NivaBupaDurationScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => NivaBupaViewModel(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Duration'),
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back_ios_new),
//             onPressed: () => Navigator.pop(context),
//           ),
//           centerTitle: true,
//         ),
//         body: Consumer<NivaBupaViewModel>(
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

// 2
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../model/duration_model.dart';
//
// class NivaBupaDurationScreen extends StatefulWidget {
//   const NivaBupaDurationScreen({super.key});
//
//   @override
//   State<NivaBupaDurationScreen> createState() => _NivaBupaDurationScreenState();
// }
//
// class _NivaBupaDurationScreenState extends State<NivaBupaDurationScreen> {
//   String? selectedDuration;
//
//   final durationList = [
//     PlanDurationModel(durationYear: '1 year', planPrice: '₹10,883'),
//     PlanDurationModel(
//       durationYear: '2 year',
//       planPrice: '₹21,004',
//       savePrice: '₹762',
//     ),
//     PlanDurationModel(
//       durationYear: '3 year',
//       planPrice: '₹30,528',
//       savePrice: '₹2,121',
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Duration')),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Select Policy Term',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 12),
//             ...durationList.map((item) {
//               final isSelected = selectedDuration == item.durationYear;
//               return GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     selectedDuration = item.durationYear;
//                   });
//                 },
//                 child: Container(
//                   margin: const EdgeInsets.only(bottom: 12),
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: isSelected ? Colors.green : Colors.grey.shade300,
//                       width: isSelected ? 2 : 1,
//                     ),
//                     borderRadius: BorderRadius.circular(12),
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.shade100,
//                         blurRadius: 6,
//                         offset: const Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               item.durationYear,
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: isSelected ? Colors.green : Colors.black,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               item.planPrice,
//                               style: const TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       if (item.savePrice != null)
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 8,
//                             vertical: 4,
//                           ),
//                           decoration: BoxDecoration(
//                             color: Colors.green.shade50,
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           child: Text(
//                             'Save ${item.savePrice}',
//                             style: const TextStyle(
//                               color: Colors.green,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 13,
//                             ),
//                           ),
//                         ),
//                       const SizedBox(width: 12),
//                       Icon(
//                         isSelected
//                             ? Icons.check_circle_rounded
//                             : Icons.radio_button_off,
//                         color: isSelected ? Colors.green : Colors.grey,
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             }).toList(),
//             const Spacer(),
//             ElevatedButton(
//               onPressed: () {
//                 // Action on continue
//               },
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size.fromHeight(50),
//                 backgroundColor: Colors.blue,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               child: const Text('Continue', style: TextStyle(fontSize: 16)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
