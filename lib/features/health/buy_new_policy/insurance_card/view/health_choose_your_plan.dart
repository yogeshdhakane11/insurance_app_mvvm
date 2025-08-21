import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../routes/routes_name.dart';
import '../viewmodel/health_card_viewmodel.dart';
import '../widget/health_isurance_card.dart';

class HealthChoosePlanScreen extends StatelessWidget {
  final List<String> sumOptions = [
    '₹ 5 lakhs',
    '₹ 7 lakhs',
    '₹ 7.5 lakhs',
    '₹ 10 lakhs',
    '₹ 12 lakhs',
    '₹ 15 lakhs',
    '₹ 20 lakhs',
    '₹ 25 lakhs',
    '₹ 30 lakhs',
    '₹ 1 Cr',
  ];

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions using MediaQuery for full-screen responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double paddingHorizontal = screenWidth * 0.04; // 4% padding for all sides

    return ChangeNotifierProvider(
      create: (_) {
        final vm = HealthChoosePlanViewModel();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          vm.fetchPremium(context);
        });
        return vm;
      },
      child: Consumer<HealthChoosePlanViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Choose your plan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.05,
                ),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, size: screenWidth * 0.06),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: paddingHorizontal,
                vertical: screenHeight * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: screenHeight * 0.32, // 35% of the screen height
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade300, blurRadius: 4),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.04), // 4% padding
                      child: Column(
                        children: [
                          Text(
                            'Sum insured should be greater than your emergency fund size',
                            style: TextStyle(
                              fontSize:
                                  screenWidth *
                                  0.04, // 4% font size of screen width
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          GestureDetector(
                            onTap: () async {
                              await showSumInsuredPicker(
                                context: context,
                                title: "Sum Insured",
                                options: sumOptions,
                                initialIndex: sumOptions.indexOf(
                                  viewModel.selectedSumInsured,
                                ),
                                onValueSelected: (value) async {
                                  viewModel.setSelectedSumInsured(value);
                                  await viewModel.fetchPremium(context);
                                },
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical:
                                    screenHeight *
                                    0.011, // 1.5% vertical padding
                                horizontal:
                                    screenWidth * 0.05, // 5% horizontal padding
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Sum Insured",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize:
                                              screenWidth *
                                              0.032, // 3.5% font size
                                        ),
                                      ),
                                      // SizedBox(height: screenHeight * 0.01),
                                      Text(
                                        viewModel.selectedSumInsured,
                                        style: TextStyle(
                                          fontSize:
                                              screenWidth *
                                              0.040, // 4.5% font size
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size:
                                        screenWidth *
                                        0.06, // 6% of screen width
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Container(
                            padding: EdgeInsets.all(screenWidth * 0.04),
                            decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.campaign,
                                  color: Colors.deepPurple,
                                  size: screenWidth * 0.06, // 6% icon size
                                ),
                                SizedBox(
                                  width: screenWidth * 0.03,
                                ), // 3% width between icon and text
                                Expanded(
                                  child: Text(
                                    'We recommend an insured sum of at least ₹10 lakhs given the rising medical costs.',
                                    style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontSize:
                                          screenWidth * 0.035, // 3.5% font size
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    children: [
                      Text(
                        'Plans For Self',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.054, // 6% font size
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      InsurancePlanCard(
                        logoPath: 'assets/images/care_logo.png',
                        title: 'Care Supreme',
                        hospitalCount: '0 Cashless hospitals near you',
                        features: [
                          'Get 7x sum insured in 5 years',
                          'No Sublimit on Modern Treatment, AYUSH, Room rent',
                          'Unlimited restoration of sum insured',
                        ],
                        premium:
                            viewModel.premiums['Care Supreme']?.toStringAsFixed(
                              0,
                            ) ??
                            '0',
                        sumInsured: viewModel.selectedSumInsured,
                        claimSettled: '95.2% Claims Settled',
                        discountText: 'Inclusive of 5% Discount',
                        discountColor: Colors.green.shade50,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteNames.careSupremeScreen,
                          );
                        },
                      ),
                      InsurancePlanCard(
                        logoPath: 'assets/images/star_logo.jpg',
                        title: 'Star Comprehensive',
                        hospitalCount: '14000 Cashless hospitals near you',
                        features: [
                          'Personal Accident Cover',
                          'Single Private AC Room',
                          'No claim bonus',
                        ],
                        premium:
                            viewModel.premiums['Family Floater Plan']
                                ?.toStringAsFixed(0) ??
                            '0',
                        sumInsured: viewModel.selectedSumInsured,
                        claimSettled: '99.21% Claims settled',
                        discountText: '17 Crore+ Lives covered since inception',
                        discountColor: Colors.green.shade50,
                        onTap: () {
                          Navigator.pushNamed(context, RouteNames.starScreen);
                        },
                      ),
                      InsurancePlanCard(
                        logoPath: 'assets/images/niva_bupa.png',
                        title: 'Niva Bupa ReAssure 2.0',
                        hospitalCount: '85 Cashless hospitals near you',
                        features: [
                          'Unlimited restoration of sum insured',
                          'Carry forward unused base sum insured upto 3X to 10X',
                          'Hospitalisation of 2 hrs+ is covered',
                        ],
                        premium:
                            viewModel.premiums['ICICI Complete Care Plus']
                                ?.toStringAsFixed(0) ??
                            '0',
                        sumInsured: viewModel.selectedSumInsured,
                        claimSettled: '95% Claims settled',
                        discountText: '', // No discount tag for this plan
                        discountColor: null,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteNames.nivaBupaScreen,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> showSumInsuredPicker({
    required BuildContext context,
    required String title,
    required List<String> options,
    required int initialIndex,
    required ValueChanged<String> onValueSelected,
  }) async {
    int selectedIndex = initialIndex;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    options[selectedIndex],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 180,
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(
                    initialItem: initialIndex,
                  ),
                  itemExtent: 48,
                  // looping: true,
                  onSelectedItemChanged: (index) {
                    selectedIndex = index;
                  },
                  children: options
                      .map(
                        (value) => Center(
                          child: Text(
                            value,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    onValueSelected(options[selectedIndex]);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../viewmodel/health_card_viewmodel.dart';
// import '../widget/health_isurance_card.dart';
//
// class HealthChoosePlanScreen extends StatelessWidget {
//   final List<String> sumOptions = [
//     '₹ 5 lakhs',
//     '₹ 7 lakhs',
//     '₹ 7.5 lakhs',
//     '₹ 10 lakhs',
//     '₹ 12 lakhs',
//     '₹ 15 lakhs',
//     '₹ 20 lakhs',
//     '₹ 25 lakhs',
//     '₹ 30 lakhs',
//     '₹ 1 Cr',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) {
//         final vm = HealthChoosePlanViewModel();
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           vm.fetchPremium(context);
//         });
//         return vm;
//       },
//       child: Consumer<HealthChoosePlanViewModel>(
//         builder: (context, viewModel, _) {
//           return Scaffold(
//             appBar: AppBar(
//               title: Text(
//                 'Choose your plan',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               leading: IconButton(
//                 icon: Icon(Icons.arrow_back_ios),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               centerTitle: true,
//             ),
//             body: SingleChildScrollView(
//               padding: const EdgeInsets.all(16),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: 260,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(color: Colors.grey.shade300, blurRadius: 4),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: Column(
//                           children: [
//                             Text(
//                               'Sum insured should be greater than your emergency fund size',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.grey[700],
//                               ),
//                             ),
//                             SizedBox(height: 11),
//                             GestureDetector(
//                               onTap: () async {
//                                 await showSumInsuredPicker(
//                                   context: context,
//                                   title: "Sum Insured",
//                                   options: sumOptions,
//                                   initialIndex: sumOptions.indexOf(
//                                     viewModel.selectedSumInsured,
//                                   ),
//                                   onValueSelected: (value) async {
//                                     viewModel.setSelectedSumInsured(value);
//                                     await viewModel.fetchPremium(context);
//                                   },
//                                 );
//                               },
//                               child: Container(
//                                 padding: const EdgeInsets.symmetric(
//                                   vertical: 4,
//                                   horizontal: 16,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                     color: Colors.grey.shade400,
//                                   ),
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const Text(
//                                           "Sum Insured",
//                                           style: TextStyle(
//                                             color: Colors.grey,
//                                             fontSize: 12,
//                                           ),
//                                         ),
//                                         const SizedBox(height: 4),
//                                         Text(
//                                           viewModel.selectedSumInsured,
//                                           style: const TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     const Icon(
//                                       Icons.keyboard_arrow_down_rounded,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 11),
//                             Container(
//                               padding: const EdgeInsets.all(14),
//                               decoration: BoxDecoration(
//                                 color: Colors.blue[50],
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: Row(
//                                 children: [
//                                   Icon(
//                                     Icons.campaign,
//                                     color: Colors.deepPurple,
//                                   ),
//                                   const SizedBox(width: 8),
//                                   Expanded(
//                                     child: Text(
//                                       'We recommend an insured sum of at least ₹10 lakhs given the rising medical costs.',
//                                       style: TextStyle(
//                                         color: Colors.deepPurple,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 11),
//                     Row(
//                       children: [
//                         Text(
//                           'Plans For Self',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                           ),
//                         ),
//                         Spacer(),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     ListView(
//                       physics: NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       children: [
//                         InsurancePlanCard(
//                           logoPath: 'assets/images/care_logo.png',
//                           title: 'Care Supreme',
//                           hospitalCount: '0 Cashless hospitals near you',
//                           features: [
//                             'Get 7x sum insured in 5 years',
//                             'No Sublimit on Modern Treatment, AYUSH, Room rent',
//                             'Unlimited restoration of sum insured',
//                           ],
//                           premium:
//                               viewModel.premiums['Care Supreme']
//                                   ?.toStringAsFixed(0) ??
//                               '0',
//                           sumInsured: viewModel.selectedSumInsured,
//                           claimSettled: '95.2% Claims Settled',
//                           discountText: 'Inclusive of 5% Discount',
//                           discountColor: Colors.green.shade50,
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => HealthChoosePlanScreen(),
//                               ),
//                             );
//                           },
//                         ),
//                         InsurancePlanCard(
//                           logoPath: 'assets/images/star_logo.jpg',
//                           title: 'Star Comprehensive',
//                           hospitalCount: '14000 Cashless hospitals near you',
//                           features: [
//                             'Personal Accident Cover',
//                             'Single Private AC Room',
//                             'No claim bonus',
//                           ],
//                           premium:
//                               viewModel.premiums['Family Floater Plan']
//                                   ?.toStringAsFixed(0) ??
//                               '0',
//                           sumInsured: viewModel.selectedSumInsured,
//                           claimSettled: '99.21% Claims settled',
//                           discountText:
//                               '17 Crore+ Lives covered since inception',
//                           discountColor: Colors.green.shade50,
//                           onTap: () {},
//                         ),
//                         InsurancePlanCard(
//                           logoPath: 'assets/images/niva_bupa.png',
//                           title: 'Niva Bupa ReAssure 2.0',
//                           hospitalCount: '85 Cashless hospitals near you',
//                           features: [
//                             'Unlimited restoration of sum insured',
//                             'Carry forward unused base sum insured upto 3X to 10X',
//                             'Hospitalisation of 2 hrs+ is covered',
//                           ],
//                           premium:
//                               viewModel.premiums['ICICI Complete Care Plus']
//                                   ?.toStringAsFixed(0) ??
//                               '0',
//                           sumInsured: viewModel.selectedSumInsured,
//                           claimSettled: '95% Claims settled',
//                           discountText: '', // No discount tag for this plan
//                           discountColor: null,
//                           onTap: () {},
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Future<void> showSumInsuredPicker({
//     required BuildContext context,
//     required String title,
//     required List<String> options,
//     required int initialIndex,
//     required ValueChanged<String> onValueSelected,
//   }) async {
//     int selectedIndex = initialIndex;
//
//     await showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.close),
//                     onPressed: () => Navigator.pop(context),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Text(
//                     options[selectedIndex],
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               SizedBox(
//                 height: 180,
//                 child: CupertinoPicker(
//                   scrollController: FixedExtentScrollController(
//                     initialItem: initialIndex,
//                   ),
//                   itemExtent: 48,
//                   looping: true,
//                   onSelectedItemChanged: (index) {
//                     selectedIndex = index;
//                   },
//                   children: options
//                       .map(
//                         (value) => Center(
//                           child: Text(
//                             value,
//                             style: const TextStyle(fontSize: 16),
//                           ),
//                         ),
//                       )
//                       .toList(),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   onPressed: () {
//                     onValueSelected(options[selectedIndex]);
//                     Navigator.pop(context);
//                   },
//                   child: const Text(
//                     "Save",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
