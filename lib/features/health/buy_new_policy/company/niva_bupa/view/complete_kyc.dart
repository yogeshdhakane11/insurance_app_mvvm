import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../routes/routes_name.dart';
import '../viewmodel/complete_kyc_viewmodel.dart';

class NivaBupaCompleteKycScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions using MediaQuery
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider<NivaBupaCompleteKycViewModel>(
      create: (context) => NivaBupaCompleteKycViewModel(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: screenWidth * 0.06,
            ), // Responsive icon size
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Complete KYC',
            style: TextStyle(
              fontSize: screenWidth * 0.045,
            ), // Responsive font size
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(
            screenWidth * 0.04,
          ), // Responsive padding (was 16.0)
          child: Consumer<NivaBupaCompleteKycViewModel>(
            builder: (context, viewModel, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(
                      screenWidth * 0.035,
                    ), // Responsive padding (was 14)
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade50,
                      borderRadius: BorderRadius.circular(
                        screenWidth * 0.025,
                      ), // Responsive border radius (was 10)
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.orange,
                          size: screenWidth * 0.06,
                        ), // Responsive icon size
                        SizedBox(
                          width: screenWidth * 0.025,
                        ), // Responsive spacing (was 10)
                        Expanded(
                          child: Text(
                            'Looks like you are not KYC verified! As per IRDAI regulations, KYC verification is mandatory for buying any insurance.',
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                            ), // Responsive font size (was 14)
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ), // Responsive spacing (was 16)
                  // PAN Card Section
                  Container(
                    padding: EdgeInsets.all(
                      screenWidth * 0.04,
                    ), // Responsive padding (was 16)
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        screenWidth * 0.025,
                      ), // Responsive border radius (was 10)
                      border: Border.all(
                        color: Colors.grey,
                        width: screenWidth * 0.00125,
                      ), // Responsive border width (was 0.5)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PAN Card *',
                          style: TextStyle(
                            fontSize:
                                screenWidth *
                                0.04, // Responsive font size (was 16)
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.005,
                        ), // Responsive spacing (was 4)
                        Text(
                          'Upload your PAN card for proof',
                          style: TextStyle(
                            fontSize:
                                screenWidth *
                                0.03, // Responsive font size (was 12)
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.0125,
                        ), // Responsive spacing (was 10)
                        if (viewModel.panImage != null)
                          Row(
                            children: [
                              Image.file(
                                File(viewModel.panImage!.path),
                                width:
                                    screenWidth *
                                    0.25, // Responsive image width (was 100)
                                height:
                                    screenWidth *
                                    0.25, // Responsive image height (was 100)
                                fit: BoxFit.cover,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                  size: screenWidth * 0.06,
                                ), // Responsive icon size
                                onPressed: () => viewModel.cancelPanUpload(),
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
                                  ), // Responsive button size (was 200, 50)
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      screenWidth * 0.025,
                                    ), // Responsive border radius (was 10)
                                  ),
                                ),
                                onPressed: () =>
                                    viewModel.showImagePicker(context, 'pan'),
                                icon: Icon(
                                  Icons.file_upload_outlined,
                                  size:
                                      screenWidth *
                                      0.055, // Responsive icon size (was 22)
                                ),
                                label: Text(
                                  'Upload',
                                  style: TextStyle(
                                    fontSize:
                                        screenWidth *
                                        0.035, // Responsive font size (was 14)
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.005,
                  ), // Responsive spacing (was 4)
                  Column(
                    children: [
                      CheckboxListTile(
                        title: Text(
                          "I don't have PAN. Upload Form 60/61",
                          style: TextStyle(
                            fontSize: screenWidth * 0.037,
                          ), // Responsive font size (was 13)
                        ),
                        activeColor: Colors.blue,
                        value: viewModel.noPan,
                        onChanged: (value) {
                          viewModel.toggleNoPan(value ?? false);
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.005,
                  ), // Responsive spacing (was 4)
                  // Aadhaar Card (Front) Section
                  Container(
                    padding: EdgeInsets.all(
                      screenWidth * 0.04,
                    ), // Responsive padding (was 16)
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        screenWidth * 0.025,
                      ), // Responsive border radius (was 10)
                      border: Border.all(
                        color: Colors.grey,
                        width: screenWidth * 0.00125,
                      ), // Responsive border width (was 0.5)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Aadhaar Card (front) *',
                          style: TextStyle(
                            fontSize:
                                screenWidth *
                                0.04, // Responsive font size (was 16)
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.005,
                        ), // Responsive spacing (was 4)
                        Text(
                          'Upload your Aadhaar (front) for Address proof',
                          style: TextStyle(
                            fontSize:
                                screenWidth *
                                0.03, // Responsive font size (was 12)
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.0125,
                        ), // Responsive spacing (was 10)
                        if (viewModel.aadhaarFrontImage != null)
                          Row(
                            children: [
                              Image.file(
                                File(viewModel.aadhaarFrontImage!.path),
                                width:
                                    screenWidth *
                                    0.25, // Responsive image width (was 100)
                                height:
                                    screenWidth *
                                    0.25, // Responsive image height (was 100)
                                fit: BoxFit.cover,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                  size: screenWidth * 0.06,
                                ), // Responsive icon size
                                onPressed: () =>
                                    viewModel.cancelAadhaarFrontUpload(),
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
                                  ), // Responsive button size (was 200, 50)
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      screenWidth * 0.025,
                                    ), // Responsive border radius (was 10)
                                  ),
                                ),
                                onPressed: () => viewModel.showImagePicker(
                                  context,
                                  'aadhaar_front',
                                ),
                                icon: Icon(
                                  Icons.file_upload_outlined,
                                  size:
                                      screenWidth *
                                      0.055, // Responsive icon size (was 22)
                                ),
                                label: Text(
                                  'Upload',
                                  style: TextStyle(
                                    fontSize:
                                        screenWidth *
                                        0.035, // Responsive font size (was 14)
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01375,
                  ), // Responsive spacing (was 11)
                  // Aadhaar Card (Back) Section
                  Container(
                    padding: EdgeInsets.all(
                      screenWidth * 0.04,
                    ), // Responsive padding (was 16)
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        screenWidth * 0.025,
                      ), // Responsive border radius (was 10)
                      border: Border.all(
                        color: Colors.grey,
                        width: screenWidth * 0.00125,
                      ), // Responsive border width (was 0.5)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Aadhaar Card (back) *',
                          style: TextStyle(
                            fontSize:
                                screenWidth *
                                0.04, // Responsive font size (was 16)
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.005,
                        ), // Responsive spacing (was 4)
                        Text(
                          'Upload your Aadhaar (back) for Address proof',
                          style: TextStyle(
                            fontSize:
                                screenWidth *
                                0.03, // Responsive font size (was 12)
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.0125,
                        ), // Responsive spacing (was 10)
                        if (viewModel.aadhaarBackImage != null)
                          Row(
                            children: [
                              Image.file(
                                File(viewModel.aadhaarBackImage!.path),
                                width:
                                    screenWidth *
                                    0.25, // Responsive image width (was 100)
                                height:
                                    screenWidth *
                                    0.25, // Responsive image height (was 100)
                                fit: BoxFit.cover,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                  size: screenWidth * 0.06,
                                ), // Responsive icon size
                                onPressed: () =>
                                    viewModel.cancelAadhaarBackUpload(),
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
                                  ), // Responsive button size (was 200, 50)
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      screenWidth * 0.025,
                                    ), // Responsive border radius (was 10)
                                  ),
                                ),
                                onPressed: () => viewModel.showImagePicker(
                                  context,
                                  'aadhaar_back',
                                ),
                                icon: Icon(
                                  Icons.file_upload_outlined,
                                  size:
                                      screenWidth *
                                      0.055, // Responsive icon size (was 22)
                                ),
                                label: Text(
                                  'Upload',
                                  style: TextStyle(
                                    fontSize:
                                        screenWidth *
                                        0.035, // Responsive font size (was 14)
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01375,
                  ), // Responsive spacing (was 11)
                  // Aadhaar Details Section
                  SizedBox(
                    height: screenHeight * 0.01375,
                  ), // Responsive spacing (was 11)
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Aadhaar Number',
                      hintText: 'Aadhaar Number',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.credit_card,
                        size: screenWidth * 0.06,
                      ), // Responsive icon size
                      labelStyle: TextStyle(
                        fontSize: screenWidth * 0.035,
                      ), // Responsive label font size
                      hintStyle: TextStyle(
                        fontSize: screenWidth * 0.035,
                      ), // Responsive hint font size
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 12,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Aadhaar Number';
                      } else if (value.length != 12) {
                        return 'Aadhaar Number must be 12 digits';
                      }
                      return null;
                    },
                    onChanged: (value) {},
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                    ), // Responsive font size
                  ),
                  SizedBox(
                    height: screenHeight * 0.01375,
                  ), // Responsive spacing (was 11)
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Father First Name',
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                              fontSize: screenWidth * 0.035,
                            ), // Responsive label font size
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Father First Name';
                            }
                            return null;
                          },
                          onChanged: (value) {},
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                          ), // Responsive font size
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.02,
                      ), // Responsive spacing (was 8)
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Father Middle Name',
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                              fontSize: screenWidth * 0.035,
                            ), // Responsive label font size
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Father Middle Name';
                            }
                            return null;
                          },
                          onChanged: (value) {},
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                          ), // Responsive font size
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.025,
                  ), // Responsive spacing (was 20)
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Father Last Name',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(
                        fontSize: screenWidth * 0.035,
                      ), // Responsive label font size
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Father Last Name';
                      }
                      return null;
                    },
                    onChanged: (value) {},
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                    ), // Responsive font size
                  ),
                  SizedBox(
                    height: screenHeight * 0.01375,
                  ), // Responsive spacing (was 11)
                  // Message
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size:
                            screenWidth * 0.06, // Responsive icon size (was 24)
                      ),
                      SizedBox(
                        width: screenWidth * 0.02,
                      ), // Responsive spacing (was 8)
                      Expanded(
                        child: Text(
                          'I as a responsible proposer hereby confirm that soft copy of KYC documents uploaded with this application are authentic & not fake/forged. I have seen & verified original document or have reasonable grounds/procedures in place to ensure soft copy is image of original. In case it is found that forged/wrong documents are uploaded I understand that policy can be terminated with forfeiture of premium after issuance and/or claim can be denied by insurer on the ground of fraud/misrepresentation of material fact.',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize:
                                screenWidth *
                                0.035, // Responsive font size (was 14)
                          ),
                          textAlign: TextAlign.justify,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(
            screenWidth * 0.04,
          ), // Responsive padding (was 16)
          child: Consumer<NivaBupaCompleteKycViewModel>(
            builder: (context, viewModel, child) {
              return ElevatedButton(
                // onPressed: () => viewModel.submitKycImages(context),
                onPressed: () {
                  viewModel.submitKycImages(context);
                  // Navigate
                  Navigator.pushNamed(
                    context,
                    RouteNames.nivaBupaCheckoutScreen,
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                    double.infinity,
                    screenHeight * 0.0625,
                  ), // Responsive button height (was 50)
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      screenWidth * 0.025,
                    ), // Responsive border radius (was 10)
                  ),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                  ), // Responsive font size
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../viewmodel/complete_kyc_viewmodel.dart';
//
// class NivaBupaCompleteKycScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<NivaBupaCompleteKycViewModel>(
//       create: (context) => NivaBupaCompleteKycViewModel(),
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back_ios),
//             onPressed: () => Navigator.pop(context),
//           ),
//           title: Text('Complete KYC'),
//           centerTitle: true,
//         ),
//         body: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           padding: EdgeInsets.all(16.0),
//           child: Consumer<NivaBupaCompleteKycViewModel>(
//             builder: (context, viewModel, child) {
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(14),
//                     decoration: BoxDecoration(
//                       color: Colors.yellow.shade50,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(Icons.info_outline, color: Colors.orange),
//                         SizedBox(width: 10),
//                         Expanded(
//                           child: Text(
//                             'Looks like you are not KYC verified! As per IRDAI regulations, KYC verification is mandatory for buying any insurance.',
//                             style: TextStyle(fontSize: 14),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   // PAN Card Section
//                   Container(
//                     padding: EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: Colors.grey, width: 0.5),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'PAN Card *',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 4),
//                         Text(
//                           'Upload your PAN card for proof',
//                           style: TextStyle(fontSize: 12, color: Colors.grey),
//                         ),
//                         SizedBox(height: 10),
//                         if (viewModel.panImage != null)
//                           Row(
//                             children: [
//                               Image.file(
//                                 File(viewModel.panImage!.path),
//                                 width: 100,
//                                 height: 100,
//                                 fit: BoxFit.cover,
//                               ),
//                               IconButton(
//                                 icon: Icon(Icons.cancel, color: Colors.red),
//                                 onPressed: () => viewModel.cancelPanUpload(),
//                               ),
//                             ],
//                           )
//                         else
//                           Row(
//                             children: [
//                               ElevatedButton.icon(
//                                 style: ElevatedButton.styleFrom(
//                                   minimumSize: Size(200, 50),
//                                   backgroundColor: Colors.blue,
//                                   foregroundColor: Colors.white,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                 ),
//                                 onPressed: () =>
//                                     viewModel.showImagePicker(context, 'pan'),
//                                 icon: Icon(
//                                   Icons.file_upload_outlined,
//                                   size: 22,
//                                 ),
//                                 label: Text(
//                                   'Upload',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 4),
//                   Column(
//                     children: [
//                       CheckboxListTile(
//                         title: Text(
//                           "I don't have PAN. Upload Form60/61",
//                           style: TextStyle(fontSize: 13),
//                         ),
//                         value: viewModel.noPan,
//                         onChanged: (value) {
//                           viewModel.toggleNoPan(value ?? false);
//                         },
//                         controlAffinity: ListTileControlAffinity
//                             .leading, // Places checkbox before the text
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 4),
//                   // Aadhaar Card (Front) Section
//                   Container(
//                     padding: EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: Colors.grey, width: 0.5),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Aadhaar Card (front) *',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 4),
//                         Text(
//                           'Upload your Aadhaar (front) for Address proof',
//                           style: TextStyle(fontSize: 12, color: Colors.grey),
//                         ),
//                         SizedBox(height: 10),
//                         if (viewModel.aadhaarFrontImage != null)
//                           Row(
//                             children: [
//                               Image.file(
//                                 File(viewModel.aadhaarFrontImage!.path),
//                                 width: 100,
//                                 height: 100,
//                                 fit: BoxFit.cover,
//                               ),
//                               IconButton(
//                                 icon: Icon(Icons.cancel, color: Colors.red),
//                                 onPressed: () =>
//                                     viewModel.cancelAadhaarFrontUpload(),
//                               ),
//                             ],
//                           )
//                         else
//                           Row(
//                             children: [
//                               ElevatedButton.icon(
//                                 style: ElevatedButton.styleFrom(
//                                   minimumSize: Size(200, 50),
//                                   backgroundColor: Colors.blue,
//                                   foregroundColor: Colors.white,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                 ),
//                                 onPressed: () => viewModel.showImagePicker(
//                                   context,
//                                   'aadhaar_front',
//                                 ),
//                                 icon: Icon(
//                                   Icons.file_upload_outlined,
//                                   size: 22,
//                                 ),
//                                 label: Text(
//                                   'Upload',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 11),
//                   // Aadhaar Card (Back) Section
//                   Container(
//                     padding: EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: Colors.grey, width: 0.5),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Aadhaar Card (back) *',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 4),
//                         Text(
//                           'Upload your Aadhaar (back) for Address proof',
//                           style: TextStyle(fontSize: 12, color: Colors.grey),
//                         ),
//                         SizedBox(height: 10),
//                         if (viewModel.aadhaarBackImage != null)
//                           Row(
//                             children: [
//                               Image.file(
//                                 File(viewModel.aadhaarBackImage!.path),
//                                 width: 100,
//                                 height: 100,
//                                 fit: BoxFit.cover,
//                               ),
//                               IconButton(
//                                 icon: Icon(Icons.cancel, color: Colors.red),
//                                 onPressed: () =>
//                                     viewModel.cancelAadhaarBackUpload(),
//                               ),
//                             ],
//                           )
//                         else
//                           Row(
//                             children: [
//                               ElevatedButton.icon(
//                                 style: ElevatedButton.styleFrom(
//                                   minimumSize: Size(200, 50),
//                                   backgroundColor: Colors.blue,
//                                   foregroundColor: Colors.white,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                 ),
//                                 onPressed: () => viewModel.showImagePicker(
//                                   context,
//                                   'aadhaar_back',
//                                 ),
//                                 icon: Icon(
//                                   Icons.file_upload_outlined,
//                                   size: 22,
//                                 ),
//                                 label: Text(
//                                   'Upload',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 11),
//
//                   // Aadhaar Details Section
//                   SizedBox(height: 11),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'Aadhaar Number',
//                       hintText: 'Aadhaar Number', // Hint text added here
//                       border: OutlineInputBorder(
//                         // borderRadius: BorderRadius.circular(12.0),
//                       ),
//                       focusedBorder: OutlineInputBorder(),
//                       prefixIcon: Icon(Icons.credit_card),
//                     ),
//                     keyboardType: TextInputType.number,
//                     maxLength: 12, // Aadhaar Number length
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter Aadhaar Number';
//                       } else if (value.length != 12) {
//                         return 'Aadhaar Number must be 12 digits';
//                       }
//                       return null;
//                     },
//                     onChanged: (value) {
//                       // Optional: you can update a view model or controller here
//                     },
//                   ),
//                   SizedBox(height: 11),
//                   Row(
//                     children: [
//                       // Father First Name Field
//                       Expanded(
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                             labelText: 'Father First Name',
//                             border: OutlineInputBorder(
//                               // borderRadius: BorderRadius.circular(10.0),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter Father First Name';
//                             }
//                             return null;
//                           },
//                           onChanged: (value) {
//                             // Optional: you can update the view model or controller here
//                           },
//                         ),
//                       ),
//                       SizedBox(width: 8), // Space between the two fields
//                       // Father Middle Name Field
//                       Expanded(
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                             labelText: 'Father Middle Name',
//                             border: OutlineInputBorder(
//                               // borderRadius: BorderRadius.circular(10.0),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter Father Middle Name';
//                             }
//                             return null;
//                           },
//                           onChanged: (value) {
//                             // Optional: you can update the view model or controller here
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'Father Last Name',
//                       border: OutlineInputBorder(
//                         // borderRadius: BorderRadius.circular(10.0),
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter Father Last Name';
//                       }
//                       return null;
//                     },
//                     onChanged: (value) {
//                       // Optional: you can update the view model or controller here
//                     },
//                   ),
//                   SizedBox(height: 11),
//
//                   // Massage
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Checkmark Icon
//                       Icon(
//                         Icons.check_circle,
//                         color: Colors.green,
//                         size: 24,
//                       ), // Green checkmark
//                       SizedBox(
//                         width: 8,
//                       ), // Space between the checkmark and the text
//                       Expanded(
//                         child: Text(
//                           'I as a responsible proposer hereby confirm that soft copy of KYC documents uploaded with this application are authentic & not fake/forged. I have seen & verified original document or have reasonable grounds/procedures in place to ensure soft copy is image of original. In case it is found that forged/wrong documents are uploaded I understand that policy can be terminated with forfeiture of premium after issuance and/or claim can be denied by insurer on the ground of fraud/misrepresentation of material fact.',
//                           style: TextStyle(
//                             color: Colors.black87,
//                             fontSize:
//                                 14, // Adjust font size for better readability
//                           ),
//                           textAlign: TextAlign
//                               .justify, // Justify the text for better alignment
//                           softWrap: true, // Allow text to wrap to the next line
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//         bottomNavigationBar: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Consumer<NivaBupaCompleteKycViewModel>(
//             builder: (context, viewModel, child) {
//               return ElevatedButton(
//                 onPressed: () => viewModel.submitKycImages(context),
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(double.infinity, 50),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   backgroundColor: Colors.blue,
//                   foregroundColor: Colors.white,
//                 ),
//                 child: Text('Submit'),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
