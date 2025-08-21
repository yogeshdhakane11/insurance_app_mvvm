import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/complete_kyc_viewmodel.dart';

class CareSupremeCompleteKycScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MediaQuery for responsive sizing
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider<CompleteKycViewModel>(
      create: (context) => CompleteKycViewModel(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, size: screenWidth * 0.055),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Complete KYC',
            style: TextStyle(fontSize: screenWidth * 0.045),
          ),
          centerTitle: true,
        ),
        body: Consumer<CompleteKycViewModel>(
          builder: (context, viewModel, child) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Yellow container for KYC message
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.035),
                      decoration: BoxDecoration(
                        color: Colors.yellow.shade50,
                        borderRadius: BorderRadius.circular(screenWidth * 0.05),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.save_alt_outlined,
                            color: Colors.orange,
                            size: screenWidth * 0.06,
                          ),
                          SizedBox(width: screenWidth * 0.025),
                          Expanded(
                            child: Text(
                              'Looks like you are not KYC verified! As per IRDAI regulations, KYC verification is mandatory for buying any insurance.',
                              style: TextStyle(fontSize: screenWidth * 0.04),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01375),
                    // Identity Proof Container
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.01375,
                        horizontal: screenWidth * 0.04,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          screenWidth * 0.0275,
                        ),
                        border: Border.all(color: Colors.grey, width: 0.2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Identity Proof',
                            style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          Text(
                            'Upload your Aadhar / PAN card for proof',
                            style: TextStyle(
                              fontSize: screenWidth * 0.0325,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01375),
                          // Show file name or image instead of "Upload" button
                          if (viewModel.identityProofImage != null)
                            Row(
                              children: [
                                Image.file(
                                  File(viewModel.identityProofImage!.path),
                                  width: screenWidth * 0.25,
                                  height: screenHeight * 0.125,
                                  fit: BoxFit.cover,
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                    size: screenWidth * 0.06,
                                  ),
                                  onPressed: () {
                                    // Remove the image when "X" is clicked
                                    viewModel.cancelIdentityProofUpload();
                                  },
                                ),
                              ],
                            )
                          else
                            Row(
                              children: [
                                ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(
                                      screenWidth * 0.5,
                                      screenHeight * 0.0625,
                                    ),
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        screenWidth * 0.0275,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    // Show image picker for Identity Proof
                                    viewModel.showImagePicker(
                                      context,
                                      'identity',
                                    );
                                  },
                                  icon: Icon(
                                    Icons.file_upload_outlined,
                                    size: screenWidth * 0.055,
                                  ),
                                  label: Text(
                                    'Upload',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.04,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01375),
                    // Address Proof Container
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.01375,
                        horizontal: screenWidth * 0.04,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          screenWidth * 0.0275,
                        ),
                        border: Border.all(color: Colors.grey, width: 0.2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Address Proof',
                            style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          Text(
                            'Upload your PAN / Driver License / Voters ID for proof',
                            style: TextStyle(
                              fontSize: screenWidth * 0.0325,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.00875),
                          // Show file name or image instead of "Upload" button
                          if (viewModel.addressProofImage != null)
                            Row(
                              children: [
                                Image.file(
                                  File(viewModel.addressProofImage!.path),
                                  width: screenWidth * 0.25,
                                  height: screenHeight * 0.125,
                                  fit: BoxFit.cover,
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                    size: screenWidth * 0.06,
                                  ),
                                  onPressed: () {
                                    // Remove the image when "X" is clicked
                                    viewModel.cancelAddressProofUpload();
                                  },
                                ),
                              ],
                            )
                          else
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(
                                  screenWidth * 0.5,
                                  screenHeight * 0.0625,
                                ),
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    screenWidth * 0.0275,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                // Show image picker for Address Proof
                                viewModel.showImagePicker(context, 'address');
                              },
                              icon: Icon(
                                Icons.file_upload_outlined,
                                size: screenWidth * 0.055,
                              ),
                              label: Text(
                                'Upload',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.025),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Consumer<CompleteKycViewModel>(
            builder: (context, viewModel, child) {
              return ElevatedButton(
                onPressed: () {
                  viewModel.submitKycImages();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, screenHeight * 0.0625),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.0275),
                  ),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
