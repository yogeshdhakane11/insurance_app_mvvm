import 'package:flutter/material.dart';
import '../../../routes/routes_name.dart';
import '../../chatbot/chat_screen.dart';

class ExpertAdviceSectionScreen extends StatelessWidget {
  const ExpertAdviceSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.all(
        screenWidth * 0.04,
      ), // Adjust margin based on screen width
      padding: EdgeInsets.all(
        screenWidth * 0.04,
      ), // Adjust padding based on screen width
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.question_mark_rounded, color: Colors.blue),
              SizedBox(width: 8),
              Text(
                "Get Expert Insurance Advice",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "Looking for insurance consultation? Start a quick conversation...",
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16),

          // Green Button
          InkWell(
            onTap: () {
              // TODO: Navigate to HealthPlanScreen
              Navigator.pushNamed(context, RouteNames.chatScreen);
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.02, // Dynamic height padding
                horizontal: screenWidth * 0.03, // Dynamic width padding
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF43C59E), // Green
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  const Icon(Icons.health_and_safety, color: Colors.white),
                  SizedBox(width: screenWidth * 0.03), // Dynamic space
                  Expanded(
                    child: Text(
                      "I'd like to explore health plans",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.040,
                      ), // Dynamic font size
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Purple Button
          InkWell(
            onTap: () {
              // TODO: Navigate to TermInsuranceScreen
              Navigator.pushNamed(context, RouteNames.chatScreen);
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.02, // Dynamic height padding
                horizontal: screenWidth * 0.03, // Dynamic width padding
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF9287E8), // Purple
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  const Icon(Icons.shield, color: Colors.white),
                  SizedBox(width: screenWidth * 0.03), // Dynamic space
                  Expanded(
                    child: Text(
                      "I'm interested in term insurance",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.040,
                      ), // Dynamic font size
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
