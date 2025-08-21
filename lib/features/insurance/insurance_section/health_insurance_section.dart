import 'package:flutter/material.dart';

import '../health_section/buy_policy_card.dart';
import '../health_section/compare_policy_card.dart';
import '../health_section/health_claim_card.dart';

class HealthInsuranceSection extends StatelessWidget {
  const HealthInsuranceSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Use LayoutBuilder to dynamically adjust layout based on available width
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth; // Get the available width
        double screenHeight = constraints.maxHeight; // Get the available height

        return Padding(
          padding: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: 0,
          ), // No bottom padding
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Health Insurance",
                  style: TextStyle(
                    fontSize: screenWidth * 0.05, // Responsive font size
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Comprehensive health insurance for peace of mind and financial protection",
                  style: TextStyle(
                    fontSize: screenWidth * 0.04, // Responsive font size
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 11),
                // Use LayoutBuilder to switch between Column or Row based on available width
                screenWidth < 100
                    ? Column(
                        children: [
                          HealthInsuranceBuyPolicyCard(),
                          SizedBox(height: 11),
                          HealthInsuranceHealthClaimCard(),
                          SizedBox(height: 11),
                          HealthInsuranceComparePolicyCard(),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: HealthInsuranceBuyPolicyCard()),
                          SizedBox(width: 16),
                          Expanded(child: HealthInsuranceHealthClaimCard()),
                          SizedBox(width: 16),
                          Expanded(child: HealthInsuranceComparePolicyCard()),
                        ],
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
//
// import '../health_section/buy_policy_card.dart';
// import '../health_section/compare_policy_card.dart';
// import '../health_section/health_claim_card.dart';
//
// class HealthInsuranceSection extends StatelessWidget {
//   const HealthInsuranceSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       // padding: const EdgeInsets.all(16),
//       padding: const EdgeInsets.only(
//         top: 16,
//         left: 16,
//         right: 16,
//         bottom: 0,
//       ), // No bottom padding
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 12),
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.shade200,
//               blurRadius: 8,
//               offset: const Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Health Insurance",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//             const SizedBox(height: 4),
//             const Text(
//               "Comprehensive health insurance for peace of mind and financial protection",
//               style: TextStyle(fontSize: 14, color: Colors.black54),
//             ),
//             const SizedBox(height: 11),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(child: HealthInsuranceBuyPolicyCard()),
//                 SizedBox(width: 11),
//                 Expanded(child: HealthInsuranceHealthClaimCard()),
//                 SizedBox(width: 11),
//                 Expanded(child: HealthInsuranceComparePolicyCard()),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
