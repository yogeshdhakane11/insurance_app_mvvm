import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';

class HealthClaimCenterScreen extends StatelessWidget {
  // Open asset PDF using system app
  Future<void> openAssetPdf(String assetPath, String filename) async {
    final byteData = await rootBundle.load(assetPath);
    final file = File('${(await getTemporaryDirectory()).path}/$filename');
    await file.writeAsBytes(byteData.buffer.asUint8List());
    await OpenFile.open(file.path);
  }

  // Open external URL
  void openUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  // Support Card
  Widget buildSupportCard(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        color: Colors.white,
        elevation: 0.2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(11),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Guaranteed Claim Assistance",
                      style: TextStyle(
                        fontSize: screenWidth * 0.05, // Responsive font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Call AssetPlus claim assistance for quick resolutions",
                    ),
                    SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: () => openUrl("tel:1234567890"),
                      icon: Icon(Icons.call),
                      label: Text("Call Support"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(
                          screenWidth * 0.6,
                          50,
                        ), // Responsive button size
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12),
            ],
          ),
        ),
      ),
    );
  }

  // Insurance card with PDF/URL links
  Widget buildInsuranceTile(
    BuildContext context,
    String title,
    List<Map<String, String>> links,
  ) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: Card(
          color: Colors.white,
          elevation: 0.2,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 16),
            title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...links.map((link) {
                      return InkWell(
                        onTap: () {
                          if (link['type'] == 'asset') {
                            openAssetPdf(link['path']!, link['filename']!);
                          } else {
                            openUrl(link['url']!);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Text(
                            link['title']!,
                            style: TextStyle(
                              color: Colors.purple,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Chat support section
  Widget buildChatSupport(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Need Assistance?",
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text("We are always up to help you protect your wealth."),
          SizedBox(height: 12),
          InkWell(
            onTap: () => openUrl("https://flutter.dev"),
            child: Row(
              children: [
                Icon(Icons.chat_bubble_outline, size: 18),
                SizedBox(width: 8),
                Text(
                  "Chat with us",
                  style: TextStyle(
                    color: Colors.purple,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Main build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Health Claim Centre"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildSupportCard(context),

            // Niva Bupa card (PDF from assets)
            buildInsuranceTile(context, "Niva Bupa ReAssure 2.0", [
              {
                'title': 'Visit Portal',
                'type': 'url',
                'url':
                    'https://transactions.nivabupa.com/claims/pages/health-claim.aspx',
              },
              {
                'title': 'Download Health Claim Form - English (PDF)',
                'type': 'asset',
                'path': 'assets/claim_form.pdf',
                'filename': 'claim_form.pdf',
              },
              {
                'title': 'Download Pre-Authorization Form',
                'type': 'asset',
                'path': 'assets/claim_form.pdf',
                'filename': 'claim_form.pdf',
              },
            ]),

            // Care Supreme card
            buildInsuranceTile(context, "Care Supreme", [
              {
                'title': 'Visit Portal',
                'type': 'url',
                'url': 'https://www.careinsurance.com/rhicl/claim/login',
              },
              {
                'title': 'Download Health Claim Form - English (PDF)',
                'type': 'asset',
                'path': 'assets/claim_form.pdf',
                'filename': 'care_claim_english.pdf',
              },
              {
                'title': 'Download Health Claim Form - Hindi (PDF)',
                'type': 'asset',
                'path': 'assets/claim_form.pdf',
                'filename': 'care_claim_hindi.pdf',
              },
              {
                'title': 'Download Pre-Authorization Form',
                'type': 'asset',
                'path': 'assets/claim_form.pdf',
                'filename': 'care_claim_english.pdf',
              },
            ]),

            buildChatSupport(context),
          ],
        ),
      ),
    );
  }
}
