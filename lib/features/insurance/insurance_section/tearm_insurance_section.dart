import 'package:flutter/material.dart';

import '../tearm_section/buy_policy_card.dart';
import '../tearm_section/compare_policy_card.dart';
import '../tearm_section/tearm_claim_card.dart';

class TearmInsuranceSection extends StatelessWidget {
  const TearmInsuranceSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Use LayoutBuilder to dynamically adjust layout based on available width
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth; // Get the available width
        double screenHeight = constraints.maxHeight; // Get the available height

        return Padding(
          padding: EdgeInsets.only(
            top: 0,
            left: 16,
            right: 16,
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
                  "Tearm Insurance",
                  style: TextStyle(
                    fontSize: screenWidth * 0.05, // Responsive font size
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Affordable term insurance to secure your family's financial future",
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
                          TearmInsuranceBuyPolicyCard(),
                          SizedBox(height: 11),
                          TearmInsuranceHealthClaimCard(),
                          SizedBox(height: 11),
                          TearmInsuranceComparePolicyCard(),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: TearmInsuranceBuyPolicyCard()),
                          SizedBox(width: 16),
                          Expanded(child: TearmInsuranceHealthClaimCard()),
                          SizedBox(width: 16),
                          Expanded(child: TearmInsuranceComparePolicyCard()),
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
// import '../tearm_section/buy_policy_card.dart';
// import '../tearm_section/compare_policy_card.dart';
// import '../tearm_section/tearm_claim_card.dart';
//
// class TearmInsuranceSection extends StatelessWidget {
//   const TearmInsuranceSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       // padding: const EdgeInsets.all(16),
//       padding: const EdgeInsets.only(
//         top: 0,
//         left: 16,
//         right: 16,
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
//               "Tearm Insurance",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//             const SizedBox(height: 4),
//             const Text(
//               "Affordable term insurance to secure your family's finacial future",
//               style: TextStyle(fontSize: 14, color: Colors.black54),
//             ),
//             const SizedBox(height: 11),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(child: TearmInsuranceBuyPolicyCard()),
//                 SizedBox(width: 11),
//                 Expanded(child: TearmInsuranceHealthClaimCard()),
//                 SizedBox(width: 11),
//                 Expanded(child: TearmInsuranceComparePolicyCard()),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
