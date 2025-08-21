import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurance/features/my_policy/policy_screen/plan_detail.dart';
import 'package:provider/provider.dart';
import '../viewmodel/insurance_type_viewmodel.dart';

class InsuranceTypeBottomSheet extends StatelessWidget {
  const InsuranceTypeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final insuranceTypeViewModel = Provider.of<InsuranceTypeViewModel>(context);

    // MediaQuery for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return DraggableScrollableSheet(
      initialChildSize: 0.55,
      maxChildSize: 0.55,
      minChildSize: 0.55,
      expand: false,
      builder: (context, scrollController) {
        return Material(
          elevation: 4,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      screenWidth * 0.05, // Responsive horizontal padding
                  vertical: screenHeight * 0.01, // Responsive vertical padding
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Type of Insurance',
                          style: TextStyle(
                            fontSize:
                                screenWidth * 0.05, // Responsive font size
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    Text(
                      'Choose the insurance type of your existing policy',
                      style: TextStyle(
                        fontSize: screenWidth * 0.039, // Responsive font size
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 1),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        screenWidth * 0.04, // Responsive horizontal padding
                    vertical:
                        screenHeight * 0.01, // Responsive vertical padding
                  ),
                  children: [
                    _buildInsuranceOption(
                      insuranceTypeViewModel,
                      InsuranceType.health,
                      'Health Insurance',
                      Icons.favorite,
                    ),
                    _buildInsuranceOption(
                      insuranceTypeViewModel,
                      InsuranceType.term,
                      'Term Insurance',
                      Icons.umbrella,
                    ),
                    _buildInsuranceOption(
                      insuranceTypeViewModel,
                      InsuranceType.motor,
                      'Motor Insurance',
                      Icons.directions_car,
                    ),
                    _buildInsuranceOption(
                      insuranceTypeViewModel,
                      InsuranceType.other,
                      'Other Insurance',
                      Icons.add,
                    ),
                    const SizedBox(height: 11),
                    SafeArea(
                      top: false,
                      child: ElevatedButton(
                        onPressed: insuranceTypeViewModel.selectedType == null
                            ? null
                            : () async {
                                final Map<String, dynamic> body = {
                                  "insurance_type": insuranceTypeViewModel
                                      .selectedType
                                      ?.displayName,
                                };
                                try {
                                  await insuranceTypeViewModel.myPolicySendApi(
                                    body,
                                    context,
                                  );
                                } catch (e) {
                                  debugPrint(
                                    "❌ Exception while sending type: $e",
                                  );
                                }
                                // Navigation added
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => PlanDetailsScreen(),
                                  ),
                                );
                              },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(
                            screenHeight * 0.07,
                          ), // Responsive button height
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.blue[700],
                          foregroundColor: Colors.white,
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(
                            fontSize:
                                screenWidth * 0.045, // Responsive text size
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 11),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInsuranceOption(
    InsuranceTypeViewModel viewModel,
    InsuranceType type,
    String title,
    IconData iconData,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: GestureDetector(
        onTap: () => viewModel.setSelectedType(type),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: viewModel.selectedType == type
                  ? Colors.green
                  : Colors.grey[300]!,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 1,
            ), // Responsive padding
            child: Row(
              children: [
                Icon(iconData, color: Colors.blue),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Radio<InsuranceType>(
                  value: type,
                  groupValue: viewModel.selectedType,
                  onChanged: (InsuranceType? newValue) {
                    if (newValue != null) {
                      viewModel.setSelectedType(newValue);
                    }
                  },
                  activeColor: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../viewmodel/insurance_type_viewmodel.dart';
//
// class InsuranceTypeBottomSheet extends StatelessWidget {
//   const InsuranceTypeBottomSheet({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final insuranceTypeViewModel = Provider.of<InsuranceTypeViewModel>(context);
//
//     return DraggableScrollableSheet(
//       initialChildSize: 0.5,
//       maxChildSize: 0.5,
//       minChildSize: 0.5,
//       // initialChildSize: 0.5, // Open with 70% of the screen height
//       // maxChildSize: 0.55, // Allow expansion to 90% of the screen height
//       // minChildSize: 0.5, // Allow shrinking to 50% of the screen height
//       expand: false,
//       builder: (context, scrollController) {
//         return Material(
//           elevation: 4,
//           borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
//           color: Colors.white,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 18,
//                   vertical: 7,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           'Type of Insurance',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.close),
//                           onPressed: () => Navigator.pop(context),
//                         ),
//                       ],
//                     ),
//                     // const SizedBox(height: 1),
//                     const Text(
//                       'Choose the insurance type of your existing policy',
//                       style: TextStyle(fontSize: 14, color: Colors.black),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 1),
//               Expanded(
//                 child: ListView(
//                   controller: scrollController,
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 1,
//                   ),
//                   children: [
//                     _buildInsuranceOption(
//                       insuranceTypeViewModel,
//                       InsuranceType.health,
//                       'Health Insurance',
//                       Icons.favorite,
//                     ),
//                     _buildInsuranceOption(
//                       insuranceTypeViewModel,
//                       InsuranceType.term,
//                       'Term Insurance',
//                       Icons.umbrella,
//                     ),
//                     _buildInsuranceOption(
//                       insuranceTypeViewModel,
//                       InsuranceType.motor,
//                       'Motor Insurance',
//                       Icons.directions_car,
//                     ),
//                     _buildInsuranceOption(
//                       insuranceTypeViewModel,
//                       InsuranceType.other,
//                       'Other Insurance',
//                       Icons.add,
//                     ),
//                     const SizedBox(height: 11),
//                     SafeArea(
//                       top: false,
//                       child: ElevatedButton(
//                         onPressed: insuranceTypeViewModel.selectedType == null
//                             ? null
//                             : () async {
//                                 final Map<String, dynamic> body = {
//                                   "insurance_type": insuranceTypeViewModel
//                                       .selectedType
//                                       ?.displayName,
//                                 };
//                                 try {
//                                   await insuranceTypeViewModel.myPolicySendApi(
//                                     body,
//                                     context,
//                                   );
//                                 } catch (e) {
//                                   debugPrint(
//                                     "❌ Exception while sending type: $e",
//                                   );
//                                 }
//                               },
//                         style: ElevatedButton.styleFrom(
//                           minimumSize: const Size.fromHeight(50),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           backgroundColor: Colors.blue[700],
//                           foregroundColor: Colors.white,
//                         ),
//                         child: const Text('Next'),
//                       ),
//                     ),
//                     const SizedBox(height: 11),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildInsuranceOption(
//     InsuranceTypeViewModel viewModel,
//     InsuranceType type,
//     String title,
//     IconData iconData,
//   ) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: GestureDetector(
//         onTap: () => viewModel.setSelectedType(type),
//         child: Container(
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: viewModel.selectedType == type
//                   ? Colors.green
//                   : Colors.grey[300]!,
//               width: 1.5,
//             ),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 1),
//             child: Row(
//               children: [
//                 Icon(iconData, color: Colors.blue),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: Text(
//                     title,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//                 Radio<InsuranceType>(
//                   value: type,
//                   groupValue: viewModel.selectedType,
//                   onChanged: (InsuranceType? newValue) {
//                     if (newValue != null) {
//                       viewModel.setSelectedType(newValue);
//                     }
//                   },
//                   activeColor: Colors.blue,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
