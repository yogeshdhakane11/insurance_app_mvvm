abstract class BaseApiService {
  // FORM DATA SEND WITHOUT ENCODE
  Future<dynamic> getPostFormDataApiResponse(String url, dynamic body);

  // GET API Response
  Future<dynamic> getGetApiResponse(String url);

  // GET DATA USING POST REQUEST BODY
  Future<dynamic> getPostApiResponse(String url, dynamic body);

  // Multipart Request send post API (added method)
  Future<dynamic> getMultipartPostApiResponse(String url, dynamic body);

  // Uncomment when needed
  // Future<dynamic> getDeleteApiResponse(String url, {String? token});

  // GET DATA USING POST REQUEST TOKEN URL BODY
  // Future<dynamic> getGetApiResponse(String url, dynamic body, {String? token});

  // PATCH BODY DATA SEND WITH JSON ENCODE
  // Future<dynamic> getPatchApiResponse(String url, dynamic body, {String? token});
}
