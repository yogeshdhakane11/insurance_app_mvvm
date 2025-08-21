import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TermClaimCentrePage extends StatelessWidget {
  const TermClaimCentrePage({super.key});

  // Function to launch phone dialer
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      debugPrint('Could not launch $phoneNumber');
    }
  }

  Future<void> _sendEmail(String emailAddress) async {
    final Uri launchUri = Uri(scheme: 'mailto', path: emailAddress);

    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      debugPrint('Could not launch email app for: $launchUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Handle back button press
            Navigator.pop(context);
          },
        ),
        title: const Text('Term Claim Centre'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Guaranteed Claim Assistance Section
            Card(
              elevation: 0.1,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Guaranteed Claim Assistance',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Call FundsPI claim assistance for quick resolutions',
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 11),
                          ElevatedButton.icon(
                            onPressed: () {
                              _makePhoneCall(
                                'YOUR_ASSETPLUS_NUMBER_HERE',
                              ); // Replace with actual number
                            },
                            icon: const Icon(Icons.call),
                            label: const Text('Call Support'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Contact Support',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // TATA AIA Section
            _buildContactCard(
              context,
              companyName: 'TATA AIA',
              phoneNumber: '1860-266-9966',
              emailAddress: 'customercare@tataaia.com',
              onCall: () => _makePhoneCall('18602669966'),
              onEmail: () => _sendEmail('customercare@tataaia.com'),
            ),
            const SizedBox(height: 16),

            // ICICI Prudential Section
            _buildContactCard(
              context,
              companyName: 'ICICI Prudential',
              phoneNumber: '1860-266-7766',
              emailAddress: 'claimsupport@iciciprulife.com',
              onCall: () => _makePhoneCall('18602667766'),
              onEmail: () => _sendEmail('claimsupport@iciciprulife.com'),
            ),
            const SizedBox(height: 16),

            // HDFC Life Section
            _buildContactCard(
              context,
              companyName: 'HDFC Life',
              phoneNumber: '1800-227-227',
              emailAddress: 'service@hdfclife.com',
              onCall: () => _makePhoneCall('1800227227'),
              onEmail: () => _sendEmail('service@hdfclife.com'),
            ),
            const SizedBox(height: 16),

            // Bajaj Allianz Section
            _buildContactCard(
              context,
              companyName: 'Bajaj Allianz',
              phoneNumber: '1800-209-5858',
              emailAddress: 'bagichelp@bajajallianz.co.in',
              onCall: () => _makePhoneCall('18002095858'),
              onEmail: () => _sendEmail('bagichelp@bajajallianz.co.in'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard(
    BuildContext context, {
    required String companyName,
    required String phoneNumber,
    required String emailAddress,
    required VoidCallback onCall,
    required VoidCallback onEmail,
  }) {
    // Get screen width for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;

    return Card(
      elevation: 0.1,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenWidth * 0.02,
          horizontal: screenWidth * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              companyName,
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: onCall,
              child: Row(
                children: [
                  const Icon(Icons.call, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text(
                    phoneNumber,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: onEmail,
              child: Row(
                children: [
                  const Icon(Icons.mail, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text(
                    emailAddress,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class TermClaimCentrePage extends StatelessWidget {
//   const TermClaimCentrePage({super.key});
//
//   // Function to launch phone dialer
//   Future<void> _makePhoneCall(String phoneNumber) async {
//     final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
//     if (await canLaunchUrl(launchUri)) {
//       await launchUrl(launchUri);
//     } else {
//       // You can add error handling here, e.g., show a SnackBar
//       debugPrint('Could not launch $phoneNumber');
//     }
//   }
//
//   Future<void> _sendEmail(String emailAddress) async {
//     final Uri launchUri = Uri(scheme: 'mailto', path: emailAddress);
//
//     if (await canLaunchUrl(launchUri)) {
//       await launchUrl(launchUri);
//     } else {
//       debugPrint('Could not launch email app for: $launchUri');
//     }
//   }
//
//   String _encodeQuery(Map<String, String> params) {
//     return params.entries
//         .map(
//           (e) =>
//               '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
//         )
//         .join('&');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             // Handle back button press
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text('Term Claim Centre'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Guaranteed Claim Assistance Section
//             Card(
//               elevation: 0.1,
//               color: Colors.white,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 // side: const BorderSide(color: Colors.black, width: 0.1),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Guaranteed Claim Assistance',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           const Text(
//                             'Call FundsPI claim assistance for quick resolutions',
//                             style: TextStyle(fontSize: 14),
//                           ),
//                           const SizedBox(height: 11),
//                           ElevatedButton.icon(
//                             onPressed: () {
//                               _makePhoneCall(
//                                 'YOUR_ASSETPLUS_NUMBER_HERE',
//                               ); // Replace with actual number
//                             },
//                             icon: const Icon(Icons.call),
//                             label: const Text('Call Support'),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.blue,
//                               foregroundColor: Colors.white,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 24),
//             const Text(
//               'Contact Support',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//
//             // TATA AIA Section
//             _buildContactCard(
//               context,
//               companyName: 'TATA AIA',
//               phoneNumber: '1860-266-9966',
//               emailAddress: 'customercare@tataaia.com',
//               onCall: () => _makePhoneCall('18602669966'),
//               onEmail: () => _sendEmail('customercare@tataaia.com'),
//             ),
//             const SizedBox(height: 16),
//
//             // ICICI Prudential Section
//             _buildContactCard(
//               context,
//               companyName: 'ICICI Prudential',
//               phoneNumber: '1860-266-7766',
//               emailAddress: 'claimsupport@iciciprulife.com',
//               onCall: () => _makePhoneCall('18602667766'),
//               onEmail: () => _sendEmail('claimsupport@iciciprulife.com'),
//             ),
//             const SizedBox(height: 16),
//
//             // HDFC Life Section
//             _buildContactCard(
//               context,
//               companyName: 'HDFC Life',
//               phoneNumber: '1800-227-227',
//               emailAddress: 'service@hdfclife.com',
//               onCall: () => _makePhoneCall('1800227227'),
//               onEmail: () => _sendEmail('service@hdfclife.com'),
//             ),
//             const SizedBox(height: 16),
//
//             // Bajaj Allianz Section
//             _buildContactCard(
//               context,
//               companyName: 'Bajaj Allianz',
//               phoneNumber: '1800-209-5858',
//               emailAddress: 'bagichelp@bajajallianz.co.in',
//               onCall: () => _makePhoneCall('18002095858'),
//               onEmail: () => _sendEmail('bagichelp@bajajallianz.co.in'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildContactCard(
//     BuildContext context, {
//     required String companyName,
//     required String phoneNumber,
//     required String emailAddress,
//     required VoidCallback onCall,
//     required VoidCallback onEmail,
//   }) {
//     return Card(
//       elevation: 0.1,
//       color: Colors.white,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//         // side: const BorderSide(color: Colors.black, width: 0.1),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               companyName,
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 12),
//             InkWell(
//               onTap: onCall,
//               child: Row(
//                 children: [
//                   const Icon(Icons.call, color: Colors.blue),
//                   const SizedBox(width: 8),
//                   Text(
//                     phoneNumber,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       color: Colors.blue,
//                       decoration: TextDecoration.underline,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 8),
//             InkWell(
//               onTap: onEmail,
//               child: Row(
//                 children: [
//                   const Icon(Icons.mail, color: Colors.blue),
//                   const SizedBox(width: 8),
//                   Text(
//                     emailAddress,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       color: Colors.blue,
//                       decoration: TextDecoration.underline,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
