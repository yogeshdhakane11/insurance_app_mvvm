import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../routes/routes_name.dart';

class StarRequestReceivedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.blue,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(
                screenWidth * 0.04,
              ), // Adjust padding based on screen width
              child: Text(
                'Request Received',
                style: TextStyle(
                  color: Colors.white,
                  fontSize:
                      screenWidth *
                      0.06, // Adjust font size based on screen width
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                screenWidth * 0.04,
              ), // Adjust padding based on screen width
              child: Text(
                'Your Request for Star Comprehensive plan has been successfully received. We will reach out to you soon.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize:
                      screenWidth *
                      0.04, // Adjust font size based on screen width
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(
                    screenWidth * 0.04,
                  ), // Adjust padding based on screen width
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'What\'s Next?',
                        style: TextStyle(
                          fontSize:
                              screenWidth *
                              0.05, // Adjust font size based on screen width
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ), // Adjust height based on screen height
                      _buildNextStep(
                        icon: Icons.person,
                        title: 'Share more details',
                        description:
                            'We will reach out to get more details so we can finalise the plan.',
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                      ),
                      _buildNextStep(
                        icon: Icons.favorite,
                        title: 'Answer medical questions',
                        description:
                            'We prioritize your well-being. Answer few health-related questions for optimal coverage.',
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                      ),
                      _buildNextStep(
                        icon: Icons.people,
                        title: 'Appoint nominee',
                        description:
                            'Who matters most to you? Provide nominee details to ensure your loved ones are protected.',
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, RouteNames.chatScreen);
                        },
                        child: Text('Close'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          minimumSize: Size(
                            double.infinity,
                            screenHeight * 0.06,
                          ), // Adjust button height
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNextStep({
    required IconData icon,
    required String title,
    required String description,
    required double screenWidth,
    required double screenHeight,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.02,
      ), // Adjust vertical spacing based on screen height
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blue),
          SizedBox(
            width: screenWidth * 0.03,
          ), // Adjust space between icon and text based on screen width
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:
                        screenWidth *
                        0.045, // Adjust font size based on screen width
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ), // Adjust spacing between title and description
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize:
                        screenWidth *
                        0.035, // Adjust font size based on screen width
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class RequestReceivedScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Container(
//         color: Colors.blue,
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 'Request Received',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 'Your Request for Star Comprehensive plan has been successfully received. We will reach out to you soon.',
//                 style: TextStyle(color: Colors.white, fontSize: 16),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'What\'s Next?',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       _buildNextStep(
//                         icon: Icons.person,
//                         title: 'Share more details',
//                         description:
//                             'We will reach out to get more details so we can finalise the plan.',
//                       ),
//                       _buildNextStep(
//                         icon: Icons.favorite,
//                         title: 'Answer medical questions',
//                         description:
//                             'We prioritize your well-being. Answer few health-related questions for optimal coverage.',
//                       ),
//                       _buildNextStep(
//                         icon: Icons.people,
//                         title: 'Appoint nominee',
//                         description:
//                             'Who matters most to you? Provide nominee details to ensure your loved ones are protected.',
//                       ),
//                       Spacer(),
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: Text('Close'),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           minimumSize: Size(double.infinity, 50),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNextStep({
//     required IconData icon,
//     required String title,
//     required String description,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(icon, color: Colors.blue),
//           SizedBox(width: 10),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
//                 SizedBox(height: 5),
//                 Text(description, style: TextStyle(color: Colors.grey)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
