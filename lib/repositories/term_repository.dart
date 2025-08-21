import '../data/network/BaseApiServises.dart';
import '../data/network/NetworkApiServises.dart';
import '../data/network/api_endpoints.dart';

class TermRepository {
  // Create object of BaseApiService class for NetworkApiServices
  BaseApiService _baseApiService = NetworkApiServices();

  // Term Register Api Repository function
  Future<dynamic> termRegisterApi(dynamic body) async {
    try {
      dynamic response = await _baseApiService.getPostFormDataApiResponse(
        AppUrl.termurl,
        body,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }

  // Term Get Api Repository function
  Future<dynamic> termGetUserDetailsApi(dynamic body) async {
    try {
      dynamic response = await _baseApiService.getPostFormDataApiResponse(
        AppUrl.termurl,
        body,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }
}
