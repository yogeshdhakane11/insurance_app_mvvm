import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLaunch {
  static Future makePhoneCall({String? phoneNumber}) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(launchUri);
  }

  static Future makeEmail({
    String? email,
    String? subject,
    String? body,
  }) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=$subject&body=$body',
    );

    if (await canLaunchUrl(params)) {
      await launchUrl(params);
    } else {
      throw 'Could not launch ${params.toString()}';
    }
  }

  // Method to open PDF (using URL or file path)
  static Future openPdf({String? pdfPath}) async {
    final Uri url = Uri.parse(pdfPath!); // Assume it's a URL or file path
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      if (kDebugMode) {
        print('Error launching PDF: ${url.toString()}');
      }
      throw 'Could not launch PDF at $url';
    }
  }

  static Future launchInBrowser({String? urlString}) async {
    final Uri url = Uri.parse(urlString!);
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
        webViewConfiguration: const WebViewConfiguration(
          enableJavaScript: true,
        ),
      );
    } else {
      if (kDebugMode) {
        print('Error launching: ${url.toString()}');
      }
      throw 'Could not launch $url';
    }
  }
}

// ElevatedButton(
// onPressed: () {
// UrlLaunch.makePhoneCall(phoneNumber: '1234567890'); // Replace with actual phone number
// },
// child: Text('Call Phone'),
// ),

// ElevatedButton(
// onPressed: () {
// UrlLaunch.makeEmail(
// email: 'example@example.com',
// subject: 'Hello there',
// body: 'This is a test email body.',
// );
// },
// child: Text('Send Email'),
// ),

// ElevatedButton(
// onPressed: () {
// UrlLaunch.launchInBrowser(urlString: 'https://www.example.com');
// },
// child: Text('Open in Browser'),
// ),
