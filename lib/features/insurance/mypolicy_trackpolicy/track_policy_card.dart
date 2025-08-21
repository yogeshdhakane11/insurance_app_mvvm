import 'package:flutter/material.dart';
import '../../../routes/routes_name.dart';
import '../../track_policy/track_policy_screen.dart';

class TrackPolicyCard extends StatelessWidget {
  const TrackPolicyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => TrackPolicyTabBarScreen()),
        // );
        Navigator.pushNamed(context, RouteNames.trackPolicyScreen);
      },
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.03), // Dynamic padding
        width: screenWidth * 0.35, // Dynamic width based on screen width
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  Icons.search,
                  color: Colors.orange,
                  size: screenWidth * 0.072, // Dynamic icon size
                ),
                SizedBox(width: screenWidth * 0.02), // Dynamic spacing
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Track Policy',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:
                            screenWidth * 0.04, // Dynamic font size for title
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '0',
                          style: TextStyle(
                            fontSize:
                                screenWidth *
                                0.04, // Dynamic font size for number
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// import '../../track_policy/track_policy_screen.dart';
//
// class TrackPolicyCard extends StatelessWidget {
//   const TrackPolicyCard({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => TrackPolicyTabBar()),
//         );
//       },
//       child: Container(
//         padding: const EdgeInsets.all(11),
//         width: 140, // Adjust the width as needed
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)],
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: const [
//             Icon(Icons.search, color: Colors.orange),
//             SizedBox(height: 8),
//             Text('Track Policy', style: TextStyle(fontWeight: FontWeight.bold)),
//             Text('0', style: TextStyle(fontSize: 16)),
//           ],
//         ),
//       ),
//     );
//   }
// }
