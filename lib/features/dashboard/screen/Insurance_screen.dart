import 'package:flutter/material.dart';
import '../../insurance/insurance_section/assistance_support_section.dart';
import '../../insurance/insurance_section/expert_advice_section.dart';
import '../../insurance/insurance_section/health_insurance_section.dart';
import '../../insurance/insurance_section/tearm_insurance_section.dart';
import '../../insurance/mypolicy_trackpolicy/my_policy_card.dart';
import '../../insurance/mypolicy_trackpolicy/track_policy_card.dart';
import '../../insurance/top_banner/insurance_top_image.dart';

class Insurance extends StatelessWidget {
  const Insurance({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // backgroundColor: Colors.blue.shade50,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // Insurance banner
            InsuranceBannerCard(),

            // Row with MyPolicyCard and TrackPolicyCard
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
              ), // Responsive padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: MyPolicyCard()),
                  SizedBox(
                    width: screenWidth * 0.05,
                  ), // Responsive space between cards
                  Expanded(child: TrackPolicyCard()),
                ],
              ),
            ),

            // Sections below
            // SizedBox(
            //   height: screenHeight * 0.01,
            // ), // Responsive spacing between sections
            HealthInsuranceSection(),
            TearmInsuranceSection(),
            ExpertAdviceSectionScreen(),
            AssistanceSupportSectionScreen(),
          ],
        ),
      ),
    );
  }
}
