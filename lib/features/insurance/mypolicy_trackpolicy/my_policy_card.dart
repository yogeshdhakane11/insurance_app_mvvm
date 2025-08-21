import 'package:flutter/material.dart';
import 'package:insurance/routes/routes_name.dart';
import '../../my_policy/policy_screen/my_policy_screen.dart';

class MyPolicyCard extends StatelessWidget {
  const MyPolicyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.myPolicyScreen);
      },
      child: Container(
        padding: EdgeInsets.all(
          screenWidth * 0.03,
        ), // Dynamic padding based on screen width
        width:
            screenWidth * 0.35, // Dynamic width (adjust to 35% of screen width)
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
                  Icons.shield,
                  color: Colors.blue,
                  size: screenWidth * 0.072,
                ),
                SizedBox(width: screenWidth * 0.02),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My Policy',
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
            ), // Dynamic icon size
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// import '../../my_policy/policy_screen/my_policy_screen.dart';
//
// class MyPolicyCard extends StatelessWidget {
//   const MyPolicyCard({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => PolicyScreen()),
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
//         child: const Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(Icons.shield, color: Colors.blue),
//             SizedBox(height: 8),
//             Text('My Policy', style: TextStyle(fontWeight: FontWeight.bold)),
//             Text('0', style: TextStyle(fontSize: 16)),
//           ],
//         ),
//       ),
//     );
//   }
// }
