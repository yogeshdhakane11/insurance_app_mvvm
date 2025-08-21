import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

import '../app_exception.dart';
import 'BaseApiServises.dart';

class NetworkApiServices extends BaseApiService {
  // POST API FORM data use this post api Authentication
  @override
  Future getPostFormDataApiResponse(String url, dynamic body) async {
    dynamic responseJson;
    try {
      Response response = await http
          .post(Uri.parse(url), body: body)
          .timeout(const Duration(seconds: 10));
      // response body
      print("Network Api Service Response : ${response.body}");
      // class call returnResponse method
      responseJson = returnResponseMethod(response);
    } on SocketException {
      throw FeatchDataException('No Internet Connection');
    }
    return responseJson;
  }

  // POST DATA WITH BODY added
  @override
  Future getPostApiResponse(String url, dynamic body) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: jsonEncode(body), // Ensure you're sending the body as JSON
            headers: {
              'Content-Type': 'application/json',
            }, // Set content type as JSON
          )
          .timeout(const Duration(seconds: 10));

      print("✅ Status Code NetworkApiService: ${response.statusCode}");
      print("✅ Response Body NetworkApiService: ${response.body}");

      responseJson = returnResponseMethod(response);
    } on TimeoutException {
      throw FeatchDataException('Timeout occurred');
    } on SocketException {
      throw FeatchDataException('No Internet');
    }
    return responseJson;
  }

  // Get Response
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      Response response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 10));
      // response body
      print("Network Api Service Response : ${response.body}");
      // class call returnResponse method
      responseJson = returnResponseMethod(response);
    } on SocketException {
      throw FeatchDataException('No Internet Connection');
    }
    return responseJson;
  }

  // Multipart POST Request for File Upload
  @override
  Future getMultipartPostApiResponse(String url, body) async {
    try {
      // Create a multipart request
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Add form fields (non-file data) to the request
      if (body is Map) {
        body.forEach((key, value) async {
          if (value is File) {
            // If value is a File (image, document), send it as a MultipartFile
            request.files.add(
              await http.MultipartFile.fromPath(
                key,
                value.path,
                contentType: MediaType(
                  'image',
                  'jpeg',
                ), // Adjust MIME type as per the file type
              ),
            );
          } else if (value is String) {
            // If value is a String, add it as a form field
            request.fields[key] = value;
          }
        });
      }

      // Send the request
      var response = await request.send();

      // If the status code is 200, get the response and return it as a string
      if (response.statusCode == 200) {
        return await response.stream.bytesToString();
      } else {
        return 'Failed to upload. Status code: ${response.statusCode}';
      }
    } on SocketException {
      throw FeatchDataException('No Internet Connection');
    } on TimeoutException {
      throw FeatchDataException('Request Timeout');
    } catch (e) {
      throw FeatchDataException('Error: $e');
    }
  }

  // GET API TOKEN URL BODY
  // @override
  // Future getGetApiResponse(String url, dynamic body, {String? token}) async {
  //   dynamic responseJson;
  //   try {
  //     final response = await http
  //         .post(
  //           Uri.parse(url),
  //           body: jsonEncode(body), // ✅ Encode body as JSON
  //           headers: {
  //             'Content-Type': 'application/json',
  //             if (token != null) 'Authorization': 'jwt $token',
  //           },
  //         )
  //         .timeout(const Duration(seconds: 10));
  //
  //     print("Network Api Service Response : ${response.body}");
  //     responseJson = returnResponseMethod(response);
  //   } on TimeoutException {
  //     throw FeatchDataException('Time Out Exception');
  //   } on SocketException {
  //     throw FeatchDataException('No Internet Connection');
  //   }
  //   return responseJson;
  // }

  // PUT API jsonEncode body json data PROFILE
  // @override
  // Future getPatchApiResponse(String url, dynamic body, {String? token}) async {
  //   dynamic responseJson;
  //   try {
  //     final response = await http
  //         .put(
  //           Uri.parse(url),
  //           body: jsonEncode(body), // ✅ Encode body as JSON
  //           headers: {
  //             'Content-Type': 'application/json',
  //             if (token != null) 'Authorization': 'jwt $token',
  //           },
  //         )
  //         .timeout(const Duration(seconds: 20));
  //
  //     print("Network Api Service PUT Response: ${response.body}");
  //     responseJson = returnResponseMethod(response);
  //   } on SocketException {
  //     throw FeatchDataException('No Internet Connection');
  //   } on TimeoutException {
  //     throw FeatchDataException('Request Timed Out');
  //   }
  //   return responseJson;
  // }

  // Post API body send direct response
  // @override
  // Future getPostApiResponse(String url, dynamic body) async {
  //   dynamic responseJson;
  //   try {
  //     final response = await http
  //         .post(Uri.parse(url))
  //         .timeout(const Duration(seconds: 10));
  //
  //     print("✅ Status Code NetworkApiService: ${response.statusCode}");
  //     print("✅ Response Body NetworkApiService: ${response.body}");
  //
  //     responseJson = returnResponseMethod(response);
  //   } on TimeoutException {
  //     throw FeatchDataException('Timeout occurred');
  //   } on SocketException {
  //     throw FeatchDataException('No Internet');
  //   }
  //   return responseJson;
  // }

  // Handle Response Method for API Calls
  dynamic returnResponseMethod(http.Response response) {
    switch (response.statusCode) {
      case 102: // Authentication Failed (Could also be 401, depending on API design)
        throw AuthenticationFailedException(response.body.toString());
      case 200: // Success
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201: // Resource Created (e.g., user registration)
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400: // Bad Request (Invalid data sent)
        throw BadRequestException(response.body.toString());
      case 403: // Forbidden Access (Lack of permissions Admin Customer)
        throw ForbiddenException(response.body.toString());
      // url incorrect html page return
      case 404: // Not Found (Resource does not exist)
        throw UnauthorisedException(response.body.toString());
      case 500: // Internal Server Error (Server-side issues)
      default:
        throw FeatchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}',
        );
    }
  }
}
