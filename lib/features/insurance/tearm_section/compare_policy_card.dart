import 'package:flutter/material.dart';
import '../../term/buy_new_policy/term_card/view/term_plan_screen.dart';

class TearmInsuranceComparePolicyCard extends StatelessWidget {
  const TearmInsuranceComparePolicyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildCard(
      context,
      icon: Icons.balance,
      label: "Compare policies",
      color: Colors.orange,
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
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (_) => TermPlanScreen()),
        // );
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
            // SizedBox(
            //   height: screenHeight * 0.02,
            // ), // Dynamic spacing based on screen height
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
// import '../../term/buy_new_policy/term_card/view/term_plan_screen.dart';
//
// class TearmInsuranceComparePolicyCard extends StatelessWidget {
//   const TearmInsuranceComparePolicyCard({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return _buildCard(
//       context,
//       icon: Icons.balance,
//       label: "Compare policies",
//       color: Colors.orange,
//       navigateTo: const TearmInsuranceComparePolicyCard(),
//     );
//   }
//
//   Widget _buildCard(
//     BuildContext context, {
//     required IconData icon,
//     required String label,
//     required Color color,
//     required Widget navigateTo,
//   }) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => TermPlanScreen()),
//         );
//       },
//       child: Container(
//         height: 110,
//         padding: const EdgeInsets.all(12),
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
//             Text(
//               label,
//               style: const TextStyle(fontSize: 14),
//               textAlign: TextAlign.center, // optional: helps if text wraps
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
