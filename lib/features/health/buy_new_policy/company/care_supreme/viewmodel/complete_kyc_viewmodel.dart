import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class CompleteKycViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  XFile? _identityProofImage;
  XFile? get identityProofImage => _identityProofImage;

  XFile? _addressProofImage;
  XFile? get addressProofImage => _addressProofImage;

  // Set loading state
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Update Identity Proof Image
  void setIdentityProofImage(XFile? image) {
    _identityProofImage = image;
    notifyListeners();
  }

  // Update Address Proof Image
  void setAddressProofImage(XFile? image) {
    _addressProofImage = image;
    notifyListeners();
  }

  // Cancel the uploaded Identity Proof
  void cancelIdentityProofUpload() {
    _identityProofImage = null;
    notifyListeners();
  }

  // Cancel the uploaded Address Proof
  void cancelAddressProofUpload() {
    _addressProofImage = null;
    notifyListeners();
  }

  // Show Bottom Sheet with Image Picker Option
  void showImagePicker(BuildContext context, String proofType) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(1)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 11),
                ListTile(
                  leading: Icon(Icons.image, color: Colors.blue, size: 28),
                  title: Text(
                    'Choose from Gallery',
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () async {
                    Navigator.pop(context); // Close the bottom sheet
                    final ImagePicker picker = ImagePicker();
                    final XFile? image = await picker.pickImage(
                      source: ImageSource.gallery,
                    );
                    if (image != null) {
                      if (proofType == 'identity') {
                        setIdentityProofImage(image);
                      } else if (proofType == 'address') {
                        setAddressProofImage(image);
                      }
                    }
                  },
                ),
                SizedBox(height: 10),
                // TextButton(
                //   onPressed: () => Navigator.pop(context),
                //   child: Text(
                //     'Cancel',
                //     style: TextStyle(color: Colors.red, fontSize: 16),
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Submit KYC Images via API
  Future<void> submitKycImages() async {
    if (_identityProofImage == null || _addressProofImage == null) {
      return; // If either image is missing, do not submit
    }

    setLoading(true);

    try {
      // Define the API endpoint
      final uri = Uri.parse("https://your-api-endpoint.com/upload");

      // Create the multipart request
      var request = http.MultipartRequest("POST", uri);

      // Add identity proof image
      var identityProofImage = await http.MultipartFile.fromPath(
        'identity_proof',
        _identityProofImage!.path,
        contentType: MediaType('image', 'jpeg'), // Or correct MIME type
      );
      request.files.add(identityProofImage);

      // Add address proof image
      var addressProofImage = await http.MultipartFile.fromPath(
        'address_proof',
        _addressProofImage!.path,
        contentType: MediaType('image', 'jpeg'), // Or correct MIME type
      );
      request.files.add(addressProofImage);

      // Send the request
      var response = await request.send();

      if (response.statusCode == 200) {
        print('KYC images uploaded successfully');
      } else {
        print('Failed to upload images');
      }
    } catch (e) {
      print('Error uploading images: $e');
    } finally {
      setLoading(false);
    }
  }
}

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:http_parser/http_parser.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
// import 'package:path/path.dart'; // For joining file paths
// import 'package:mime/mime.dart'; // To get MIME type of file
//
// class CompleteKycViewModel extends ChangeNotifier {
//   bool _isLoading = false;
//   bool get isLoading => _isLoading;
//
//   XFile? _identityProofImage;
//   XFile? get identityProofImage => _identityProofImage;
//
//   XFile? _addressProofImage;
//   XFile? get addressProofImage => _addressProofImage;
//
//   // Set loading state
//   void setLoading(bool value) {
//     _isLoading = value;
//     notifyListeners();
//   }
//
//   // Update Identity Proof Image
//   void setIdentityProofImage(XFile? image) {
//     _identityProofImage = image;
//     notifyListeners();
//   }
//
//   // Update Address Proof Image
//   void setAddressProofImage(XFile? image) {
//     _addressProofImage = image;
//     notifyListeners();
//   }
//
//   // Cancel the uploaded Identity Proof
//   void cancelIdentityProofUpload() {
//     _identityProofImage = null;
//     notifyListeners();
//   }
//
//   // Cancel the uploaded Address Proof
//   void cancelAddressProofUpload() {
//     _addressProofImage = null;
//     notifyListeners();
//   }
//
//   // Show Image Picker to choose an image
//   Future<void> showImagePicker(BuildContext context, String proofType) async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       if (proofType == 'identity') {
//         setIdentityProofImage(image);
//       } else if (proofType == 'address') {
//         setAddressProofImage(image);
//       }
//     }
//   }
//
//   // Submit KYC Images via API
//   Future<void> submitKycImages() async {
//     if (_identityProofImage == null || _addressProofImage == null) {
//       return; // If either image is missing, do not submit
//     }
//
//     setLoading(true);
//
//     try {
//       // Define the API endpoint
//       final uri = Uri.parse("https://your-api-endpoint.com/upload");
//
//       // Create the multipart request
//       var request = http.MultipartRequest("POST", uri);
//
//       // Add identity proof image
//       var identityProofImage = await http.MultipartFile.fromPath(
//         'identity_proof',
//         _identityProofImage!.path,
//         contentType: MediaType('image', 'jpeg'), // Or correct MIME type
//       );
//       request.files.add(identityProofImage);
//
//       // Add address proof image
//       var addressProofImage = await http.MultipartFile.fromPath(
//         'address_proof',
//         _addressProofImage!.path,
//         contentType: MediaType('image', 'jpeg'), // Or correct MIME type
//       );
//       request.files.add(addressProofImage);
//
//       // Send the request
//       var response = await request.send();
//
//       if (response.statusCode == 200) {
//         print('KYC images uploaded successfully');
//       } else {
//         print('Failed to upload images');
//       }
//     } catch (e) {
//       print('Error uploading images: $e');
//     } finally {
//       setLoading(false);
//     }
//   }
// }
