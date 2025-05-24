import 'package:new_marketplace_app/app/models/current_user.dart';
import 'package:new_marketplace_app/app/models/page/response_paginated.dart';

abstract class IAuthRepository {
  Future<ResponsePaginated?> getLogin({String username, String password});
  Future<String?> getToken();
  Future<ResponsePaginated?>  getLogout();
}
