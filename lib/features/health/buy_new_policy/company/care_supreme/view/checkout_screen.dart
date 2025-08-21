import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurance/features/health/buy_new_policy/company/care_supreme/view/payment_gateway_screen.dart';

import '../../../../../../const/app_asset.dart';
import '../../../../../../routes/routes_name.dart';
import '../../../../../../utils/url_launch.dart';

class CareSupremeCheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MediaQuery for responsive sizing
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: screenWidth * 0.055),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Checkout',
          style: TextStyle(fontSize: screenWidth * 0.044),
        ),
        actions: [
          // TextButton(
          //   onPressed: () {},
          //   child: Text(
          //     'Go To Home',
          //     style: TextStyle(
          //       color: Colors.purple,
          //       fontSize: screenWidth * 0.035,
          //     ),
          //   ),
          // ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.035),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Insurance plan details Container
              Container(
                padding: EdgeInsets.all(screenWidth * 0.0275),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(screenWidth * 0.04),
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
                                AppAsset.careLogo,
                                width: screenWidth * 0.08,
                              ),
                              SizedBox(width: screenWidth * 0.0525),
                              Text(
                                "Care Supreme",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth * 0.04,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.01),
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
                                      fontSize: screenWidth * 0.03,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.0025),
                                  Text(
                                    "1 year",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.04,
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
                                      fontSize: screenWidth * 0.03,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.0025),
                                  Text(
                                    "₹8 Lakhs",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.04,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.0225),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Proposer and Members",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: screenWidth * 0.03,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.00875),
                                  Text(
                                    "Yogesh Dhakane,20",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.04,
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

              // Price breakdown
              SizedBox(height: screenHeight * 0.0225),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.0275),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(screenWidth * 0.04),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100,
                      blurRadius: screenWidth * 0.015,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.00875),
                    Text(
                      "Price Breakdown",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: screenWidth * 0.03,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.00875),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Premium Price",
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        Text(
                          "₹10,883 ",
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Riders",
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        Text(
                          "₹ 0 ",
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total (inclusive of taxes)",
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        Text(
                          "₹10,883 ",
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01375),
                  ],
                ),
              ),

              // Nominee details
              SizedBox(height: screenHeight * 0.0225),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.035),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(screenWidth * 0.04),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100,
                      blurRadius: screenWidth * 0.015,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.005),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nominee",
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        Row(
                          children: [
                            Text(
                              "S, 0",
                              style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01375),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Relationship",
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        Text(
                          "Mother",
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.01375),
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
                        size: screenWidth * 0.055,
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Expanded(
                        child: Text(
                          "By clicking Pay Now, you are agreeing to our ",
                          style: TextStyle(fontSize: screenWidth * 0.035),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: screenWidth * 0.06),
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
                            fontSize: screenWidth * 0.035,
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
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.02, // Responsive horizontal padding
          vertical: screenHeight * 0.00, // Responsive vertical padding
        ),
        child: BottomAppBar(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Premium (incl. GST)",
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    "₹12,394",
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate
                  Navigator.pushNamed(
                    context,
                    RouteNames.careSupremePaymentGatewayScreen,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.1,
                    vertical: screenHeight * 0.0175,
                  ),
                ),
                child: Text(
                  "Pay Now",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:insurance/features/health/buy_new_policy/company/care_supreme/view/payment_gateway_screen.dart';
//
// import '../../../../../../utils/url_launch.dart';
//
// class CheckoutScreen extends StatelessWidget {
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
//         title: Text('Checkout'),
//         centerTitle: true,
//         actions: [
//           // TextButton(
//           //   onPressed: () {},
//           //   child: Text('Go To Home', style: TextStyle(color: Colors.purple)),
//           // ),
//         ],
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
//                                 "assets/images/care_logo.png", // Your logo
//                                 width: 32,
//                               ),
//                               const SizedBox(width: 21),
//                               const Text(
//                                 "Care Supreme",
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
//                                     "Proposer and Members",
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   SizedBox(height: 7),
//                                   Text(
//                                     "Yogesh Dhakane,20",
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
//                           "Premium Price",
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
//                               "S, 0",
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
