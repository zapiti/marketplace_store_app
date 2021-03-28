import 'dart:async';
import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_entregador/app/core/auth/auth_repository_interface.dart';
import 'package:marketplace_entregador/app/core/request_core.dart';
import 'package:marketplace_entregador/app/models/current_user.dart';
import 'package:marketplace_entregador/app/models/page/response_paginated.dart';
import 'package:marketplace_entregador/app/models/user_entity.dart';
import 'package:marketplace_entregador/app/routes/constants_routes.dart';
import 'package:marketplace_entregador/app/utils/preferences/cd_preferences.dart';
import 'package:marketplace_entregador/app/utils/preferences/local_data_store.dart';

import '../../../app_bloc.dart';

class AuthRepository implements IAuthRepository {
  static const SERVICELOGIN = "/login";
  var _requestManager = Modular.get<RequestCore>();

  @override
  Future<ResponsePaginated> getLogin({String username, String password}) async {
    //
    // username = "leandro.gomes@datatech.page";
    // password = "Abc@123";
    var body = {};
    var result = await _requestManager.requestWithTokenToForm(
      serviceName: SERVICELOGIN + "?username=$username&password=$password",
      body: body,
      funcFromMap: (data) => data,
      typeRequest: TYPEREQUEST.GET,
    );
    if (result.error == null) {
      var user = result.content;
      var current = CurrentUser.fromMap(user);
      var appBloc = Modular.get<AppBloc>();
      appBloc.currentUser.sink.add(current);
      _setUser(current);
    }

    return result;

    // if (AppConfiguration.isMockDevTest) {
    //   return ResponsePaginated(error: "error erro errro");
    // } else {
    //   // codePreferences.set(key: UserEntity.KID, value: "teste");
    //   return ResponsePaginated(error: "error erro errro");
    // }
  }

  Future<String> _setUser(CurrentUser currentUser) async {
    var user = currentUser?.toMap();
    return await codePreferences.set(
        key: UserEntity.USERLOG, value: jsonEncode(user));
  }

  @override
  Future<CurrentUser> getToken() async {
    var user = await codePreferences.getString(key: UserEntity.USERLOG);
    if (user == null) {
      return null;
    } else {
      Map userMap = jsonDecode(user);
      var currentUser = CurrentUser.fromMap(userMap);
      return currentUser;
    }
  }

  @override
  Future<ResponsePaginated> getLogout() async {
    storage.clear().then((value) {
      Modular.to.pushReplacementNamed(ConstantsRoutes.LOGIN);
    });
    return ResponsePaginated();
  }

  Future<void> setToken(CurrentUser currentUser) async {
    var user = currentUser?.toMap();
    return await codePreferences.set(
        key: UserEntity.USERLOG, value: jsonEncode(user));
  }
}
