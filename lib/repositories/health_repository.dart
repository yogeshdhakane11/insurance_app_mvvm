import '../data/network/BaseApiServises.dart';
import '../data/network/NetworkApiServises.dart';
import '../data/network/api_endpoints.dart';

class HealthRepository {
  // Create object of BaseApiService class for NetworkApiServices
  BaseApiService _baseApiService = NetworkApiServices();

  // Health Api Repository function
  Future<dynamic> healthRegisterApi(dynamic body) async {
    try {
      dynamic response = await _baseApiService.getPostFormDataApiResponse(
        AppUrl.healthurl,
        body,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }

  // Health Api Repository function
  Future<dynamic> healthGetUserDetailsApi(dynamic body) async {
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

  // Health Card Premium Sum Insured
  Future<dynamic> getPremiumForSumInsured(dynamic body) async {
    try {
      dynamic response = await _baseApiService.getPostApiResponse(
        AppUrl.healthPremiumUrl,
        body,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }
}
