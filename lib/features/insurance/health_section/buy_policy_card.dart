import 'package:flutter/material.dart';

import '../../health/buy_new_policy/health/Personalize_bottomsheet.dart';

class HealthInsuranceBuyPolicyCard extends StatelessWidget {
  HealthInsuranceBuyPolicyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildCard(
      context,
      icon: Icons.favorite,
      label: "Buy new policy",
      color: Colors.red,
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
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent, // Important for rounded corners
          builder: (BuildContext context) {
            return HealthPersonalizeScreen();
          },
        );
      },
      child: Container(
        height: screenHeight * 0.12, // Dynamic height based on screen height
        padding: EdgeInsets.all(
          screenWidth * 0.03,
        ), // Dynamic padding based on screen width
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
// import '../../health/buy_new_policy/health/Personalize_bottomsheet.dart';
//
// class HealthInsuranceBuyPolicyCard extends StatelessWidget {
//   HealthInsuranceBuyPolicyCard({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return _buildCard(
//       context,
//       icon: Icons.favorite,
//       label: "Buy new policy",
//       color: Colors.red,
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
//         showModalBottomSheet(
//           context: context,
//           isScrollControlled:
//               true, // Allows the bottom sheet to take full height if needed
//           backgroundColor: Colors.transparent, // Important for rounded corners
//           builder: (BuildContext context) {
//             return HealthPersonalizeScreen();
//           },
//         );
//       },
//       child: Container(
//         height: 110,
//         padding: const EdgeInsets.all(14),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, color: color),
//             const SizedBox(height: 4),
//             Text(
//               label,
//               style: const TextStyle(fontSize: 14),
//               textAlign: TextAlign.center,
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
