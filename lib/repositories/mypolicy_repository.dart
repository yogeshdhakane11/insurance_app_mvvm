import '../data/network/BaseApiServises.dart';
import '../data/network/NetworkApiServises.dart';
import '../data/network/api_endpoints.dart';

class MyPolicyRepository {
  // Create object of BaseApiService class for NetworkApiServices
  BaseApiService _baseApiService = NetworkApiServices();

  // MyPolicy InsuranceType
  Future<dynamic> myPolicyRegisterApi(dynamic body) async {
    try {
      dynamic response = await _baseApiService.getPostFormDataApiResponse(
        AppUrl.mypolicyurl,
        body,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }

  // MyPolicy PlanDetails
  Future<dynamic> planDetailsSaveApi(dynamic body) async {
    try {
      dynamic response = await _baseApiService.getPostFormDataApiResponse(
        AppUrl.plandetailsurl,
        body,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }

  // Card API
  Future<dynamic> getCardApi() async {
    try {
      dynamic response = await _baseApiService.getGetApiResponse(
        AppUrl.cardurl,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }
}
