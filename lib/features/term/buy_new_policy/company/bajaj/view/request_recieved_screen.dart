import 'package:flutter/material.dart';

import '../../../../../../routes/routes_name.dart';

class BajajRequestReceivedScreen extends StatelessWidget {
  const BajajRequestReceivedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsiveness
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
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
                fontSize: screenWidth * 0.046, // Responsive font size
              ),
            ),
            SizedBox(height: screenHeight * 0.002), // Responsive height
            Text(
              "20 years • ₹4.0L • Non-Smoker",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: screenWidth * 0.04, // Responsive font size
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // The main content of the screen is now in a SingleChildScrollView
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Blue header with icon and message
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical:
                              screenHeight *
                              0.045, // Responsive vertical padding
                          horizontal:
                              screenWidth *
                              0.06, // Responsive horizontal padding
                        ),
                        decoration: const BoxDecoration(
                          color: Color(0xFF2563EB),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.edit_note_rounded,
                              size: screenWidth * 0.053, // Responsive icon size
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: screenHeight * 0.013,
                            ), // Responsive height
                            Text(
                              "Request Received",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    screenWidth * 0.055, // Responsive font size
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.017,
                            ), // Responsive height
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize:
                                      screenWidth *
                                      0.04, // Responsive font size
                                  color: Colors.white,
                                ),
                                children: const [
                                  TextSpan(text: "Your Request for "),
                                  TextSpan(
                                    text: "\"Bajaj Allianz eTouch Life\"",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        " plan has been successfully received.\nOur advisors will contact you soon for the further process.",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Blue wave bottom using CustomPainter
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: CustomPaint(
                          size: Size(
                            screenWidth,
                            screenHeight * 0.025,
                          ), // Responsive height
                          painter: _BlueWavePainter(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.015), // Responsive height
                  // "What's Next?" section
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                    ), // Responsive horizontal padding
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "What’s Next?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                screenWidth * 0.045, // Responsive font size
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.017,
                        ), // Responsive height
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              screenWidth * 0.045,
                            ), // Responsive border radius
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.04),
                                blurRadius:
                                    screenWidth *
                                    0.015, // Responsive blur radius
                                offset: Offset(
                                  0,
                                  screenHeight * 0.0025,
                                ), // Responsive offset
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical:
                                screenHeight *
                                0.022, // Responsive vertical padding
                            horizontal:
                                screenWidth *
                                0.035, // Responsive horizontal padding
                          ),
                          child: Column(
                            children: [
                              _StepItem(
                                icon: Icons.account_circle,
                                iconColor: Colors.blue.shade700,
                                trailing: Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size:
                                      screenWidth *
                                      0.05, // Responsive icon size
                                ),
                                title: "Share more details",
                                subtitle:
                                    "Tell us more about yourself. We want to tailor this plan to fit you perfectly!",
                                showConnector: true,
                                screenWidth: screenWidth, // Pass screenWidth
                                screenHeight: screenHeight, // Pass screenHeight
                              ),
                              _StepItem(
                                icon: Icons.favorite,
                                iconColor: Colors.pink.shade400,
                                title: "Answer medical questions",
                                subtitle:
                                    "We prioritize your well-being. Answer few health-related questions for optimal coverage.",
                                showConnector: true,
                                screenWidth: screenWidth, // Pass screenWidth
                                screenHeight: screenHeight, // Pass screenHeight
                              ),
                              _StepItem(
                                icon: Icons.people,
                                iconColor: Colors.amber.shade700,
                                title: "Appoint nominee",
                                subtitle:
                                    "Who matters most to you? Provide nominee details to ensure your loved ones are protected.",
                                showConnector: true,
                                screenWidth: screenWidth, // Pass screenWidth
                                screenHeight: screenHeight, // Pass screenHeight
                              ),
                              _StepItem(
                                icon: Icons.description,
                                iconColor: Colors.amber.shade700,
                                title: "Share documents",
                                subtitle:
                                    "Keep a soft copy handy of your documents for a faster application process",
                                link: "Required Documents",
                                onLinkTap: () {
                                  // Handle required documents tap
                                },
                                showConnector: false,
                                screenWidth: screenWidth, // Pass screenWidth
                                screenHeight: screenHeight, // Pass screenHeight
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.032,
                        ), // Responsive height
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Button - fixed at the bottom
          SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                screenWidth * 0.04,
                0,
                screenWidth * 0.04,
                screenHeight * 0.02,
              ), // Responsive padding
              child: SizedBox(
                width: double.infinity,
                height: screenHeight * 0.06, // Responsive height
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2563EB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        screenWidth * 0.02,
                      ), // Responsive border radius
                    ),
                  ),
                  onPressed: () {
                    // Navigator.pop(context);
                    Navigator.pushNamed(context, RouteNames.chatScreen);
                  },
                  child: Text(
                    "Understood",
                    style: TextStyle(
                      fontSize: screenWidth * 0.045, // Responsive font size
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
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

// Custom Painter for the blue wave at the bottom of the header
class _BlueWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFFF8F9FB);
    final path = Path();

    path.lineTo(0, size.height);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height - (size.height * 0.4), // Responsive control point
      size.width * 0.5,
      size.height - (size.height * 0.4), // Responsive control point
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height,
      size.width,
      size.height - (size.height * 0.4), // Responsive control point
    );
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _StepItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Widget? trailing;
  final String title;
  final String subtitle;
  final String? link;
  final VoidCallback? onLinkTap;
  final bool showConnector;
  final double screenWidth; // Added screenWidth
  final double screenHeight; // Added screenHeight

  const _StepItem({
    required this.icon,
    required this.iconColor,
    this.trailing,
    required this.title,
    required this.subtitle,
    this.link,
    this.onLinkTap,
    this.showConnector = true,
    required this.screenWidth, // Required in constructor
    required this.screenHeight, // Required in constructor
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: link != null
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            Container(
              width: screenWidth * 0.095, // Responsive width
              height: screenWidth * 0.095, // Responsive height
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(icon, color: iconColor, size: screenWidth * 0.06),
              ), // Responsive icon size
            ),
            SizedBox(width: screenWidth * 0.035), // Responsive width
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.005,
                ), // Responsive vertical padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize:
                                screenWidth * 0.04, // Responsive font size
                          ),
                        ),
                        if (trailing != null) ...[
                          SizedBox(
                            width: screenWidth * 0.01,
                          ), // Responsive width
                          trailing!,
                        ],
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.002), // Responsive height
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035, // Responsive font size
                        color: const Color(0xFF6B7280),
                      ),
                    ),
                    if (link != null)
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenHeight * 0.005,
                        ), // Responsive top padding
                        child: GestureDetector(
                          onTap: onLinkTap,
                          child: Row(
                            children: [
                              Icon(
                                Icons.file_download_outlined,
                                color: Colors.blue,
                                size:
                                    screenWidth * 0.045, // Responsive icon size
                              ),
                              SizedBox(
                                width: screenWidth * 0.01,
                              ), // Responsive width
                              Text(
                                link!,
                                style: TextStyle(
                                  color: const Color(0xFF2563EB),
                                  decoration: TextDecoration.underline,
                                  fontSize:
                                      screenWidth *
                                      0.038, // Responsive font size
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (showConnector)
          _VerticalConnector(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
          ), // Pass screen dimensions
      ],
    );
  }
}

class _VerticalConnector extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;

  const _VerticalConnector({
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.045,
      ), // Responsive left padding
      child: Container(
        height: screenHeight * 0.035, // Responsive height
        width: screenWidth * 0.005, // Responsive width
        color: const Color(0xFFE5E7EB),
      ),
    );
  }
}
