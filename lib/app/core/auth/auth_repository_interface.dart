import 'package:marketplace_entregador/app/models/current_user.dart';
import 'package:marketplace_entregador/app/models/page/response_paginated.dart';

abstract class IAuthRepository {
  Future<ResponsePaginated> getLogin({String username, String password});
  Future<CurrentUser> getToken();
  Future<ResponsePaginated>  getLogout();
}
