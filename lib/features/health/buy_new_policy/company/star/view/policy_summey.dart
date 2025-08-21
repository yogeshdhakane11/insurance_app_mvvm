import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurance/features/health/buy_new_policy/company/star/view/request_received_screen.dart';

import '../../../../../../routes/routes_name.dart';

class StarPolicySummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Policy Summary'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          screenWidth * 0.04,
        ), // Adjust padding for responsiveness
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card for policy details
            Container(
              padding: EdgeInsets.all(
                screenWidth * 0.06,
              ), // Adjust padding for responsiveness
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade100, blurRadius: 6),
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
                              "assets/images/star_logo.jpg", // Your logo
                              width:
                                  screenWidth *
                                  0.1, // Adjust image size for responsiveness
                            ),
                            const SizedBox(width: 21),
                            const Text(
                              "Star Comprehensive",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Term",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "1 year",
                                  style: TextStyle(
                                    fontSize: 14,
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
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "₹8 Lakhs",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Column(
                          children: const [
                            Text(
                              "Members",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "Self",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
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

            const SizedBox(height: 20),
            // Price Breakdown Section (same style as the card above)
            Container(
              padding: EdgeInsets.all(
                screenWidth * 0.06,
              ), // Adjust padding for responsiveness
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade100, blurRadius: 6),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Price Breakdown",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Premium Price",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "₹10,883",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total (inclusive of taxes)",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "₹10,883",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(
                      screenWidth * 0.02,
                    ), // Adjust padding for responsiveness
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      "Save upto ₹3,265 on taxes under Section 80D",
                      style: TextStyle(fontSize: 11, color: Colors.green),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          height:
              screenHeight *
              0.12, // Adjust bottom app bar height for responsiveness
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Premium (incl. GST)",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "₹12,394", // Updated to match the image
                    style: TextStyle(
                      fontSize: 18,
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
                    RouteNames.starRequestReceivedScreen,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        screenWidth *
                        0.1, // Adjust button width for responsiveness
                    vertical:
                        screenHeight *
                        0.02, // Adjust button height for responsiveness
                  ),
                ),
                child: const Text("Proceed"),
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
// import 'package:insurance/features/health/buy_new_policy/company/star/view/request_received_screen.dart';
//
// class PolicySummaryScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Policy Summary'),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Card for policy details
//             Container(
//               padding: const EdgeInsets.all(24),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16),
//                 boxShadow: [
//                   BoxShadow(color: Colors.grey.shade100, blurRadius: 6),
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Image.asset(
//                               "assets/images/star_logo.jpg", // Your logo
//                               width: 36,
//                             ),
//                             const SizedBox(width: 21),
//                             const Text(
//                               "Star Comprehensive",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 8),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: const [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Term",
//                                   style: TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                                 SizedBox(height: 2),
//                                 Text(
//                                   "1 year",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Text(
//                                   "Sum Insured",
//                                   style: TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                                 SizedBox(height: 2),
//                                 Text(
//                                   "₹8 Lakhs",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 11),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: const [
//                             Text(
//                               "Members",
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 12,
//                               ),
//                             ),
//                             SizedBox(height: 2),
//                             Text(
//                               "Self",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 20),
//             // Price Breakdown Section (same style as the card above)
//             Container(
//               padding: const EdgeInsets.all(24),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16),
//                 boxShadow: [
//                   BoxShadow(color: Colors.grey.shade100, blurRadius: 6),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "Price Breakdown",
//                     style: TextStyle(color: Colors.grey, fontSize: 12),
//                   ),
//                   const SizedBox(height: 16),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: const [
//                       Text(
//                         "Premium Price",
//                         style: TextStyle(fontSize: 14, color: Colors.black),
//                       ),
//                       const SizedBox(height: 4),
//                       const Text(
//                         "₹10,883",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Total (inclusive of taxes)",
//                         style: TextStyle(fontSize: 14, color: Colors.black),
//                       ),
//                       const SizedBox(height: 4),
//                       const Text(
//                         "₹10,883",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: Colors.green.shade50,
//                       borderRadius: BorderRadius.circular(6),
//                     ),
//                     child: const Text(
//                       "Save upto ₹3,265 on taxes under Section 80D",
//                       style: TextStyle(fontSize: 11, color: Colors.green),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         color: Colors.white,
//         child: Container(
//           height: 81,
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
//                       builder: (context) => RequestReceivedScreen(),
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
//                 child: const Text("Proceed"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
