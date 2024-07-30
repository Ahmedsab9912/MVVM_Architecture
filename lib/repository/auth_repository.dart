import 'package:providerprac/data/network/base-apiServices.dart';
import 'package:providerprac/data/network/network_apiServices.dart';
import 'package:providerprac/res/components/app_url.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetwordApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> regisApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.registerUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
