import 'package:flutter/material.dart';
import '../model/models.dart'; // Ensure this path is correct for your project structure

class InsuranceCard extends StatelessWidget {
  final InsurancePlan plan; // The insurance plan data to display in the card
  final VoidCallback onTap; // Callback function when the card is tapped

  // Constructor for the InsuranceCard widget
  const InsuranceCard({super.key, required this.plan, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height using MediaQuery for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Card(
      elevation: 0.2,
      shadowColor: Colors.white, // Shadow color set to white
      color: Colors.white, // Set the background color of the card to white
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: EdgeInsets.all(
            screenWidth * 0.03,
          ), // 3% of screen width for padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Row 1: Buy Now button (conditional) and Company Logo ---
              Row(
                children: [
                  // Conditionally display the "Buy Now" button
                  if (plan.showBuyNow) // Only show if showBuyNow is true
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            screenWidth *
                            0.04, // Adjust padding based on screen width
                        vertical:
                            screenHeight *
                            0.015, // Adjust padding based on screen height
                      ),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[50],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.star, color: Colors.deepPurple, size: 16),
                          SizedBox(width: 4),
                          Text(
                            'Buy Now',
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12), // Space below the first row
              // --- Row 2: Plan Name and Premium ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Company Logo (Image from network or fallback icon)
                        Image.network(
                          plan.companyLogo,
                          width:
                              screenWidth *
                              0.1, // Adjust image width to 10% of screen width
                          height:
                              screenHeight *
                              0.05, // Adjust image height to 5% of screen height
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(
                                Icons.business,
                                size: 20,
                                color: Colors.grey,
                              ),
                        ),
                        Text(
                          plan.planName,
                          style: TextStyle(
                            fontSize:
                                screenWidth *
                                0.04, // Scale font size based on screen width
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Premium (inc of taxes)',
                        style: TextStyle(
                          fontSize:
                              screenWidth *
                              0.03, // Scale font size based on screen width
                          color: Colors.grey[600],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            plan.premium,
                            style: TextStyle(
                              fontSize:
                                  screenWidth *
                                  0.04, // Scale font size based on screen width
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 4),

              // --- Divider line before Claim Settlement Ratio ---
              Divider(
                color: Colors.grey[300], // Light grey color
                thickness: 1, // Thin line
                height: 20, // Space above and below the line
                indent: 0, // No indent from left
                endIndent: 0, // No indent from right
              ),

              // --- Row 3: Claim Settlement Ratio and Max Cover Age ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Claim Settlement Ratio',
                        style: TextStyle(
                          fontSize:
                              screenWidth *
                              0.03, // Scale font size based on screen width
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        plan.claimSettlementRatio,
                        style: TextStyle(
                          fontSize:
                              screenWidth *
                              0.04, // Scale font size based on screen width
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Max cover till age',
                        style: TextStyle(
                          fontSize:
                              screenWidth *
                              0.03, // Scale font size based on screen width
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        plan.maxCoverTillAge,
                        style: TextStyle(
                          fontSize:
                              screenWidth *
                              0.04, // Scale font size based on screen width
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // --- Benefits Section ---
              if (plan.benefits.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: plan.benefits
                      .map(
                        (benefit) => Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.circle,
                                size: 6,
                                color: Colors.black,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  benefit,
                                  style: TextStyle(
                                    fontSize:
                                        screenWidth *
                                        0.035, // Adjust font size based on screen width
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              const SizedBox(height: 8),

              // --- Add-ons Section ---
              if (plan.addons.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add-Ons',
                      style: TextStyle(
                        fontSize:
                            screenWidth *
                            0.03, // Adjust font size based on screen width
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      plan.addons.join(', '),
                      style: TextStyle(
                        fontSize:
                            screenWidth *
                            0.035, // Adjust font size based on screen width
                      ),
                    ),
                  ],
                ),

              // --- Discount Section ---
              if (plan.discount != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      plan.discount!,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize:
                            screenWidth *
                            0.03, // Adjust font size based on screen width
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import '../model/models.dart';
//
// class InsuranceCard extends StatelessWidget {
//   final InsurancePlan plan; // The insurance plan data to display in the card
//   final VoidCallback onTap; // Callback function when the card is tapped
//
//   // Constructor for the InsuranceCard widget_test
//   const InsuranceCard({super.key, required this.plan, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 0.2,
//       shadowColor: Colors.white, // Shadow color set to white
//       color: Colors.white, // Set the background color of the card to white
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
//       child: InkWell(
//         onTap: onTap,
//         borderRadius: BorderRadius.circular(16),
//         child: Padding(
//           // Card Size Manage using the padding before 16.0
//           // 7
//           padding: const EdgeInsets.all(11),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // --- Row 1: Buy Now button (conditional) and Company Logo ---
//               Row(
//                 // mainAxisAlignment is no longer needed here, Spacer handles alignment
//                 children: [
//                   // Conditionally display the "Buy Now" button
//                   if (plan.showBuyNow) // Only show if showBuyNow is true
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 12,
//                         vertical: 6,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.deepPurple[50],
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Row(
//                         children: const [
//                           Icon(Icons.star, color: Colors.deepPurple, size: 16),
//                           SizedBox(width: 4),
//                           Text(
//                             'Buy Now',
//                             style: TextStyle(
//                               color: Colors.deepPurple,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                 ],
//               ),
//               const SizedBox(height: 12), // Space below the first row
//               // --- Row 2: Plan Name and Premium ---
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Company Logo (Image from network or fallback icon)
//                         Image.network(
//                           plan.companyLogo,
//                           width: 40,
//                           height: 40,
//                           errorBuilder: (context, error, stackTrace) =>
//                               const Icon(
//                                 Icons.business,
//                                 size: 20,
//                                 color: Colors.grey,
//                               ),
//                         ),
//                         Text(
//                           plan.planName,
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         'Premium (inc of taxes)',
//                         style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             plan.premium,
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.blue,
//                             ),
//                           ),
//                           const Icon(
//                             Icons.arrow_forward_ios,
//                             size: 16,
//                             color: Colors.blue,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 4),
//
//               // --- Divider line before Claim Settlement Ratio ---
//               Divider(
//                 color: Colors.grey[300], // Light grey color
//                 thickness: 1, // Thin line
//                 height: 20, // Space above and below the line
//                 indent: 0, // No indent from left
//                 endIndent: 0, // No indent from right
//               ),
//
//               // --- Row 3: Claim Settlement Ratio and Max Cover Age ---
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Claim Settlement Ratio',
//                         style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//                       ),
//                       Text(
//                         plan.claimSettlementRatio,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         'Max cover till age',
//                         style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//                       ),
//                       Text(
//                         plan.maxCoverTillAge,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),
//
//               // --- Benefits Section ---
//               if (plan.benefits.isNotEmpty)
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: plan.benefits
//                       .map(
//                         (benefit) => Padding(
//                           padding: const EdgeInsets.only(bottom: 4.0),
//                           child: Row(
//                             children: [
//                               const Icon(
//                                 Icons.circle,
//                                 size: 6,
//                                 color: Colors.black,
//                               ),
//                               const SizedBox(width: 8),
//                               Expanded(
//                                 child: Text(
//                                   benefit,
//                                   style: const TextStyle(fontSize: 14),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       )
//                       .toList(),
//                 ),
//               const SizedBox(height: 8),
//
//               // --- Add-ons Section ---
//               if (plan.addons.isNotEmpty)
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Add-Ons',
//                       style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//                     ),
//                     Text(
//                       plan.addons.join(', '),
//                       style: const TextStyle(fontSize: 14),
//                     ),
//                   ],
//                 ),
//
//               // --- Discount Section ---
//               if (plan.discount != null)
//                 Padding(
//                   padding: const EdgeInsets.only(top: 8.0),
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 8,
//                       vertical: 4,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.green[100],
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Text(
//                       plan.discount!,
//                       style: const TextStyle(
//                         color: Colors.green,
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
