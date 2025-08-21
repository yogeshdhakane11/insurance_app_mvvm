import 'package:flutter/material.dart';
import 'package:insurance/routes/routes_name.dart';

import '../../health/health_claim_center/health_claim_center.dart';

class HealthInsuranceHealthClaimCard extends StatelessWidget {
  const HealthInsuranceHealthClaimCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildCard(
      context,
      icon: Icons.verified_user,
      label: "Health claim centre",
      color: Colors.blue,
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
  }) {
    // Get screen size for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.healthClaimCenterScreen);
      },
      child: Container(
        height: screenHeight * 0.12, // Dynamic height based on screen height
        padding: EdgeInsets.all(
          screenWidth * 0.03,
        ), // Dynamic padding based on screen width
        width: double.infinity, // Ensure proper width for centering
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size:
                  screenWidth * 0.07, // Dynamic icon size based on screen width
            ),
            Text(
              label,
              style: TextStyle(
                fontSize:
                    screenWidth *
                    0.04, // Dynamic font size based on screen width
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// import '../../health/health_claim_center/health_claim_center.dart';
//
// class HealthInsuranceHealthClaimCard extends StatelessWidget {
//   const HealthInsuranceHealthClaimCard({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return _buildCard(
//       context,
//       icon: Icons.verified_user,
//       label: "Health claim centre", // no need for extra space
//       color: Colors.blue,
//     );
//   }
//
//   Widget _buildCard(
//     BuildContext context, {
//     required IconData icon,
//     required String label,
//     required Color color,
//   }) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => HealthClaimCenterScreen()),
//         );
//       },
//       child: Container(
//         height: 110,
//         width: double.infinity, // ensures proper width for centering
//         padding: const EdgeInsets.all(4),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, color: color),
//             const SizedBox(height: 8),
//             Center(
//               child: Text(
//                 label,
//                 style: const TextStyle(fontSize: 14),
//                 textAlign: TextAlign.center,
//                 // softWrap: true,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
