import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../../../../routes/routes_name.dart';
import '../../../../../chatbot/chat_screen.dart';
import '../viewmodel/care_supreme_viewmodel.dart';
import 'care_supreme_tabs.dart';
import 'duration_screen.dart';

class CareSupremeScreen extends StatelessWidget {
  const CareSupremeScreen({super.key});

  Future<void> showSumInsuredPicker({
    required BuildContext context,
    required String title,
    required List<String> options,
    required int initialIndex,
    required ValueChanged<String> onValueSelected,
  }) async {
    int selectedIndex = initialIndex;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(screenWidth * 0.05),
        ), // Responsive radius
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            screenWidth * 0.04, // Responsive padding
            screenWidth * 0.04,
            screenWidth * 0.04,
            screenHeight * 0.03,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.045, // Responsive font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      size: screenWidth * 0.06, // Responsive icon size
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    options[selectedIndex],
                    style: TextStyle(
                      fontSize: screenWidth * 0.04, // Responsive font size
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              SizedBox(
                height: screenHeight * 0.22, // Responsive picker height
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(
                    initialItem: initialIndex,
                  ),
                  itemExtent: screenHeight * 0.06, // Responsive item extent
                  looping: true,
                  onSelectedItemChanged: (index) {
                    selectedIndex = index;
                  },
                  children: options
                      .map(
                        (value) => Center(
                          child: Text(
                            value,
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                            ), // Responsive font size
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(height: screenHeight * 0.025), // Responsive spacing
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.017,
                    ), // Responsive padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        screenWidth * 0.03,
                      ), // Responsive radius
                    ),
                  ),
                  onPressed: () {
                    onValueSelected(options[selectedIndex]);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.04, // Responsive font size
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (context) => CareSupremeViewModel(),
      child: Consumer<CareSupremeViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Customize your Plan',
                style: TextStyle(
                  fontSize: screenWidth * 0.045, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: screenWidth * 0.06, // Responsive icon size
                ),
                onPressed: () => Navigator.pop(context),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.04), // Dynamic padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Star Card
                    Container(
                      padding: EdgeInsets.all(
                        screenWidth * 0.04,
                      ), // Dynamic padding
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          screenWidth * 0.04,
                        ), // Responsive radius
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade100,
                            blurRadius: screenWidth * 0.015,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/care_logo.png", // Your logo
                                      width:
                                          screenWidth *
                                          0.06, // Dynamic logo size
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.05,
                                    ), // Dynamic spacing
                                    Text(
                                      "Care Supreme",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            screenWidth *
                                            0.04, // Responsive font size
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: screenHeight * 0.01,
                                ), // Responsive spacing
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Members",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize:
                                                screenWidth *
                                                0.03, // Responsive font size
                                          ),
                                        ),
                                        SizedBox(
                                          height: screenHeight * 0.0025,
                                        ), // Responsive spacing
                                        Text(
                                          "Self",
                                          style: TextStyle(
                                            fontSize:
                                                screenWidth *
                                                0.035, // Responsive font size
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Term",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize:
                                                screenWidth *
                                                0.03, // Responsive font size
                                          ),
                                        ),
                                        SizedBox(
                                          height: screenHeight * 0.0025,
                                        ), // Responsive spacing
                                        Text(
                                          "1 year",
                                          style: TextStyle(
                                            fontSize:
                                                screenWidth *
                                                0.035, // Responsive font size
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.025,
                    ), // Responsive spacing
                    // Sum Insured
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.03, // Dynamic padding
                        horizontal: screenWidth * 0.04,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          screenWidth * 0.03,
                        ), // Responsive radius
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: screenWidth * 0.015,
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          await showSumInsuredPicker(
                            context: context,
                            title: "Sum Insured",
                            options: viewModel.sumOptions,
                            initialIndex: viewModel.sumOptions.indexOf(
                              viewModel.selectedSumInsured,
                            ),
                            onValueSelected: (value) {
                              viewModel.setSelectedSumInsured(value);
                            },
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical:
                                screenHeight * 0.005, // Responsive padding
                            horizontal: screenWidth * 0.04,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(
                              screenWidth * 0.03,
                            ), // Responsive radius
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sum Insured",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize:
                                          screenWidth *
                                          0.03, // Responsive font size
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.005,
                                  ), // Responsive spacing
                                  Text(
                                    viewModel.selectedSumInsured,
                                    style: TextStyle(
                                      fontSize:
                                          screenWidth *
                                          0.04, // Responsive font size
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size:
                                    screenWidth * 0.06, // Responsive icon size
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.015,
                    ), // Responsive spacing
                    // Segmented Control and Content in one container
                    CareSupremeTabWidget(),
                    SizedBox(
                      height: screenHeight * 0.026,
                    ), // Responsive spacing
                    // Bottom content (Need Assistance, Chat, Call)
                    Row(
                      children: [
                        Text(
                          "Need Assistance?",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                screenWidth * 0.045, // Responsive font size
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.007,
                    ), // Responsive spacing
                    Text(
                      "We are always up to help you protect your wealth.",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                      ), // Responsive font size
                    ),
                    SizedBox(
                      height: screenHeight * 0.015,
                    ), // Responsive spacing
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Implement call functionality
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.call_outlined,
                                size:
                                    screenWidth * 0.04, // Responsive icon size
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: screenWidth * 0.01,
                              ), // Responsive spacing
                              Text(
                                "Set up call",
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.blue,
                                  fontSize:
                                      screenWidth *
                                      0.035, // Responsive font size
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.04,
                        ), // Responsive spacing
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RouteNames.chatScreen);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.chat_bubble_outline,
                                size:
                                    screenWidth * 0.04, // Responsive icon size
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: screenWidth * 0.01,
                              ), // Responsive spacing
                              Text(
                                "Chat with us",
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.blue,
                                  fontSize:
                                      screenWidth *
                                      0.035, // Responsive font size
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.05,
                        ), // Responsive spacing
                      ],
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              color: Colors.white,
              child: SizedBox(
                height: screenHeight * 0.1, // Adjust height for responsiveness
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(
                        screenWidth * 0.01,
                      ), // Responsive padding
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Premium (incl. GST)",
                            style: TextStyle(
                              fontSize:
                                  screenWidth * 0.03, // Responsive font size
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.005,
                          ), // Responsive spacing
                          Text(
                            "₹12,394",
                            style: TextStyle(
                              fontSize:
                                  screenWidth * 0.045, // Responsive font size
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RouteNames.careSupremeDurationScreen,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            screenWidth * 0.02,
                          ), // Responsive radius
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.085, // Responsive padding
                          vertical: screenHeight * 0.017, // Responsive padding
                        ),
                      ),
                      child: Text(
                        "Select Plan",
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                        ), // Responsive font size
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';
// import '../../../../../chatbot/chat_screen.dart';
// import '../viewmodel/care_supreme_viewmodel.dart';
// import 'care_supreme_tabs.dart';
// import 'duration_screen.dart';
//
// class CareSupremeScreen extends StatelessWidget {
//   const CareSupremeScreen({super.key});
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
//
//   @override
//   Widget build(BuildContext context) {
//     // Get screen width and height for responsiveness
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//
//     return ChangeNotifierProvider(
//       create: (context) => CareSupremeViewModel(),
//       child: Consumer<CareSupremeViewModel>(
//         builder: (context, viewModel, child) {
//           return Scaffold(
//             appBar: AppBar(
//               title: const Text(
//                 'Customize your Plan',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               leading: IconButton(
//                 icon: const Icon(Icons.arrow_back_ios_new),
//                 onPressed: () => Navigator.pop(context),
//               ),
//               centerTitle: true,
//             ),
//             body: SingleChildScrollView(
//               child: Padding(
//                 padding: EdgeInsets.all(screenWidth * 0.04), // Dynamic padding
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Star Card
//                     Container(
//                       padding: EdgeInsets.all(
//                         screenWidth * 0.04,
//                       ), // Dynamic padding
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(16),
//                         boxShadow: [
//                           BoxShadow(color: Colors.grey.shade100, blurRadius: 6),
//                         ],
//                       ),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Image.asset(
//                                       "assets/images/care_logo.png", // Your logo
//                                       width:
//                                           screenWidth *
//                                           0.06, // Dynamic logo size
//                                     ),
//                                     SizedBox(
//                                       width: screenWidth * 0.05,
//                                     ), // Dynamic spacing
//                                     const Text(
//                                       "Care Supreme",
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 16,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: const [
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "Members",
//                                           style: TextStyle(
//                                             color: Colors.grey,
//                                             fontSize: 12,
//                                           ),
//                                         ),
//                                         SizedBox(height: 2),
//                                         Text(
//                                           "Self",
//                                           style: TextStyle(
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.end,
//                                       children: [
//                                         Text(
//                                           "Term",
//                                           style: TextStyle(
//                                             color: Colors.grey,
//                                             fontSize: 12,
//                                           ),
//                                         ),
//                                         SizedBox(height: 2),
//                                         Text(
//                                           "1 year",
//                                           style: TextStyle(
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//
//                     // Sum Insured
//                     Container(
//                       padding: EdgeInsets.symmetric(
//                         vertical: screenHeight * 0.03, // Dynamic padding
//                         horizontal: screenWidth * 0.04,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(color: Colors.grey.shade200, blurRadius: 6),
//                         ],
//                       ),
//                       child: GestureDetector(
//                         onTap: () async {
//                           await showSumInsuredPicker(
//                             context: context,
//                             title: "Sum Insured",
//                             options: viewModel.sumOptions,
//                             initialIndex: viewModel.sumOptions.indexOf(
//                               viewModel.selectedSumInsured,
//                             ),
//                             onValueSelected: (value) {
//                               viewModel.setSelectedSumInsured(value);
//                             },
//                           );
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                             vertical: 4,
//                             horizontal: 16,
//                           ),
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.grey.shade400),
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Text(
//                                     "Sum Insured",
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   Text(
//                                     viewModel.selectedSumInsured,
//                                     style: const TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const Icon(Icons.keyboard_arrow_down_rounded),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 11),
//
//                     // Segmented Control and Content in one container
//                     CareSupremeTabWidget(),
//                     const SizedBox(height: 21),
//
//                     // Bottom content (Need Assistance, Chat, Call)
//                     const Row(
//                       children: [
//                         Text(
//                           "Need Assistance?",
//                           textAlign: TextAlign.start,
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 6),
//                     const Text(
//                       "We are always up to help you protect your wealth.",
//                       textAlign: TextAlign.start,
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     const SizedBox(height: 12),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             // Implement call functionality
//                           },
//                           child: const Row(
//                             children: [
//                               Icon(
//                                 Icons.call_outlined,
//                                 size: 16,
//                                 color: Colors.blue,
//                               ),
//                               SizedBox(width: 4),
//                               Text(
//                                 "Set up call",
//                                 style: TextStyle(
//                                   color: Colors.blue,
//                                   decoration: TextDecoration.underline,
//                                   decorationColor: Colors.blue,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => ChatScreen(),
//                               ),
//                             );
//                           },
//                           child: const Row(
//                             children: [
//                               Icon(
//                                 Icons.chat_bubble_outline,
//                                 size: 16,
//                                 color: Colors.blue,
//                               ),
//                               SizedBox(width: 4),
//                               Text(
//                                 "Chat with us",
//                                 style: TextStyle(
//                                   color: Colors.blue,
//                                   decoration: TextDecoration.underline,
//                                   decorationColor: Colors.blue,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 40),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             bottomNavigationBar: BottomAppBar(
//               color: Colors.white,
//               child: SizedBox(
//                 height: screenHeight * 0.1, // Adjust height for responsiveness
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.all(4),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Premium (incl. GST)",
//                             style: TextStyle(fontSize: 12, color: Colors.grey),
//                           ),
//                           SizedBox(height: 4),
//                           Text(
//                             "₹12,394", // Updated to match the image
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: Colors.blue,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           CupertinoPageRoute(
//                             builder: (context) => CareSupremeDurationScreen(),
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 34,
//                           vertical: 14,
//                         ),
//                       ),
//                       child: const Text("Select Plan"),
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
// }

// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';
// import '../../../../../chatbot/chat_screen.dart';
// import '../viewmodel/care_supreme_viewmodel.dart';
// import 'care_supreme_tabs.dart';
// import 'custumize_plan__screen.dart';
//
// class CareSupremeScreen extends StatelessWidget {
//   const CareSupremeScreen({super.key});
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
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => CareSupremeViewModel(),
//       child: Consumer<CareSupremeViewModel>(
//         builder: (context, viewModel, child) {
//           // Initialize PageController here
//
//           // Listen for segment changes from ViewModel to update PageController
//           // This ensures that if the viewModel's segment changes due to a tap,
//           // the PageView also updates.
//           // We can add a listener to the selectedSegment ValueNotifier.
//           // Make sure this is only added once per build, using a StatefulWidget
//           // or a more sophisticated state management for PageController.
//           // For simplicity, we'll ensure the button tap updates both viewModel and PageController.
//           // And onPageChanged updates the viewModel.
//
//           return Scaffold(
//             appBar: AppBar(
//               title: const Text(
//                 'Customize your Plan',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               leading: IconButton(
//                 icon: const Icon(Icons.arrow_back_ios_new),
//                 onPressed: () => Navigator.pop(context),
//               ),
//               centerTitle: true,
//             ),
//             body: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Star Card
//                     Container(
//                       padding: const EdgeInsets.all(14),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(16),
//                         boxShadow: [
//                           BoxShadow(color: Colors.grey.shade100, blurRadius: 6),
//                         ],
//                       ),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Image.asset(
//                                       "assets/images/care_logo.png", // Your logo
//                                       width: 24,
//                                     ),
//                                     const SizedBox(width: 21),
//                                     const Text(
//                                       "Care Supreme",
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 16,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: const [
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "Members",
//                                           style: TextStyle(
//                                             color: Colors.grey,
//                                             fontSize: 12,
//                                           ),
//                                         ),
//                                         SizedBox(height: 2),
//                                         Text(
//                                           "Self",
//                                           style: TextStyle(
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.end,
//                                       children: [
//                                         Text(
//                                           "Term",
//                                           style: TextStyle(
//                                             color: Colors.grey,
//                                             fontSize: 12,
//                                           ),
//                                         ),
//                                         SizedBox(height: 2),
//                                         Text(
//                                           "1 year",
//                                           style: TextStyle(
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//
//                     // Sum Insured
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 21,
//                         horizontal: 16,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(color: Colors.grey.shade200, blurRadius: 6),
//                         ],
//                       ),
//                       child: GestureDetector(
//                         onTap: () async {
//                           await showSumInsuredPicker(
//                             context: context,
//                             title: "Sum Insured",
//                             options: viewModel.sumOptions,
//                             initialIndex: viewModel.sumOptions.indexOf(
//                               viewModel.selectedSumInsured,
//                             ),
//                             onValueSelected: (value) {
//                               viewModel.setSelectedSumInsured(value);
//                             },
//                           );
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                             vertical: 4,
//                             horizontal: 16,
//                           ),
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.grey.shade400),
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Text(
//                                     "Sum Insured",
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   Text(
//                                     viewModel.selectedSumInsured,
//                                     style: const TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const Icon(Icons.keyboard_arrow_down_rounded),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 11),
//
//                     // Segmented Control and Content in one container
//                     CareSupremeTabWidget(),
//                     const SizedBox(height: 21),
//
//                     // Bottom content (Need Assistance, Chat, Call)
//                     const Row(
//                       children: [
//                         Text(
//                           "Need Assistance?",
//                           textAlign: TextAlign.start,
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 6),
//                     const Text(
//                       "We are always up to help you protect your wealth.",
//                       textAlign: TextAlign.start,
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     const SizedBox(height: 12),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             // Implement call functionality
//                           },
//                           child: const Row(
//                             children: [
//                               Icon(
//                                 Icons.call_outlined,
//                                 size: 16,
//                                 color: Colors.blue,
//                               ),
//                               SizedBox(width: 4),
//                               Text(
//                                 "Set up call",
//                                 style: TextStyle(
//                                   color: Colors.blue,
//                                   decoration: TextDecoration.underline,
//                                   decorationColor: Colors.blue,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => ChatScreen(),
//                               ),
//                             );
//                           },
//                           child: const Row(
//                             children: [
//                               Icon(
//                                 Icons.chat_bubble_outline,
//                                 size: 16,
//                                 color: Colors.blue,
//                               ),
//                               SizedBox(width: 4),
//                               Text(
//                                 "Chat with us",
//                                 style: TextStyle(
//                                   color: Colors.blue,
//                                   decoration: TextDecoration.underline,
//                                   decorationColor: Colors.blue,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 40),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             bottomNavigationBar: BottomAppBar(
//               color: Colors.white,
//               child: SizedBox(
//                 height: 81,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.all(4),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Premium (incl. GST)",
//                             style: TextStyle(fontSize: 12, color: Colors.grey),
//                           ),
//                           SizedBox(height: 4),
//                           Text(
//                             "₹12,394", // Updated to match the image
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: Colors.blue,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           CupertinoPageRoute(
//                             builder: (context) => CareSupremeDurationScreen(),
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 34,
//                           vertical: 14,
//                         ),
//                       ),
//                       child: const Text("Select Plan"),
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
// }
