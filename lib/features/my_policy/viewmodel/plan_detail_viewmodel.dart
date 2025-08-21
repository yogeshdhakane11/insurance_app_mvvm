import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class PlanDetailViewModel extends ChangeNotifier {
  String? planName;
  String? validFrom;
  String? validTill;
  String? selectedFilePath;

  // Update Plan Name
  void updatePlanName(String name) {
    planName = name;
    notifyListeners();
  }

  // Update Valid From Date
  void updateValidFrom(String date) {
    validFrom = date;
    notifyListeners();
  }

  // Update Valid Till Date
  void updateValidTill(String date) {
    validTill = date;
    notifyListeners();
  }

  // Update Selected File Path
  void updateSelectedFile(String? path) {
    selectedFilePath = path;
    notifyListeners();
  }

  // Submit Plan Details
  void submitPlanDetails() {
    final inputDateFormat = DateFormat('dd-MMM-yyyy');
    final outputDateFormat = DateFormat('yyyy-MM-dd');

    final validFromDate = inputDateFormat.parse(validFrom!);
    final validTillDate = inputDateFormat.parse(validTill!);

    final Map<String, dynamic> body = {
      "plan_nick_name": planName?.trim(),
      "valid_from": outputDateFormat.format(validFromDate),
      "valid_till": outputDateFormat.format(validTillDate),
      "policy_document": selectedFilePath,
    };

    // Call API or perform other actions with 'body'
    debugPrint('Body Data: $body');
  }
}

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';
// import 'package:mime/mime.dart';
// import 'package:path/path.dart';
//
// Future<void> planDetailsApi(
//   Map<String, dynamic> body,
//   BuildContext context,
// ) async {
//   try {
//     final uri = Uri.parse('http://192.168.1.12:8000/api/plan-details/');
//
//     final request = http.MultipartRequest('POST', uri);
//
//     // Add form fields
//     request.fields['plan_nick_name'] = body['plan_nick_name'];
//     request.fields['valid_from'] = body['valid_from'];
//     request.fields['valid_till'] = body['valid_till'];
//
//     // Add file
//     final String? filePath = body['policy_document'];
//     if (filePath != null && filePath.isNotEmpty) {
//       final mimeType = lookupMimeType(filePath) ?? 'application/octet-stream';
//       final file = await http.MultipartFile.fromPath(
//         'policy_document',
//         filePath,
//         contentType: MediaType.parse(mimeType),
//         filename: basename(filePath),
//       );
//       request.files.add(file);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please upload a valid document")),
//       );
//       return;
//     }
//
//     // Optional: Add headers if needed (like auth token)
//     // request.headers['Authorization'] = 'Bearer YOUR_TOKEN';
//
//     // Send request
//     final streamedResponse = await request.send();
//     final response = await http.Response.fromStream(streamedResponse);
//
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       debugPrint("Upload success: ${response.body}");
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text("Uploaded successfully")));
//
//       Navigator.pop(context); // Close screen if needed
//     } else {
//       debugPrint("Upload failed: ${response.statusCode}");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Upload failed: ${response.body}")),
//       );
//     }
//   } catch (e) {
//     debugPrint("Upload error: $e");
//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(SnackBar(content: Text("Upload error: $e")));
//   }
// }
