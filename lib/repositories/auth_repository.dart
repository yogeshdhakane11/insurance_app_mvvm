import '../data/network/BaseApiServises.dart';
import '../data/network/NetworkApiServises.dart';
import '../data/network/api_endpoints.dart';

class AuthRepository {
  // BaseApiService _baseApiService = new NetworkApiServices();
  BaseApiService _baseApiService = NetworkApiServices();

  // Login Api Repository function
  Future<dynamic> loginApi(dynamic body) async {
    try {
      dynamic response = await _baseApiService.getPostApiResponse(
        AppUrl.loginurl,
        body,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }

  // SingUp Api Repository function
  Future<dynamic> singUpApi(dynamic body) async {
    try {
      dynamic response = await _baseApiService.getPostApiResponse(
        AppUrl.singupurl,
        body,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }
}
