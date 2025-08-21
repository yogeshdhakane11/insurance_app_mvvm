import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../routes/routes_name.dart';
import 'benifit_screen.dart';

class SampoornaRakshaRequestReceivedScreen extends StatelessWidget {
  const SampoornaRakshaRequestReceivedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsiveness
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    // Colors
    const Color blueBg = Color(
      0xFF3477C2,
    ); // Customize this according to your theme
    const Color blueDark = Color(0xFF1451A6);
    const Color cardBg =
        Colors.white; // This color isn't directly used but kept for consistency
    const Color greyText = Color(
      0xFF888888,
    ); // This color isn't directly used but kept for consistency

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Yogesh",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: screenWidth * 0.045, // Responsive font size
              ),
            ),
            SizedBox(height: screenHeight * 0.002), // Responsive height
            Text(
              "20 years • ₹4.0L • Non-Smoker",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: screenWidth * 0.03, // Responsive font size
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Blue section
          Stack(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  top: screenHeight * 0.04, // Responsive padding
                  bottom: screenHeight * 0.035, // Responsive padding
                  left: screenWidth * 0.06, // Responsive padding
                  right: screenWidth * 0.06, // Responsive padding
                ),
                decoration: BoxDecoration(
                  color: blueBg,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      screenWidth * 0.065,
                    ), // Responsive radius
                    bottomRight: Radius.circular(
                      screenWidth * 0.065,
                    ), // Responsive radius
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(
                        screenWidth * 0.03,
                      ), // Responsive padding
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(
                          screenWidth * 0.05,
                        ), // Responsive radius
                      ),
                      child: Icon(
                        Icons.edit_note,
                        color: Colors.white,
                        size: screenWidth * 0.06, // Responsive icon size
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.025), // Responsive height
                    Text(
                      "Request Recieved",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth * 0.05, // Responsive font size
                        letterSpacing: 0.2,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.012), // Responsive height
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.038, // Responsive font size
                          height: 1.4,
                        ),
                        children: const [
                          TextSpan(text: 'Your Request for '),
                          TextSpan(
                            text: '"Sampoorna Raksha Promise"',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                ' plan has been successfully received. Our advisors will contact you soon for the further process.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Spacing
          SizedBox(height: screenHeight * 0.015), // Responsive height
          // "What's Next?" section
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.06, // Responsive padding
                      vertical: screenHeight * 0.02, // Responsive padding
                    ),
                    child: Text(
                      "What's Next?",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: screenWidth * 0.050, // Responsive font size
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.035,
                    ), // Responsive padding
                    child: Card(
                      margin: EdgeInsets.zero,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          screenWidth * 0.045,
                        ), // Responsive radius
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.04, // Responsive padding
                          vertical: screenHeight * 0.022, // Responsive padding
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Share more details
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius:
                                          screenWidth *
                                          0.055, // Responsive radius
                                      backgroundColor: const Color(0xFFD4E8FB),
                                      child: Icon(
                                        Icons.person,
                                        size:
                                            screenWidth *
                                            0.07, // Responsive icon size
                                        color: blueDark,
                                      ),
                                    ),
                                    Container(
                                      width:
                                          screenWidth *
                                          0.005, // Responsive width
                                      height:
                                          screenHeight *
                                          0.045, // Responsive height
                                      color: const Color(0xFFE8EAF0),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: screenWidth * 0.03,
                                ), // Responsive width
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: screenHeight * 0.004,
                                      ), // Responsive height
                                      Text(
                                        "Share more details",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize:
                                              screenWidth *
                                              0.04, // Responsive font size
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.002,
                                      ), // Responsive height
                                      Text(
                                        "Tell us more about yourself. We want to tailor this plan to fit you perfectly!",
                                        style: TextStyle(
                                          color: const Color(0xFF888888),
                                          fontSize:
                                              screenWidth *
                                              0.035, // Responsive font size
                                          height: 1.4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // Answer medical questions
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: screenHeight * 0.002,
                                    ), // Responsive height
                                    CircleAvatar(
                                      radius:
                                          screenWidth *
                                          0.055, // Responsive radius
                                      backgroundColor: const Color(0xFFFFE4E4),
                                      child: Icon(
                                        Icons.favorite,
                                        size:
                                            screenWidth *
                                            0.065, // Responsive icon size
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                    Container(
                                      width:
                                          screenWidth *
                                          0.005, // Responsive width
                                      height:
                                          screenHeight *
                                          0.064, // Responsive height
                                      color: const Color(0xFFE8EAF0),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: screenWidth * 0.03,
                                ), // Responsive width
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: screenHeight * 0.015,
                                      ), // Responsive height
                                      Text(
                                        "Answer medical questions",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize:
                                              screenWidth *
                                              0.04, // Responsive font size
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.002,
                                      ), // Responsive height
                                      Text(
                                        "We prioritize your well-being. Answer few health-related questions for optimal coverage.",
                                        style: TextStyle(
                                          color: const Color(0xFF888888),
                                          fontSize:
                                              screenWidth *
                                              0.035, // Responsive font size
                                          height: 1.4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // Appoint nominee
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: screenHeight * 0.002,
                                    ), // Responsive height
                                    CircleAvatar(
                                      radius:
                                          screenWidth *
                                          0.055, // Responsive radius
                                      backgroundColor: const Color(0xFFFFF3D2),
                                      child: Icon(
                                        Icons.groups,
                                        size:
                                            screenWidth *
                                            0.065, // Responsive icon size
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: screenWidth * 0.03,
                                ), // Responsive width
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: screenHeight * 0.015,
                                      ), // Responsive height
                                      Text(
                                        "Appoint nominee",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize:
                                              screenWidth *
                                              0.04, // Responsive font size
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.002,
                                      ), // Responsive height
                                      Text(
                                        "Who matters most to you? Provide nominee details to ensure your loved ones are protected.",
                                        style: TextStyle(
                                          color: const Color(0xFF888888),
                                          fontSize:
                                              screenWidth *
                                              0.035, // Responsive font size
                                          height: 1.4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom button
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.045,
              vertical: screenHeight * 0.017,
            ), // Responsive padding
            child: SizedBox(
              width: double.infinity,
              height: screenHeight * 0.06, // Responsive height
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: blueBg,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      screenWidth * 0.02,
                    ), // Responsive radius
                  ),
                ),
                onPressed: () {
                  // Navigator.pop(context);
                  Navigator.pushNamed(context, RouteNames.chatScreen);
                },
                child: Text(
                  "Understood",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidth * 0.045, // Responsive font size
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
