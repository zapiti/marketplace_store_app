import 'dart:async';
import 'dart:convert';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/core/auth/auth_repository_interface.dart';
import 'package:marketplace_store_app/app/core/request_core.dart';
import 'package:marketplace_store_app/app/models/current_user.dart';
import 'package:marketplace_store_app/app/models/page/response_paginated.dart';
import 'package:marketplace_store_app/app/models/user_entity.dart';
import 'package:marketplace_store_app/app/routes/constants_routes.dart';
import 'package:marketplace_store_app/app/utils/preferences/local_data_store.dart';


import '../../../app_bloc.dart';

class AuthRepository implements IAuthRepository {
  static const SERVICELOGIN = "/api/estab/auth/login";
  var _requestManager = Modular.get<RequestCore>();

  @override
  Future<ResponsePaginated?> getLogin({String? username, String? password}) async {
    var result = await _requestManager.requestWithTokenToForm(
      serviceName: SERVICELOGIN,
      body: {"username": username, "password": password},
      funcFromMap: (data) => data,
      typeRequest: TYPEREQUEST.POST,
    );
    if (result?.error == null) {
      if((result?.data ?? '').toString().contains("access_token")){
        var token = result?.data["access_token"];
        var current = CurrentUser.fromMap(Jwt.parseJwt(token));
        var appBloc = Modular.get<AppBloc>();
        appBloc.currentUser.sink.add(current!);
        _setToken(token);
      }

    }

    return result;

    // if (AppConfiguration.isMockDevTest) {
    //   return ResponsePaginated(error: "error erro errro");
    // } else {
    //   // codePreferences.set(key: UserEntity.KID, value: "teste");
    //   return ResponsePaginated(error: "error erro errro");
    // }
  }

  Future<String> _setToken(String  token) async {

    return await LocalDataStore.setData(
        key: UserEntity.USERLOG, value: token);
  }

  @override
  Future<String?> getToken() async {
    var user = await LocalDataStore.getValue(key: UserEntity.USERLOG);
    if (user == null) {
      return null;
    } else {
       return user;
    }
  }

  @override
  Future<ResponsePaginated> getLogout() async {

      Modular.to.pushReplacementNamed(ConstantsRoutes.LOGIN);

      LocalDataStore.deleteAll();
    return ResponsePaginated(data: []);
  }

  Future<void> setToken(CurrentUser currentUser) async {
    var user = currentUser.toMap();
    return await LocalDataStore.setData(
        key: UserEntity.USERLOG, value: jsonEncode(user));
  }
}
