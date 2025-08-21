import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AssistanceSupportSectionScreen extends StatelessWidget {
  const AssistanceSupportSectionScreen({super.key});

  void _callPhoneNumber(String number) async {
    final Uri uri = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint("❌ Could not dial number: $number");
    }
  }

  void _openSupportWebsite(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      final bool launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      debugPrint(launched ? "✅ Launched $url" : "❌ Could not launch $url");
    } catch (e) {
      debugPrint("🚨 Error launching URL: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Row - Claim & Protection
          screenWidth < 100
              ? Column(
                  children: const [
                    Row(
                      children: [
                        Icon(Icons.person, color: Colors.green),
                        SizedBox(width: 6),
                        Expanded(child: Text("Guaranteed\nClaim Assistance")),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.verified_user, color: Colors.teal),
                        SizedBox(width: 6),
                        Expanded(child: Text("Wealth Protection\nby Experts")),
                      ],
                    ),
                  ],
                )
              : Row(
                  children: const [
                    Icon(Icons.person, color: Colors.green),
                    SizedBox(width: 6),
                    Expanded(child: Text("Guaranteed\nClaim Assistance")),
                    Spacer(),
                    Icon(Icons.verified_user, color: Colors.teal),
                    SizedBox(width: 6),
                    Expanded(child: Text("Wealth Protection\nby Experts")),
                  ],
                ),

          const SizedBox(height: 20),

          const Text(
            "Need Assistance?",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          const Text(
            "We are always up to help you protect your wealth.",
            style: TextStyle(fontSize: 14),
          ),

          const SizedBox(height: 12),

          /// Links Section - Responsive layout based on screen width
          screenWidth < 100
              ? Column(
                  children: [
                    InkWell(
                      onTap: () => _callPhoneNumber("1800123456"),
                      child: const Row(
                        children: [
                          Icon(Icons.call, size: 20, color: Colors.purple),
                          SizedBox(width: 4),
                          Text(
                            "Set up call",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.purple,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    InkWell(
                      onTap: () =>
                          _openSupportWebsite("https://www.google.com/"),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.support_agent,
                            size: 20,
                            color: Colors.purple,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Insurance Support",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.purple,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    InkWell(
                      onTap: () => _callPhoneNumber("1800123456"),
                      child: const Row(
                        children: [
                          Icon(Icons.call, size: 20, color: Colors.purple),
                          SizedBox(width: 4),
                          Text(
                            "Set up call",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.purple,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () =>
                          _openSupportWebsite("https://www.google.com/"),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.support_agent,
                            size: 20,
                            color: Colors.purple,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Insurance Support",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.purple,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class AssistanceSupportSection extends StatelessWidget {
//   const AssistanceSupportSection({super.key});
//
//   void _callPhoneNumber(String number) async {
//     final Uri uri = Uri(scheme: 'tel', path: number);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri);
//     } else {
//       debugPrint("❌ Could not dial number: $number");
//     }
//   }
//
//   void _openSupportWebsite(String url) async {
//     final Uri uri = Uri.parse(url);
//     try {
//       final bool launched = await launchUrl(
//         uri,
//         mode: LaunchMode.externalApplication,
//       );
//       debugPrint(launched ? "✅ Launched $url" : "❌ Could not launch $url");
//     } catch (e) {
//       debugPrint("🚨 Error launching URL: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 6)],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// Top Row - Claim & Protection
//           const Row(
//             children: [
//               Icon(Icons.person, color: Colors.green),
//               SizedBox(width: 6),
//               Expanded(child: Text("Guaranteed\nClaim Assistance")),
//               Spacer(),
//               Icon(Icons.verified_user, color: Colors.teal),
//               SizedBox(width: 6),
//               Expanded(child: Text("Wealth Protection\nby Experts")),
//             ],
//           ),
//
//           const SizedBox(height: 20),
//
//           const Text(
//             "Need Assistance?",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//           ),
//           const SizedBox(height: 4),
//           const Text(
//             "We are always up to help you protect your wealth.",
//             style: TextStyle(fontSize: 14),
//           ),
//
//           const SizedBox(height: 12),
//
//           /// Links
//           Row(
//             children: [
//               InkWell(
//                 onTap: () => _callPhoneNumber("1800123456"),
//                 child: const Row(
//                   children: [
//                     Icon(Icons.call, size: 20, color: Colors.purple),
//                     SizedBox(width: 4),
//                     Text(
//                       "Set up call",
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.purple,
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // const SizedBox(width: 24),
//               const Spacer(),
//               InkWell(
//                 onTap: () => _openSupportWebsite("https://www.google.com/"),
//                 child: const Row(
//                   children: [
//                     Icon(Icons.support_agent, size: 20, color: Colors.purple),
//                     SizedBox(width: 4),
//                     Text(
//                       "Insurance Support",
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.purple,
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
