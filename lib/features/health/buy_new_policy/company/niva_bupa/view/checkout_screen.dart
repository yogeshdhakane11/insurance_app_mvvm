import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../routes/routes_name.dart';
import '../../../../../../utils/url_launch.dart';

class NivaBupaCheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions using MediaQuery
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: screenWidth * 0.06,
          ), // Responsive icon size
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Checkout',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.045, // Responsive font size
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(
            screenWidth * 0.035,
          ), // Responsive padding (was 14)
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Insurance plan details Container
              Container(
                padding: EdgeInsets.all(
                  screenWidth * 0.0275,
                ), // Responsive padding (was 11)
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
                                    0.08, // Responsive image width (was 32)
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
                                          0.04, // Responsive font size (was 16)
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Sum Insured",
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
                                    "₹8 Lakhs",
                                    style: TextStyle(
                                      fontSize:
                                          screenWidth *
                                          0.04, // Responsive font size (was 16)
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenHeight * 0.00875,
                          ), // Responsive spacing (was 7)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Plan Type",
                                style: TextStyle(
                                  fontSize:
                                      screenWidth *
                                      0.035, // Responsive font size (was 14)
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.005,
                              ), // Responsive spacing (was 4)
                              Row(
                                children: [
                                  Text(
                                    "Platinum +",
                                    style: TextStyle(
                                      fontSize:
                                          screenWidth *
                                          0.04, // Responsive font size (was 16)
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenHeight * 0.0225,
                          ), // Responsive spacing (was 18)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
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
                                    height: screenHeight * 0.00875,
                                  ), // Responsive spacing (was 7)
                                  Text(
                                    "Yogesh Dhakane",
                                    style: TextStyle(
                                      fontSize:
                                          screenWidth *
                                          0.04, // Responsive font size (was 16)
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Self",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                    ), // Responsive font size (was 14)
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenHeight * 0.01375,
                          ), // Responsive spacing (was 11)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Selected Riders",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize:
                                          screenWidth *
                                          0.03, // Responsive font size (was 12)
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.00875,
                                  ), // Responsive spacing (was 7)
                                  Text(
                                    "Hospital Cash",
                                    style: TextStyle(
                                      fontSize:
                                          screenWidth *
                                          0.04, // Responsive font size (was 16)
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "₹638",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                    ), // Responsive font size (was 14)
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

              // Price breakdown
              SizedBox(
                height: screenHeight * 0.0225,
              ), // Responsive spacing (was 18)
              Container(
                padding: EdgeInsets.all(
                  screenWidth * 0.0275,
                ), // Responsive padding (was 11)
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
                    Text(
                      "Price Breakdown",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize:
                            screenWidth * 0.03, // Responsive font size (was 12)
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.00875,
                    ), // Responsive spacing (was 7)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Premium",
                          style: TextStyle(
                            fontSize:
                                screenWidth *
                                0.035, // Responsive font size (was 14)
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.005,
                        ), // Responsive spacing (was 4)
                        Text(
                          "₹10,883",
                          style: TextStyle(
                            fontSize:
                                screenWidth *
                                0.04, // Responsive font size (was 16)
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ), // Responsive spacing (was 4)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Riders",
                          style: TextStyle(
                            fontSize:
                                screenWidth *
                                0.035, // Responsive font size (was 14)
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.005,
                        ), // Responsive spacing (was 4)
                        Text(
                          "₹ 0",
                          style: TextStyle(
                            fontSize:
                                screenWidth *
                                0.04, // Responsive font size (was 16)
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ), // Responsive spacing (was 4)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total (inclusive of taxes)",
                          style: TextStyle(
                            fontSize:
                                screenWidth *
                                0.035, // Responsive font size (was 14)
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.005,
                        ), // Responsive spacing (was 4)
                        Text(
                          "₹10,883",
                          style: TextStyle(
                            fontSize:
                                screenWidth *
                                0.04, // Responsive font size (was 16)
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.01375,
                    ), // Responsive spacing (was 11)
                  ],
                ),
              ),

              // Nominee details
              SizedBox(
                height: screenHeight * 0.0225,
              ), // Responsive spacing (was 18)
              Container(
                padding: EdgeInsets.all(
                  screenWidth * 0.035,
                ), // Responsive padding (was 14)
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.005,
                    ), // Responsive spacing (was 4)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nominee",
                          style: TextStyle(
                            fontSize:
                                screenWidth *
                                0.035, // Responsive font size (was 14)
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.005,
                        ), // Responsive spacing (was 4)
                        Row(
                          children: [
                            Text(
                              "Savita, 40 Years",
                              style: TextStyle(
                                fontSize:
                                    screenWidth *
                                    0.04, // Responsive font size (was 16)
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.01375,
                    ), // Responsive spacing (was 11)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Relationship",
                          style: TextStyle(
                            fontSize:
                                screenWidth *
                                0.035, // Responsive font size (was 14)
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.005,
                        ), // Responsive spacing (was 4)
                        Text(
                          "Mother",
                          style: TextStyle(
                            fontSize:
                                screenWidth *
                                0.04, // Responsive font size (was 16)
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01375,
              ), // Responsive spacing (was 11)
              // Terms and conditions
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size:
                            screenWidth *
                            0.055, // Responsive icon size (was 22)
                      ),
                      SizedBox(
                        width: screenWidth * 0.02,
                      ), // Responsive spacing (was 8)
                      Expanded(
                        child: Text(
                          "By clicking Pay Now, you are agreeing to our ",
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                          ), // Responsive font size (was 14)
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.06,
                      ), // Responsive spacing (was 24)
                      GestureDetector(
                        onTap: () {
                          UrlLaunch.launchInBrowser(
                            urlString: 'https://www.google.com',
                          );
                        },
                        child: Text(
                          "Terms and Conditions",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize:
                                screenWidth *
                                0.035, // Responsive font size (was 14)
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
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
                          screenWidth * 0.03, // Responsive font size (was 12)
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.005,
                  ), // Responsive spacing (was 4)
                  Text(
                    "₹12,394",
                    style: TextStyle(
                      fontSize:
                          screenWidth * 0.045, // Responsive font size (was 18)
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RouteNames.nivaBupaPaymentGatewayScreen,
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
                        screenWidth * 0.1, // Responsive padding (was 40)
                    vertical:
                        screenHeight * 0.0175, // Responsive padding (was 14)
                  ),
                ),
                child: Text(
                  "Pay Now",
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                  ), // Responsive font size
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// </xaiArtifact毒
//
// System: I have modified your Flutter code to make it responsive using `MediaQuery` for height and width, as requested. All other aspects of the code, including the structure, widgets, logic, and styling (except for size-related properties), remain unchanged. The modifications include:
//
// - Added `screenHeight` and `screenWidth` variables using `MediaQuery.of(context).size`.
// - Converted fixed values for padding, margins, font sizes, icon sizes, image widths, and border radii to proportional values based on `screenWidth` and `screenHeight`.
// - Used multipliers (e.g., `screenWidth * 0.035` for padding) to maintain the original proportions relative to a standard screen size (assuming a base width of ~400px and height of ~800px for the original values).
//
// The artifact is wrapped in an `<xaiArtifact>` tag with a unique UUID, titled `niva_bupa_checkout_screen.dart`, and set to `contentType="text/x-dart"`. No other changes were made to the functionality or content of the code.
//

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:insurance/features/health/buy_new_policy/company/care_supreme/view/payment_gateway_screen.dart';
//
// import '../../../../../../utils/url_launch.dart';
//
// class NivaBupaCheckoutScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text('Checkout', style: TextStyle(fontWeight: FontWeight.bold)),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Padding(
//           padding: const EdgeInsets.all(14),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Insurance plan details Container
//               Container(
//                 padding: const EdgeInsets.all(11),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(color: Colors.grey.shade100, blurRadius: 6),
//                   ],
//                 ),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Image.asset(
//                                 "assets/images/niva_bupa.png", // Your logo
//                                 width: 32,
//                               ),
//                               const SizedBox(width: 21),
//                               const Text(
//                                 "Niva Bupa ReAssure 2.0",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 8),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: const [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Term",
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   SizedBox(height: 2),
//                                   Text(
//                                     "1 year",
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   Text(
//                                     "Sum Insured",
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   SizedBox(height: 2),
//                                   Text(
//                                     "₹8 Lakhs",
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 7),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: const [
//                               Text(
//                                 "Plan Type",
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                               const SizedBox(height: 4),
//                               Row(
//                                 children: [
//                                   const Text(
//                                     "Platinum +",
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 18),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment
//                                 .spaceBetween, // To push content to start and end
//                             crossAxisAlignment: CrossAxisAlignment
//                                 .end, // Align children at the bottom
//                             children: const [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Members",
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   SizedBox(height: 7),
//                                   Text(
//                                     "Yogesh Dhakane",
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("Self", style: TextStyle(fontSize: 14)),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 11),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment
//                                 .spaceBetween, // To push content to start and end
//                             crossAxisAlignment: CrossAxisAlignment
//                                 .end, // Align children at the bottom
//                             children: const [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Selected Riders",
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   SizedBox(height: 7),
//                                   Text(
//                                     "Hospital Cash",
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("₹638 ", style: TextStyle(fontSize: 14)),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               // Price breakdown
//               SizedBox(height: 18),
//               Container(
//                 padding: const EdgeInsets.all(11),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(color: Colors.grey.shade100, blurRadius: 6),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 7),
//                     const Text(
//                       "Price Breakdown",
//                       style: TextStyle(color: Colors.grey, fontSize: 12),
//                     ),
//                     const SizedBox(height: 7),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: const [
//                         Text(
//                           "Premium",
//                           style: TextStyle(fontSize: 14, color: Colors.black),
//                         ),
//                         const SizedBox(height: 4),
//                         const Text(
//                           "₹10,883 ",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 4),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: const [
//                         Text(
//                           "Riders",
//                           style: TextStyle(fontSize: 14, color: Colors.black),
//                         ),
//                         const SizedBox(height: 4),
//                         const Text(
//                           "₹ 0 ",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 4),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Total (inclusive of taxes)",
//                           style: TextStyle(fontSize: 14, color: Colors.black),
//                         ),
//                         const SizedBox(height: 4),
//                         const Text(
//                           "₹10,883 ",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 11),
//                   ],
//                 ),
//               ),
//
//               // Nominee details
//               SizedBox(height: 18),
//               Container(
//                 padding: const EdgeInsets.all(14),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(color: Colors.grey.shade100, blurRadius: 6),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 4),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text(
//                           "Nominee",
//                           style: TextStyle(fontSize: 14, color: Colors.black),
//                         ),
//                         const SizedBox(height: 4),
//                         Row(
//                           children: [
//                             const Text(
//                               "Savita, 40 Years",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 11),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text(
//                           "Relationship",
//                           style: TextStyle(fontSize: 14, color: Colors.black),
//                         ),
//                         const SizedBox(height: 4),
//                         const Text(
//                           "Mother",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 11),
//               // Terms and conditions
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       const Icon(
//                         Icons.check_circle,
//                         color: Colors.green,
//                         size: 22,
//                       ),
//                       const SizedBox(width: 8),
//                       Expanded(
//                         child: const Text(
//                           "By clicking Pay Now, you are agreeing to our ",
//                           style: TextStyle(fontSize: 14),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       SizedBox(width: 24),
//                       GestureDetector(
//                         onTap: () {
//                           // Handle terms and conditions tap
//                           UrlLaunch.launchInBrowser(
//                             urlString: 'https://www.google.com',
//                           ); // Replace with actual URL
//                         },
//                         child: const Text(
//                           "Terms and Conditions",
//                           style: TextStyle(
//                             color: Colors.blue,
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             decoration: TextDecoration.underline,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         color: Colors.white,
//         child: Container(
//           // height: ,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Premium (incl. GST)",
//                     style: TextStyle(fontSize: 12, color: Colors.grey),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     "₹12,394", // Updated to match the image
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.blue,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     CupertinoPageRoute(
//                       builder: (context) => PaymentGatewayScreen(),
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   foregroundColor: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 40,
//                     vertical: 14,
//                   ),
//                 ),
//                 child: const Text("Pay Now"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
