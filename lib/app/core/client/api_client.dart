import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_app/app/configuration/app_configuration.dart';
import 'package:new_marketplace_app/app/core/auth/auth_repository_interface.dart';
import '../../app_bloc.dart';

class ApiClient {
  var _dio = Modular.get<Dio>();
  var _authToken = Modular.get<IAuthRepository>();
  var appBloc = Modular.get<AppBloc>();

  ///Configura a otilizacao da api para fazer requisicao
  Future<Dio> getApiClient() async {
    var user = await _authToken.getToken();
    var baseUrl = (AppConfiguration.baseUrl());
    try {
      _dio.interceptors.clear();
      _dio.options.baseUrl = baseUrl;
      print("Url=> $baseUrl");
      _dio.interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions options,handler) {
        // Do something before request is sent
        var header = getHeaderToken(token: user);
        options.headers = header;

        options.connectTimeout = Duration(milliseconds: 15 * 1000); // 15 seconds
        options.receiveTimeout = Duration(milliseconds: 15 * 1000); // 15 seconds

        handler.next(options);
      }, onResponse: (Response response,handler) {
        handler.next(response);
      }, onError: (DioError error,handler) async {
        // Do something with response error
        if (error.response?.statusCode == 403) {
          // _dio.interceptors.requestLock.lock();
          // _dio.interceptors.responseLock.lock();
          // print("refresh token");
          // final refreshToken = await appBloc.getCurrentUserFutureValue();
          // RequestOptions options = error.response.request;
          // var header = getHeaderToken(token: refreshToken?.token);
          //
          // var url = await AppConfiguration.baseUrl();
          // final response = await http.get(url + "backoffice-api/user/token/refresh", headers: {
          //   'Authorization': 'Bearer ${refreshToken?.token}'
          // }).timeout(Duration(seconds: 15));
          // var responseData = response?.body != null && response?.body != ""
          //     ? jsonDecode(response?.body)
          //     : {};
          // var statusCode = response?.statusCode;
          // _dio.interceptors.responseLock.unlock();
          // _dio.interceptors.requestLock.unlock();
          // if (statusCode == 200) {
          //   appBloc.setTokenUser(responseData["token"]);
          //   // appBloc.setRefreshTokenUser(responseData["refresh_token"]);
          //
          //   var headers = getHeaderToken(token: responseData["token"]);
          //
          //   options.headers.clear();
          //   options.headers = headers;
        }
        // A API dio >= 5.0.0 não utiliza mais responseLock e requestLock
        handler.next(error);
      }));
    } catch (e) {}
    return _dio;
  }

  static Map<String, String> getHeaderToken({String? token}) {
    if (token == null) {
      return <String, String>{
        'content-Type': 'application/json',
        'accept': 'application/json',
      };
    } else {
      return <String, String>{
        'content-Type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
    }
  }
}
