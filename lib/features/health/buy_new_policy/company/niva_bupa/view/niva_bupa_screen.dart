import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../../routes/routes_name.dart';
import '../../../../../chatbot/chat_screen.dart';
import '../viewmodel/niva_bupa_viewmodel.dart';
import 'niva_bupa_tab_screen.dart';

class NivaBupaScreen extends StatelessWidget {
  const NivaBupaScreen({super.key});

  void _showCupertinoPickerModal({
    required BuildContext context,
    required String title,
    required List<String> options,
    required String selectedValue,
    required Function(String) onValueSelected,
  }) {
    String tempSelected = selectedValue;

    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height:
            MediaQuery.of(context).size.height *
            0.4125, // Responsive height (was 330)
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(MediaQuery.of(context).size.width * 0.05),
          ), // Responsive border radius (was 20)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Top bar with title and close icon
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal:
                    MediaQuery.of(context).size.width *
                    0.045, // Responsive padding (was 18)
                vertical:
                    MediaQuery.of(context).size.height *
                    0.0225, // Responsive padding (was 18)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).size.width *
                                0.04, // Responsive font size (was 16)
                            color: Colors.black,
                            decoration: TextDecoration.none,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.close,
                          size: MediaQuery.of(context).size.width * 0.05,
                        ), // Responsive icon size (was 20)
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.0075,
                  ), // Responsive spacing (was 6)
                  Text(
                    tempSelected,
                    style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.width *
                          0.035, // Responsive font size (was 14)
                      color: Colors.black54,
                      decoration: TextDecoration.none,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0125,
            ), // Responsive spacing (was 10)
            Expanded(
              child: CupertinoPicker(
                scrollController: FixedExtentScrollController(
                  initialItem: options.indexOf(selectedValue),
                ),
                itemExtent:
                    MediaQuery.of(context).size.height *
                    0.0525, // Responsive item extent (was 42)
                onSelectedItemChanged: (index) {
                  tempSelected = options[index];
                },
                children: options
                    .map(
                      (e) => Center(
                        child: Text(
                          e,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.035,
                          ), // Responsive font size
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal:
                    MediaQuery.of(context).size.width *
                    0.04, // Responsive padding (was 16)
                vertical:
                    MediaQuery.of(context).size.height *
                    0.0175, // Responsive padding (was 14)
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF548ADD),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.0175,
                    ), // Responsive padding (was 14)
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.03,
                      ), // Responsive border radius (was 12)
                    ),
                  ),
                  onPressed: () {
                    onValueSelected(tempSelected);
                    print("✅ $title selected: $tempSelected");
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ), // Responsive font size (was 16)
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPickerTile({
    required BuildContext context, // Corrected to BuildContext
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.width * 0.0175,
            ),
          ), // Responsive border radius (was 7)
          labelStyle: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.035,
          ), // Responsive label font size
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
              ),
            ), // Responsive font size (was 16)
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black,
              size: MediaQuery.of(context).size.width * 0.06,
            ), // Responsive icon size
          ],
        ),
      ),
    );
  }

  void _openKnowMoreSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(MediaQuery.of(context).size.width * 0.04),
        ), // Responsive border radius (was 16)
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.all(
          MediaQuery.of(context).size.width * 0.05,
        ), // Responsive padding (was 20)
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Plan Type Details',
              style: TextStyle(
                fontSize:
                    MediaQuery.of(context).size.width *
                    0.045, // Responsive font size (was 18)
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ), // Responsive spacing (was 12)
            _detailRow(
              context, // Pass context to _detailRow
              'Bronze +',
              'Carry forward the balance sum insured up to 3 times of base cover',
            ),
            _detailRow(
              context, // Pass context to _detailRow
              'Platinum +',
              'Carry forward the balance sum insured up to 5 times of base cover',
            ),
            _detailRow(
              context, // Pass context to _detailRow
              'Titanium +',
              'Carry forward the balance sum insured up to 10 times of base cover',
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Close',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize:
                        MediaQuery.of(context).size.width *
                        0.035, // Responsive font size
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(
    BuildContext context,
    String title,
    String desc,
  ) => // Added BuildContext parameter
  Padding(
    padding: EdgeInsets.symmetric(
      vertical: MediaQuery.of(context).size.height * 0.01,
    ), // Responsive padding (was 8)
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize:
                MediaQuery.of(context).size.width *
                0.04, // Responsive font size (was 16)
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.005,
        ), // Responsive spacing (was 4)
        Text(
          desc,
          style: TextStyle(
            fontSize:
                MediaQuery.of(context).size.width *
                0.035, // Responsive font size (was 14)
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );

  void _shareAppUrl() {
    Share.share('Check out this plan on web: https://example.com');
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions using MediaQuery
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) => NivaBupaViewModel(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            screenHeight * 0.1,
          ), // Responsive height (was 80)
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.03,
            ), // Responsive padding (was 12)
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.black12)),
            ),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                      size: screenWidth * 0.06, // Responsive icon size
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Text(
                      "Customize your Plan",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize:
                            screenWidth * 0.04, // Responsive font size (was 16)
                      ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: _shareAppUrl,
                    icon: Icon(
                      Icons.language,
                      color: Colors.blueGrey,
                      size: screenWidth * 0.04, // Responsive icon size (was 16)
                    ),
                    label: Text(
                      'View on Web',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize:
                            screenWidth *
                            0.0325, // Responsive font size (was 13)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Consumer<NivaBupaViewModel>(
          builder: (context, viewModel, child) => SingleChildScrollView(
            padding: EdgeInsets.all(
              screenWidth * 0.035,
            ), // Responsive padding (was 14)
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(
                    screenWidth * 0.06,
                  ), // Responsive padding (was 24)
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      screenWidth * 0.04,
                    ), // Responsive border radius (was 16)
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade100,
                        blurRadius: screenWidth * 0.015,
                      ), // Responsive blur radius (was 6)
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
                                  "assets/images/niva_bupa.png",
                                  width:
                                      screenWidth *
                                      0.09, // Responsive image width (was 36)
                                ),
                                SizedBox(
                                  width: screenWidth * 0.0525,
                                ), // Responsive spacing (was 21)
                                Text(
                                  "Niva Bupa ReAssure 2.0",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        screenWidth *
                                        0.04, // Responsive font size (was 16)
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * 0.01,
                            ), // Responsive spacing (was 8)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Members",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize:
                                            screenWidth *
                                            0.03, // Responsive font size (was 12)
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.0025,
                                    ), // Responsive spacing (was 2)
                                    Text(
                                      "Self",
                                      style: TextStyle(
                                        fontSize:
                                            screenWidth *
                                            0.035, // Responsive font size (was 14)
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Term",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize:
                                            screenWidth *
                                            0.03, // Responsive font size (was 12)
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.0025,
                                    ), // Responsive spacing (was 2)
                                    Text(
                                      "1 year",
                                      style: TextStyle(
                                        fontSize:
                                            screenWidth *
                                            0.035, // Responsive font size (was 14)
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
                  height: screenHeight * 0.02,
                ), // Responsive spacing (was 16)
                Container(
                  padding: EdgeInsets.all(
                    screenWidth * 0.04,
                  ), // Responsive padding (was 16)
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      screenWidth * 0.04,
                    ), // Responsive border radius (was 16)
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade100,
                        blurRadius: screenWidth * 0.015,
                      ), // Responsive blur radius (was 6)
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.00875,
                      ), // Responsive spacing (was 7)
                      _buildPickerTile(
                        context: context, // Pass context
                        label: 'Sum Insured',
                        value: viewModel.selectedSumInsured,
                        onTap: () {
                          _showCupertinoPickerModal(
                            context: context,
                            title: 'Sum Insured',
                            options: [
                              '₹ 5 lakhs',
                              '₹ 7.5 lakhs',
                              '₹ 10 lakhs',
                              '₹ 15 lakhs',
                              '₹ 20 lakhs',
                              '₹ 25 lakhs',
                              '₹ 50 lakhs',
                              '₹ 100 lakhs',
                            ],
                            selectedValue: viewModel.selectedSumInsured,
                            onValueSelected: (val) =>
                                viewModel.setSelectedSumInsured(val),
                          );
                        },
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ), // Responsive spacing (was 16)
                      _buildPickerTile(
                        context: context, // Pass context
                        label: 'Plan Type',
                        value: viewModel.selectedPlanType,
                        onTap: () {
                          _showCupertinoPickerModal(
                            context: context,
                            title: 'Plan Type',
                            options: ['Platinum +', 'Titanium +', 'Bronze +'],
                            selectedValue: viewModel.selectedPlanType,
                            onValueSelected: (val) =>
                                viewModel.setSelectedPlanType(val),
                          );
                        },
                      ),
                      SizedBox(
                        height: screenHeight * 0.00875,
                      ), // Responsive spacing (was 7)
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _openKnowMoreSheet(context);
                            },
                            child: Text(
                              "Know more",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                                fontSize:
                                    screenWidth * 0.035, // Responsive font size
                              ),
                            ),
                          ),
                          Text(
                            " about Plan Type",
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                            ), // Responsive font size
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01375,
                ), // Responsive spacing (was 11)
                // TabBar
                NivaBupaFlexibleTabWidget(),
                // Expanded Container with Segmented Tab Control
                SizedBox(
                  height: screenHeight * 0.01375,
                ), // Responsive spacing (was 11)
                Row(
                  children: [
                    Text(
                      "Need Assistance?",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:
                            screenWidth *
                            0.045, // Responsive font size (was 18)
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.0075,
                ), // Responsive spacing (was 6)
                Text(
                  "We are always up to help you protect your wealth.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                  ), // Responsive font size (was 16)
                ),
                SizedBox(
                  height: screenHeight * 0.015,
                ), // Responsive spacing (was 12)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => SetUpCallScreen(),
                        //   ),
                        // );
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.call_outlined,
                            size:
                                screenWidth *
                                0.04, // Responsive icon size (was 16)
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: screenWidth * 0.01,
                          ), // Responsive spacing (was 4)
                          Text(
                            "Set up call",
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue,
                              fontSize:
                                  screenWidth * 0.035, // Responsive font size
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.04,
                    ), // Responsive spacing (was 16)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChatScreen()),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.chat_bubble_outline,
                            size:
                                screenWidth *
                                0.04, // Responsive icon size (was 16)
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: screenWidth * 0.01,
                          ), // Responsive spacing (was 4)
                          Text(
                            "Chat with us",
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue,
                              fontSize:
                                  screenWidth * 0.035, // Responsive font size
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ), // Responsive spacing (was 40)
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: Colors.white,
          child: Container(
            height: screenHeight * 0.02625, // Responsive height (was 21)
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Premium (incl. GST)",
                      style: TextStyle(
                        fontSize:
                            screenWidth * 0.04, // Responsive font size (was 12)
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ), // Responsive spacing (was 4)
                    Text(
                      "₹9,140",
                      style: TextStyle(
                        fontSize:
                            screenWidth *
                            0.044, // Responsive font size (was 18)
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Call API
                    Navigator.pushNamed(
                      context,
                      RouteNames.nivaBupaDurationScreen,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        screenWidth * 0.02,
                      ), // Responsive border radius (was 8)
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          screenWidth * 0.085, // Responsive padding (was 34)
                      vertical:
                          screenHeight * 0.0175, // Responsive padding (was 14)
                    ),
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                    ), // Responsive font size
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:insurance/features/health/buy_new_policy/company/niva_bupa/view/niva_bupa_tab_screen.dart';
// import 'package:provider/provider.dart';
// import 'package:share_plus/share_plus.dart';
//
// import '../../../../../chatbot/chat_screen.dart';
// import '../viewmodel/niva_bupa_viewmodel.dart';
//
// class NivaBupaScreen extends StatelessWidget {
//   const NivaBupaScreen({super.key});
//
//   void _showCupertinoPickerModal({
//     required BuildContext context,
//     required String title,
//     required List<String> options,
//     required String selectedValue,
//     required Function(String) onValueSelected,
//   }) {
//     String tempSelected = selectedValue;
//
//     showCupertinoModalPopup(
//       context: context,
//       builder: (_) => Container(
//         height: 330,
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             // Top bar with title and close icon
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
//               child: Column(
//                 // mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Text(
//                           title,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                             color: Colors.black, // Avoid red default
//                             decoration:
//                                 TextDecoration.none, // Remove any underline
//                           ),
//                           overflow: TextOverflow.ellipsis, // Prevent overflow
//                           maxLines: 1,
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () => Navigator.pop(context),
//                         child: const Icon(Icons.close, size: 20),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 6),
//                   Text(
//                     tempSelected,
//                     style: const TextStyle(
//                       fontSize: 14,
//                       color: Colors.black54,
//                       decoration: TextDecoration
//                           .none, // Already removed, confirmed working
//                     ),
//                     overflow: TextOverflow.ellipsis, // Prevent overflow
//                     maxLines: 1,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: CupertinoPicker(
//                 scrollController: FixedExtentScrollController(
//                   initialItem: options.indexOf(selectedValue),
//                 ),
//                 itemExtent: 42,
//                 onSelectedItemChanged: (index) {
//                   tempSelected = options[index];
//                 },
//                 children: options
//                     .map(
//                       (e) => Center(
//                         child: Text(
//                           e,
//                           overflow: TextOverflow.ellipsis, // Prevent overflow
//                           maxLines: 1,
//                         ),
//                       ),
//                     )
//                     .toList(),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//               child: SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF548ADD),
//                     foregroundColor: Colors.white,
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   onPressed: () {
//                     onValueSelected(tempSelected);
//                     //
//                     print("✅ $title selected: $tempSelected");
//                     // post api
//                     Navigator.pop(context);
//                   },
//                   child: const Text("Save", style: TextStyle(fontSize: 16)),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildPickerTile({
//     required String label,
//     required String value,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: InputDecorator(
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(value, style: const TextStyle(fontSize: 16)),
//             const Icon(Icons.keyboard_arrow_down, color: Colors.black),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _openKnowMoreSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.white,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//       ),
//       builder: (_) => Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Plan Type Details',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 12),
//             _detailRow(
//               'Bronze +',
//               'Carry forward the balance sum insured up to 3 times of base cover',
//             ),
//             _detailRow(
//               'Platinum +',
//               'Carry forward the balance sum insured up to 5 times of base cover',
//             ),
//             _detailRow(
//               'Titanium +',
//               'Carry forward the balance sum insured up to 10 times of base cover',
//             ),
//             Align(
//               alignment: Alignment.centerRight,
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: const Text(
//                   'Close',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _detailRow(String title, String desc) => Padding(
//     padding: const EdgeInsets.symmetric(vertical: 8),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
//         ),
//         const SizedBox(height: 4),
//         Text(desc, style: const TextStyle(fontSize: 14, color: Colors.grey)),
//       ],
//     ),
//   );
//
//   void _shareAppUrl() {
//     Share.share('Check out this plan on web: https://example.com');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => NivaBupaViewModel(),
//       child: Scaffold(
//         backgroundColor: Colors.grey.shade100,
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(80),
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               border: Border(bottom: BorderSide(color: Colors.black12)),
//             ),
//             child: SafeArea(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     icon: const Icon(
//                       Icons.arrow_back_ios_new,
//                       color: Colors.black,
//                     ),
//                     onPressed: () => Navigator.pop(context),
//                   ),
//                   const Expanded(
//                     child: Text(
//                       "Customize your Plan",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   TextButton.icon(
//                     onPressed: _shareAppUrl,
//                     icon: const Icon(
//                       Icons.language,
//                       color: Colors.blueGrey,
//                       size: 16,
//                     ),
//                     label: const Text(
//                       'View on Web',
//                       style: TextStyle(color: Colors.blueGrey, fontSize: 13),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         body: Consumer<NivaBupaViewModel>(
//           builder: (context, viewModel, child) => SingleChildScrollView(
//             padding: const EdgeInsets.all(14),
//             child: Column(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(24),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(16),
//                     boxShadow: [
//                       BoxShadow(color: Colors.grey.shade100, blurRadius: 6),
//                     ],
//                   ),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Image.asset(
//                                   "assets/images/niva_bupa.png",
//                                   width: 36,
//                                 ),
//                                 SizedBox(width: 21),
//                                 const Text(
//                                   "Niva Bupa ReAssure 2.0",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 8),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: const [
//                                     Text(
//                                       "Members",
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 12,
//                                       ),
//                                     ),
//                                     SizedBox(height: 2),
//                                     Text(
//                                       "Self",
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   children: const [
//                                     Text(
//                                       "Term",
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 12,
//                                       ),
//                                     ),
//                                     SizedBox(height: 2),
//                                     Text(
//                                       "1 year",
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(16),
//                     boxShadow: [
//                       BoxShadow(color: Colors.grey.shade100, blurRadius: 6),
//                     ],
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 7),
//                       _buildPickerTile(
//                         label: 'Sum Insured',
//                         value: viewModel.selectedSumInsured,
//                         onTap: () {
//                           _showCupertinoPickerModal(
//                             context: context,
//                             title: 'Sum Insured',
//                             options: [
//                               '₹ 5 lakhs',
//                               '₹ 7.5 lakhs',
//                               '₹ 10 lakhs',
//                               '₹ 15 lakhs',
//                               '₹ 20 lakhs',
//                               '₹ 25 lakhs',
//                               '₹ 50 lakhs',
//                               '₹ 100 lakhs',
//                             ],
//                             selectedValue: viewModel.selectedSumInsured,
//                             onValueSelected: (val) =>
//                                 viewModel.setSelectedSumInsured(val),
//                           );
//                         },
//                       ),
//                       const SizedBox(height: 16),
//                       _buildPickerTile(
//                         label: 'Plan Type',
//                         value: viewModel.selectedPlanType,
//                         onTap: () {
//                           _showCupertinoPickerModal(
//                             context: context,
//                             title: 'Plan Type',
//                             options: ['Platinum +', 'Titanium +', 'Bronze +'],
//                             selectedValue: viewModel.selectedPlanType,
//                             onValueSelected: (val) =>
//                                 viewModel.setSelectedPlanType(val),
//                           );
//                         },
//                       ),
//                       const SizedBox(height: 7),
//                       Row(
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               _openKnowMoreSheet(context);
//                             },
//                             child: const Text(
//                               "Know more",
//                               style: TextStyle(
//                                 color: Colors.blue,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                           const Text(" about Plan Type"),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 11),
//                 // TabBar
//                 FlexibleTabWidget(),
//                 // Expanded Container with Segmented Tab Control
//                 SizedBox(height: 11),
//                 Row(
//                   children: [
//                     const Text(
//                       "Need Assistance?",
//                       textAlign: TextAlign.start,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 6),
//                 const Text(
//                   "We are always up to help you protect your wealth.",
//                   textAlign: TextAlign.start,
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 const SizedBox(height: 12),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //     builder: (context) => SetUpCallScreen(),
//                         //   ),
//                         // );
//                       },
//                       child: Row(
//                         children: const [
//                           Icon(
//                             Icons.call_outlined,
//                             size: 16,
//                             color: Colors.blue,
//                           ),
//                           SizedBox(width: 4),
//                           Text(
//                             "Set up call",
//                             style: TextStyle(
//                               color: Colors.blue,
//                               decoration: TextDecoration.underline,
//                               decorationColor: Colors.blue,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => ChatScreen()),
//                         );
//                       },
//                       child: Row(
//                         children: const [
//                           Icon(
//                             Icons.chat_bubble_outline,
//                             size: 16,
//                             color: Colors.blue,
//                           ),
//                           SizedBox(width: 4),
//                           Text(
//                             "Chat with us",
//                             style: TextStyle(
//                               color: Colors.blue,
//                               decoration: TextDecoration.underline,
//                               decorationColor: Colors.blue,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 40),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//         bottomNavigationBar: BottomAppBar(
//           elevation: 0,
//           color: Colors.white,
//           child: Container(
//             height: 21,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Premium (incl. GST)",
//                       style: TextStyle(fontSize: 12, color: Colors.grey),
//                     ),
//                     SizedBox(height: 4),
//                     Text(
//                       "₹9,140",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.blue,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Call API here
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     foregroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 34,
//                       vertical: 14,
//                     ),
//                   ),
//                   child: const Text("Continue"),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
