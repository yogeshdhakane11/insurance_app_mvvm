import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class NivaBupaCompleteKycViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  XFile? _panImage;
  XFile? get panImage => _panImage;

  XFile? _aadhaarFrontImage;
  XFile? get aadhaarFrontImage => _aadhaarFrontImage;

  XFile? _aadhaarBackImage;
  XFile? get aadhaarBackImage => _aadhaarBackImage;

  bool _noPan = false;
  bool get noPan => _noPan;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setPanImage(XFile? image) {
    _panImage = image;
    notifyListeners();
  }

  void setAadhaarFrontImage(XFile? image) {
    _aadhaarFrontImage = image;
    notifyListeners();
  }

  void setAadhaarBackImage(XFile? image) {
    _aadhaarBackImage = image;
    notifyListeners();
  }

  void cancelPanUpload() {
    _panImage = null;
    notifyListeners();
  }

  void cancelAadhaarFrontUpload() {
    _aadhaarFrontImage = null;
    notifyListeners();
  }

  void cancelAadhaarBackUpload() {
    _aadhaarBackImage = null;
    notifyListeners();
  }

  void toggleNoPan(bool value) {
    _noPan = value;
    notifyListeners();
  }

  Future<void> showImagePicker(BuildContext context, String proofType) async {
    final ImagePicker picker = ImagePicker();
    showModalBottomSheet(
      context: context,
      builder: (context) => ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(42),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(title: Text('Choose One')),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Take a picture'),
              onTap: () async {
                Navigator.pop(context);
                final XFile? image = await picker.pickImage(
                  source: ImageSource.camera,
                );
                if (image != null) {
                  if (proofType == 'pan')
                    setPanImage(image);
                  else if (proofType == 'aadhaar_front')
                    setAadhaarFrontImage(image);
                  else if (proofType == 'aadhaar_back')
                    setAadhaarBackImage(image);
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Choose file'),
              onTap: () async {
                Navigator.pop(context);
                final XFile? image = await picker.pickImage(
                  source: ImageSource.gallery,
                );
                if (image != null) {
                  if (proofType == 'pan')
                    setPanImage(image);
                  else if (proofType == 'aadhaar_front')
                    setAadhaarFrontImage(image);
                  else if (proofType == 'aadhaar_back')
                    setAadhaarBackImage(image);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> submitKycImages(BuildContext context) async {
    if (_panImage == null ||
        _aadhaarFrontImage == null ||
        _aadhaarBackImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please upload all required images')),
      );
      return;
    }

    setLoading(true);

    try {
      final uri = Uri.parse("https://your-api-endpoint.com/upload");
      var request = http.MultipartRequest("POST", uri);

      var panImageFile = await http.MultipartFile.fromPath(
        'pan_image',
        _panImage!.path,
        contentType: MediaType('image', 'jpeg'),
      );
      request.files.add(panImageFile);

      var aadhaarFrontImageFile = await http.MultipartFile.fromPath(
        'aadhaar_front_image',
        _aadhaarFrontImage!.path,
        contentType: MediaType('image', 'jpeg'),
      );
      request.files.add(aadhaarFrontImageFile);

      var aadhaarBackImageFile = await http.MultipartFile.fromPath(
        'aadhaar_back_image',
        _aadhaarBackImage!.path,
        contentType: MediaType('image', 'jpeg'),
      );
      request.files.add(aadhaarBackImageFile);

      var response = await request.send();

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('KYC images uploaded successfully')),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to upload images')));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error uploading images: $e')));
    } finally {
      setLoading(false);
    }
  }
}
