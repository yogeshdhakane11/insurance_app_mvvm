import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../const/app_asset.dart';
import '../../../../../../routes/routes_name.dart';
import '../../../recommentation/recomentation_screen.dart';
import '../viewmodel/benifit_viewmodel.dart';

// Stateless widget
class SampoornaRakshaPromiseScreen extends StatelessWidget {
  SampoornaRakshaPromiseScreen({Key? key}) : super(key: key);

  // Dummy URLs for PDF opening
  final String policyBrochureUrl =
      "https://www.example.com/policy-brochure.pdf";
  final String termsUrl = "https://www.example.com/terms.pdf";
  final String documentsUrl = "https://www.example.com/documents.pdf";

  // Add-ons options
  final List<Map<String, String>> addons = [
    {
      "title": "Accidental Death Benefit (₹51)",
      "desc": "Sum Assured to be paid when death is caused by Accident.",
    },
    {
      "title": "Accidental Total and Permanent Disability Benefit (₹31)",
      "desc": "Benefit provided paid when Disability is caused by Accidents",
    },
    {
      "title": "Criticare Plus Benefit (₹1,056)",
      "desc": "Benefits paid out when diagnosed with Critical Illness",
    },
    {
      "title": "Hospicare Benefit (₹349)",
      "desc": "Hospitalisation cover for Life Assured",
    },
  ];

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
          vertical: screenHeight * 0.025,
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
              SizedBox(height: screenHeight * 0.007),
              Text(
                "Terminal Illness is defined as an advanced or rapidly progressing incurable and un-correctable medical condition which, in the opinion of two (2) independent Medical Practitioners specializing in treatment of such illness, has greater than 50% chance of death of the Life Assured within 6 months of the date of diagnosis of Terminal Illness. The Company reserves the right for independent assessment of the Terminal Illness.",
                style: TextStyle(fontSize: screenWidth * 0.0375, height: 1.45),
              ),
              SizedBox(height: screenHeight * 0.015),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAddOnsTab(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: List.generate(addons.length, (i) {
        final item = addons[i];
        return Container(
          margin: EdgeInsets.only(bottom: screenHeight * 0.015),
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.035,
            vertical: screenHeight * 0.0175,
          ),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(screenWidth * 0.035),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: screenWidth * 0.01,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item["title"]!,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF295DC4),
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.0035),
                    Text(
                      item["desc"]!,
                      style: TextStyle(
                        color: const Color(0xFF757575),
                        fontSize: screenWidth * 0.035,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: screenWidth * 0.02),
              Icon(
                Icons.radio_button_unchecked,
                color: const Color(0xFFBDC6D7),
                size: screenWidth * 0.06,
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget buildHighlightsTab(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight * 0.007),
        Text(
          "Covered",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: screenWidth * 0.04,
          ),
        ),
        SizedBox(height: screenHeight * 0.005),
        ...covered.map(
          (e) => Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: screenWidth * 0.05,
              ),
              SizedBox(width: screenWidth * 0.015),
              Expanded(
                child: Text(
                  e,
                  style: TextStyle(fontSize: screenWidth * 0.0375),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: screenHeight * 0.0125),
        Text(
          "Uncovered",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: screenWidth * 0.04,
          ),
        ),
        SizedBox(height: screenHeight * 0.005),
        ...uncovered.map(
          (e) => Row(
            children: [
              Icon(Icons.cancel, color: Colors.red, size: screenWidth * 0.05),
              SizedBox(width: screenWidth * 0.015),
              Expanded(
                child: Text(
                  e,
                  style: TextStyle(fontSize: screenWidth * 0.0375),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTabBar(
    BuildContext context,
    SampoornaRakshaPromiseViewModel viewModel,
  ) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(screenWidth * 0.035),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(screenWidth * 0.035),
              onTap: () => viewModel.setTabIndex(0),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.0125),
                decoration: BoxDecoration(
                  color: viewModel.tabIndex == 0
                      ? const Color(0xFFD2DCF8)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(screenWidth * 0.035),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Add - ons",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: viewModel.tabIndex == 0
                        ? const Color(0xFF295DC4)
                        : const Color(0xFF757575),
                    fontSize: screenWidth * 0.04,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(screenWidth * 0.035),
              onTap: () => viewModel.setTabIndex(1),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.0125),
                decoration: BoxDecoration(
                  color: viewModel.tabIndex == 1
                      ? const Color(0xFFD2DCF8)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(screenWidth * 0.035),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Highlights",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: viewModel.tabIndex == 1
                        ? const Color(0xFF295DC4)
                        : const Color(0xFF757575),
                    fontSize: screenWidth * 0.04,
                  ),
                ),
              ),
            ),
          ),
        ],
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

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) => SampoornaRakshaPromiseViewModel(),
      child: Consumer<SampoornaRakshaPromiseViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            backgroundColor: const Color(0xFFF6F8FE),
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  // size: screenWidth * 0.055,
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
                      fontSize: screenWidth * 0.036,
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
                                        imageUrl: AppAsset.sampurnaRakshaLogo,
                                        width:
                                            screenWidth * 0.08, // Adjust width
                                        placeholder: (context, url) =>
                                            CircularProgressIndicator(), // Placeholder while loading
                                        errorWidget: (context, url, error) => Icon(
                                          Icons.image,
                                        ), // Error widget if image fails to load
                                      ),
                                      SizedBox(width: screenWidth * 0.01),
                                      Expanded(
                                        child: Text(
                                          "Sampoorna Raksha Promise",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: screenWidth * 0.04,
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
                                                fontSize: screenWidth * 0.0325,
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
                                                fontSize: screenWidth * 0.0375,
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
                                                fontSize: screenWidth * 0.0325,
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
                                                fontSize: screenWidth * 0.0375,
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
                                                fontSize: screenWidth * 0.0325,
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
                                                fontSize: screenWidth * 0.0375,
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
                                                fontSize: screenWidth * 0.0325,
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
                                                fontSize: screenWidth * 0.0375,
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
                                          "50% of Sum Assured paid upon the diagnosis of a Terminal",
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
                          // Add-ons and Highlights
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(screenWidth * 0.03),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                screenWidth * 0.045,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.02),
                                  blurRadius: screenWidth * 0.0075,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                buildTabBar(context, viewModel),
                                SizedBox(height: screenHeight * 0.0175),
                                AnimatedCrossFade(
                                  duration: const Duration(milliseconds: 250),
                                  crossFadeState: viewModel.tabIndex == 0
                                      ? CrossFadeState.showFirst
                                      : CrossFadeState.showSecond,
                                  firstChild: buildAddOnsTab(context),
                                  secondChild: buildHighlightsTab(context),
                                ),
                              ],
                            ),
                          ),
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
                              buildDownloadLink(
                                context,
                                "Terms & Conditions",
                                termsUrl,
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.0075),
                          buildDownloadLink(
                            context,
                            "Required Documents",
                            documentsUrl,
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
                              backgroundColor: const Color(0xFF295DC4),
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
                              // Navigate
                              Navigator.pushNamed(
                                context,
                                RouteNames.sampoornaRakshaPolicySummaryScreen,
                              );
                            },
                            child: Text(
                              "Confirm",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
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

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import '../../../recommentation/recomentation_screen.dart';
// import '../viewmodel/benifit_viewmodel.dart';
//
// // Stateless widget
// class SampoornaRakshaPromiseScreen extends StatelessWidget {
//   SampoornaRakshaPromiseScreen({Key? key}) : super(key: key);
//
//   // Dummy URLs for PDF opening
//   final String policyBrochureUrl =
//       "https://www.example.com/policy-brochure.pdf";
//   final String termsUrl = "https://www.example.com/terms.pdf";
//   final String documentsUrl = "https://www.example.com/documents.pdf";
//
//   // Add-ons options
//   final List<Map<String, String>> addons = [
//     {
//       "title": "Accidental Death Benefit (₹51)",
//       "desc": "Sum Assured to be paid when death is caused by Accident.",
//     },
//     {
//       "title": "Accidental Total and Permanent Disability Benefit (₹31)",
//       "desc": "Benefit provided paid when Disability is caused by Accidents",
//     },
//     {
//       "title": "Criticare Plus Benefit (₹1,056)",
//       "desc": "Benefits paid out when diagnosed with Critical Illness",
//     },
//     {
//       "title": "Hospicare Benefit (₹349)",
//       "desc": "Hospitalisation cover for Life Assured",
//     },
//   ];
//
//   // Highlights content
//   final List<String> covered = ["Terminal Illness Coverage"];
//   final List<String> uncovered = [
//     "Death by Suicide is not covered for the first 365 days since Policy Issuance.",
//   ];
//
//   // PDF opener
//   void openPdf(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     }
//   }
//
//   void showTerminalIllnessBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
//       ),
//       isScrollControlled: true,
//       builder: (context) => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   const Text(
//                     "Terminal Illness Coverage",
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                     icon: const Icon(Icons.close),
//                     onPressed: () => Navigator.pop(context),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 6),
//               const Text(
//                 "Terminal Illness is defined as an advanced or rapidly progressing incurable and un-correctable medical condition which, in the opinion of two (2) independent Medical Practitioners specializing in treatment of such illness, has greater than 50% chance of death of the Life Assured within 6 months of the date of diagnosis of Terminal Illness. The Company reserves the right for independent assessment of the Terminal Illness.",
//                 style: TextStyle(fontSize: 15, height: 1.45),
//               ),
//               const SizedBox(height: 12),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildAddOnsTab() {
//     return Column(
//       children: List.generate(addons.length, (i) {
//         final item = addons[i];
//         return Container(
//           margin: const EdgeInsets.only(bottom: 12),
//           padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
//           decoration: BoxDecoration(
//             color: Colors.blue.shade50,
//             borderRadius: BorderRadius.circular(14),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.02),
//                 blurRadius: 4,
//                 offset: const Offset(0, 1),
//               ),
//             ],
//           ),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       item["title"]!,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xFF295DC4),
//                         fontSize: 16,
//                       ),
//                     ),
//                     const SizedBox(height: 3),
//                     Text(
//                       item["desc"]!,
//                       style: const TextStyle(
//                         color: Color(0xFF757575),
//                         fontSize: 14,
//                         height: 1.3,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(width: 8),
//               const Icon(
//                 Icons.radio_button_unchecked,
//                 color: Color(0xFFBDC6D7),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
//
//   Widget buildHighlightsTab() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 6),
//         const Text(
//           "Covered",
//           style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
//         ),
//         const SizedBox(height: 4),
//         ...covered.map(
//           (e) => Row(
//             children: [
//               const Icon(Icons.check_circle, color: Colors.green, size: 20),
//               const SizedBox(width: 6),
//               Expanded(child: Text(e, style: const TextStyle(fontSize: 15))),
//             ],
//           ),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Uncovered",
//           style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
//         ),
//         const SizedBox(height: 4),
//         ...uncovered.map(
//           (e) => Row(
//             children: [
//               const Icon(Icons.cancel, color: Colors.red, size: 20),
//               const SizedBox(width: 6),
//               Expanded(child: Text(e, style: const TextStyle(fontSize: 15))),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget buildTabBar(
//     BuildContext context,
//     SampoornaRakshaPromiseViewModel viewModel,
//   ) {
//     return Container(
//       decoration: BoxDecoration(
//         color: const Color(0xFFF7F8FA),
//         borderRadius: BorderRadius.circular(14),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: InkWell(
//               borderRadius: BorderRadius.circular(14),
//               onTap: () => viewModel.setTabIndex(0),
//               child: Container(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 decoration: BoxDecoration(
//                   color: viewModel.tabIndex == 0
//                       ? const Color(0xFFD2DCF8)
//                       : Colors.transparent,
//                   borderRadius: BorderRadius.circular(14),
//                 ),
//                 alignment: Alignment.center,
//                 child: Text(
//                   "Add - ons",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     color: viewModel.tabIndex == 0
//                         ? const Color(0xFF295DC4)
//                         : const Color(0xFF757575),
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: InkWell(
//               borderRadius: BorderRadius.circular(14),
//               onTap: () => viewModel.setTabIndex(1),
//               child: Container(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 decoration: BoxDecoration(
//                   color: viewModel.tabIndex == 1
//                       ? const Color(0xFFD2DCF8)
//                       : Colors.transparent,
//                   borderRadius: BorderRadius.circular(14),
//                 ),
//                 alignment: Alignment.center,
//                 child: Text(
//                   "Highlights",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     color: viewModel.tabIndex == 1
//                         ? const Color(0xFF295DC4)
//                         : const Color(0xFF757575),
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildDownloadLink(String text, String url) {
//     return InkWell(
//       onTap: () => openPdf(url),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Icon(Icons.download, size: 18, color: Color(0xFF295DC4)),
//           const SizedBox(width: 3),
//           Text(
//             text,
//             style: const TextStyle(
//               color: Color(0xFF295DC4),
//               fontWeight: FontWeight.w600,
//               fontSize: 15,
//               decoration: TextDecoration.underline,
//             ),
//           ),
//           const SizedBox(width: 8),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => SampoornaRakshaPromiseViewModel(),
//       child: Consumer<SampoornaRakshaPromiseViewModel>(
//         builder: (context, viewModel, _) {
//           return Scaffold(
//             backgroundColor: const Color(0xFFF6F8FE),
//             appBar: AppBar(
//               backgroundColor: Colors.white,
//               elevation: 0,
//               leading: IconButton(
//                 icon: const Icon(
//                   Icons.arrow_back_ios,
//                   color: Colors.black,
//                   size: 22,
//                 ),
//                 onPressed: () => Navigator.pop(context),
//               ),
//               title: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text(
//                     "Yogesh",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 18,
//                     ),
//                   ),
//                   SizedBox(height: 2),
//                   Text(
//                     "20 years • ₹4.0L • Non-Smoker",
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontWeight: FontWeight.w400,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             body: Stack(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 80),
//                   child: SingleChildScrollView(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 16,
//                         vertical: 8,
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Sampoorna Raksha Promise Card
//                           Card(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(14),
//                             ),
//                             elevation: 0,
//                             color: Colors.white,
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 18,
//                                 vertical: 16,
//                               ),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       // Placeholder for logo
//                                       Image.network(
//                                         "https://logo personally.com/tata.com",
//                                         width: 40,
//                                         height: 24,
//                                         errorBuilder:
//                                             (context, error, stackTrace) =>
//                                                 const SizedBox(
//                                                   width: 40,
//                                                   height: 24,
//                                                 ),
//                                       ),
//                                       const SizedBox(width: 4),
//                                       const Expanded(
//                                         child: Text(
//                                           "Sampoorna Raksha Promise",
//                                           style: TextStyle(
//                                             fontWeight: FontWeight.w600,
//                                             fontSize: 16,
//                                           ),
//                                         ),
//                                       ),
//                                       GestureDetector(
//                                         onTap: () {
//                                           showModalBottomSheet(
//                                             isScrollControlled: true,
//                                             context: context,
//                                             builder: (_) => Recommendation(),
//                                           );
//                                         },
//                                         child: Icon(
//                                           Icons.edit,
//                                           color: Colors.blue.shade400,
//                                           size: 20,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 15),
//                                   Row(
//                                     children: const [
//                                       Expanded(
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               "Life Cover",
//                                               style: TextStyle(
//                                                 fontSize: 13,
//                                                 color: Colors.grey,
//                                               ),
//                                             ),
//                                             SizedBox(height: 2),
//                                             Text(
//                                               "₹50.0L",
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.w600,
//                                                 fontSize: 15,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Expanded(
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               "Cover till Age",
//                                               style: TextStyle(
//                                                 fontSize: 13,
//                                                 color: Colors.grey,
//                                               ),
//                                             ),
//                                             SizedBox(height: 2),
//                                             Text(
//                                               "54 years",
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.w600,
//                                                 fontSize: 15,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 12),
//                                   Row(
//                                     children: const [
//                                       Expanded(
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               "Pay For",
//                                               style: TextStyle(
//                                                 fontSize: 13,
//                                                 color: Colors.grey,
//                                               ),
//                                             ),
//                                             SizedBox(height: 2),
//                                             Text(
//                                               "34 years",
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.w600,
//                                                 fontSize: 15,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Expanded(
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               "Payment Frequency",
//                                               style: TextStyle(
//                                                 fontSize: 13,
//                                                 color: Colors.grey,
//                                               ),
//                                             ),
//                                             SizedBox(height: 2),
//                                             Text(
//                                               "Annually",
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.w600,
//                                                 fontSize: 15,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           const Text(
//                             "Benefits Included with the Policy",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w700,
//                               fontSize: 16,
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           // Terminal Illness Container
//                           InkWell(
//                             borderRadius: BorderRadius.circular(14),
//                             onTap: () =>
//                                 showTerminalIllnessBottomSheet(context),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(14),
//                                 border: Border.all(
//                                   color: const Color(0xFFD8E1F3),
//                                   width: 1,
//                                 ),
//                               ),
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 16,
//                                 vertical: 12,
//                               ),
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Icon(
//                                     Icons.verified_user,
//                                     color: Color(0xFF269278),
//                                     size: 26,
//                                   ),
//                                   const SizedBox(width: 10),
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: const [
//                                         Text(
//                                           "Terminal Illness",
//                                           style: TextStyle(
//                                             fontWeight: FontWeight.w700,
//                                             fontSize: 16,
//                                           ),
//                                         ),
//                                         SizedBox(height: 2),
//                                         Text(
//                                           "50% of Sum Assured paid upon the diagnosis of a Terminal",
//                                           style: TextStyle(
//                                             color: Color(0xFF444444),
//                                             fontSize: 15,
//                                             height: 1.3,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(width: 8),
//                                   const Icon(
//                                     Icons.info_outline,
//                                     color: Color(0xFF888888),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           // Add-ons and Highlights
//                           Container(
//                             width: double.infinity,
//                             padding: const EdgeInsets.all(12),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(18),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black.withOpacity(0.02),
//                                   blurRadius: 3,
//                                   offset: const Offset(0, 2),
//                                 ),
//                               ],
//                             ),
//                             child: Column(
//                               children: [
//                                 buildTabBar(context, viewModel),
//                                 const SizedBox(height: 14),
//                                 AnimatedCrossFade(
//                                   duration: const Duration(milliseconds: 250),
//                                   crossFadeState: viewModel.tabIndex == 0
//                                       ? CrossFadeState.showFirst
//                                       : CrossFadeState.showSecond,
//                                   firstChild: buildAddOnsTab(),
//                                   secondChild: buildHighlightsTab(),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           // Download Links
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               buildDownloadLink(
//                                 "Policy Brochure",
//                                 policyBrochureUrl,
//                               ),
//                               buildDownloadLink("Terms & Conditions", termsUrl),
//                             ],
//                           ),
//                           const SizedBox(height: 6),
//                           buildDownloadLink("Required Documents", documentsUrl),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Bottom Bar
//                 Positioned(
//                   left: 0,
//                   right: 0,
//                   bottom: 0,
//                   child: Container(
//                     color: Colors.white,
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 16,
//                       vertical: 12,
//                     ),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: const [
//                               Text(
//                                 "Total Amount (inc of taxes)",
//                                 style: TextStyle(
//                                   color: Colors.black54,
//                                   fontSize: 13,
//                                 ),
//                               ),
//                               SizedBox(height: 0),
//                               Text(
//                                 "₹6,162 /year",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w700,
//                                   color: Color(0xFF295DC4),
//                                   fontSize: 19,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 44,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: const Color(0xFF295DC4),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 30,
//                               ),
//                             ),
//                             onPressed: () {},
//                             child: const Text(
//                               "Confirm",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 17,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
