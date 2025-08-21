import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurance/features/term/buy_new_policy/company/bajaj/view/policy_summary_screen.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../const/app_asset.dart';
import '../../../../../../routes/routes_name.dart';
import '../../../recommentation/recomentation_screen.dart';
import '../viewmodel/benifit_viewmodel.dart';

// Stateless widget
class BajajBenefitScreen extends StatelessWidget {
  BajajBenefitScreen({Key? key}) : super(key: key);

  // Dummy URLs for PDF opening
  final String policyBrochureUrl =
      "https://www.example.com/policy-brochure.pdf";
  final String documentsUrl = "https://www.example.com/documents.pdf";

  // Highlights content
  final List<String> covered = ["Terminal Illness Coverage"];
  final List<String> uncovered = [
    "Death by Suicide is not covered for the first 365 days since Policy Issuance.",
  ];

  // PDF opener
  void openPdf(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  void showTerminalIllnessBottomSheet(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(screenWidth * 0.045),
        ),
      ),
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.045,
          vertical: screenHeight * 0.0275,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Terminal Illness Coverage",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.05,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(Icons.close, size: screenWidth * 0.06),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.0075),
              Text(
                'Terminal Illness means a disease with which the Life Assured is diagnosed with and in the opinion of a Medical Practitioner and Our appointed Medical Practitioner is likely to lead to the death of the Life Assured within six (6) months from the date of such certification by the Medical Practitioner.',
                style: TextStyle(fontSize: screenWidth * 0.0380, height: 1.45),
              ),
              SizedBox(height: screenHeight * 0.015),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDownloadLink(BuildContext context, String text, String url) {
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () => openPdf(url),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.download,
            size: screenWidth * 0.045,
            color: const Color(0xFF295DC4),
          ),
          SizedBox(width: screenWidth * 0.0075),
          Text(
            text,
            style: TextStyle(
              color: const Color(0xFF295DC4),
              fontWeight: FontWeight.w600,
              fontSize: screenWidth * 0.0375,
              decoration: TextDecoration.underline,
            ),
          ),
          SizedBox(width: screenWidth * 0.02),
        ],
      ),
    );
  }

  Widget _buildUncoveredItem(
    BuildContext context,
    String title,
    String description,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.cancel, color: Colors.red, size: screenWidth * 0.05),
        SizedBox(width: screenWidth * 0.02),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.0400,
                ),
              ),
              SizedBox(height: screenHeight * 0.005),
              Text(
                description,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: screenWidth * 0.035,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) => BajajViewModel(),
      child: Consumer<BajajViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            backgroundColor: const Color(0xFFF6F8FE),
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: screenWidth * 0.055,
                ),
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
                      fontSize: screenWidth * 0.045,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.0025),
                  Text(
                    "20 years • ₹4.0L • Non-Smoker",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ],
              ),
            ),
            body: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.1),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                        vertical: screenHeight * 0.01,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Sampoorna Raksha Promise Card
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                screenWidth * 0.035,
                              ),
                            ),
                            elevation: 0,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.045,
                                vertical: screenHeight * 0.02,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      // Placeholder for logo
                                      CachedNetworkImage(
                                        imageUrl: AppAsset.bajajLogo,
                                        width: screenWidth * 0.1,
                                        height: screenHeight * 0.03,
                                        placeholder: (context, url) =>
                                            CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Icon(
                                              Icons.image,
                                              size: screenWidth * 0.06,
                                            ),
                                      ),
                                      SizedBox(width: screenWidth * 0.01),
                                      Expanded(
                                        child: Text(
                                          "Bajaj Allianz eTouch Life",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: screenWidth * 0.0442,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (_) =>
                                                TearmRecommendationScreen(),
                                          );
                                        },
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.blue.shade400,
                                          size: screenWidth * 0.05,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: screenHeight * 0.01875),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Life Cover",
                                              style: TextStyle(
                                                fontSize: screenWidth * 0.04,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            SizedBox(
                                              height: screenHeight * 0.0025,
                                            ),
                                            Text(
                                              "₹50.0L",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: screenWidth * 0.04,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Cover till Age",
                                              style: TextStyle(
                                                fontSize: screenWidth * 0.04,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            SizedBox(
                                              height: screenHeight * 0.0025,
                                            ),
                                            Text(
                                              "54 years",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: screenWidth * 0.04,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: screenHeight * 0.015),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Pay For",
                                              style: TextStyle(
                                                fontSize: screenWidth * 0.04,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            SizedBox(
                                              height: screenHeight * 0.0025,
                                            ),
                                            Text(
                                              "34 years",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: screenWidth * 0.04,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Payment Frequency",
                                              style: TextStyle(
                                                fontSize: screenWidth * 0.04,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            SizedBox(
                                              height: screenHeight * 0.0025,
                                            ),
                                            Text(
                                              "Annually",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: screenWidth * 0.04,
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
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            "Benefits Included with the Policy",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.0125),
                          // Terminal Illness Container
                          InkWell(
                            borderRadius: BorderRadius.circular(
                              screenWidth * 0.035,
                            ),
                            onTap: () =>
                                showTerminalIllnessBottomSheet(context),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  screenWidth * 0.035,
                                ),
                                border: Border.all(
                                  color: const Color(0xFFD8E1F3),
                                  width: 1,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.04,
                                vertical: screenHeight * 0.015,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.verified_user,
                                    color: const Color(0xFF269278),
                                    size: screenWidth * 0.065,
                                  ),
                                  SizedBox(width: screenWidth * 0.025),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Terminal Illness",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: screenWidth * 0.04,
                                          ),
                                        ),
                                        SizedBox(height: screenHeight * 0.0025),
                                        Text(
                                          "Protect your clients against financial struggles caused by terminal illnesses",
                                          style: TextStyle(
                                            color: const Color(0xFF444444),
                                            fontSize: screenWidth * 0.0375,
                                            height: 1.3,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.02),
                                  Icon(
                                    Icons.info_outline,
                                    color: const Color(0xFF888888),
                                    size: screenWidth * 0.06,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          // Highlights
                          Text(
                            'Highlights',
                            style: TextStyle(
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01375),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                screenWidth * 0.0375,
                              ),
                            ),
                            elevation: 0,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth * 0.04),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Covered Section
                                  Text(
                                    'Covered',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenWidth * 0.05,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                        size: screenWidth * 0.05,
                                      ),
                                      SizedBox(width: screenWidth * 0.02),
                                      Expanded(
                                        child: Text(
                                          'Terminal Illness Coverage',
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: screenWidth * 0.0400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    height: screenHeight * 0.04,
                                    thickness: 1,
                                  ),
                                  // Uncovered Section
                                  Text(
                                    'Uncovered',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenWidth * 0.05,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  // Uncovered - Suicide
                                  _buildUncoveredItem(
                                    context,
                                    'Suicide',
                                    'Suicide during first year of the policy',
                                  ),
                                  SizedBox(height: screenHeight * 0.02),
                                  // Uncovered - Accidental Death
                                  _buildUncoveredItem(
                                    context,
                                    'Accidental Death Benefit',
                                    'Deaths caused due to activities performed with Criminal Intent, consequence of activities performed under the influence of drug and alcohol.',
                                  ),
                                  SizedBox(height: screenHeight * 0.02),
                                  // Uncovered - Total & Permanent Disability
                                  _buildUncoveredItem(
                                    context,
                                    'Accidental Total and Permanent Disability',
                                    'Disability due to activities performed with Criminal Intent, consequence of activities performed under the influence of drug and alcohol.',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01375),
                          SizedBox(height: screenHeight * 0.025),
                          // Download Links
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              buildDownloadLink(
                                context,
                                "Policy Brochure",
                                policyBrochureUrl,
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  buildDownloadLink(
                                    context,
                                    "Required Document",
                                    policyBrochureUrl,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Bottom Bar
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                      vertical: screenHeight * 0.015,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Amount (inc of taxes)",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: screenWidth * 0.0325,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.0),
                              Text(
                                "₹6,162 /year",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF295DC4),
                                  fontSize: screenWidth * 0.0475,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.055,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  screenWidth * 0.02,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.075,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                RouteNames.bajajPolicySummaryScreen,
                              );
                            },
                            child: Text(
                              "Confirm",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.0425,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
