import 'package:flutter/material.dart';

import '../../../const/app_asset.dart';
import '../../../routes/routes_name.dart';
import '../../my_policy/policy_screen/my_policy_screen.dart';

class InsuranceBannerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen size for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(
        screenWidth * 0.05,
      ), // Dynamic padding based on screen width
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, RouteNames.myPolicyScreen);
        },
        child: Container(
          width: double.infinity,
          height: screenHeight * 0.18, // Dynamic height based on screen height
          child: Image.asset(
            AppAsset.insuranceBanner, // Replace with your image path
            fit: BoxFit.cover, // Ensure the image covers the container
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// import '../../my_policy/policy_screen/my_policy_screen.dart';
//
// class InsuranceBannerCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(24),
//       child: GestureDetector(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => MyPolicyScreen()),
//           );
//         },
//         child: Container(
//           width: double.infinity,
//           height: 142, // Adjust height as needed
//           child: Image.asset(
//             "assets/images/insurance_banner.jpg", // Replace with your image path
//             fit: BoxFit.cover, // Or other BoxFit options
//           ),
//         ),
//       ),
//     );
//   }
// }
