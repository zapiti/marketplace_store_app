import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_app/app/core/request_core.dart';
import 'package:new_marketplace_app/app/models/current_user.dart';
import 'package:new_marketplace_app/app/models/page/response_paginated.dart';
import 'package:new_marketplace_app/app/models/store/store.dart';

class LoginRepository {
  static RequestCore _requestManager = Modular.get();

  static Future<ResponsePaginated?> sendRecoverEmail(
      {required String email}) async {
    var result = await _requestManager.requestWithTokenToForm(
      serviceName: "/user/password/reset?email=$email",
      isObject: true,
      funcFromMap: (data) => data["message"]?.toString(),
      typeRequest: TYPEREQUEST.POST,
    );

    return result;
  }

  static Future<ResponsePaginated?> registerStore(Store store) async {
    var result = await _requestManager.requestWithTokenToForm(
      serviceName: "/api/establishment",
      isObject: true,body: store.toMap(),
      funcFromMap: (data) => data,
      typeRequest: TYPEREQUEST.POST,
    );

    return result;
  }

  static Future<ResponsePaginated?> getCurrentUser() async {
    var result = await _requestManager.requestWithTokenToForm(
      serviceName: "/api/establishment/user/logged",
      isObject: true,body: {},
      funcFromMap: (data) => CurrentUser.fromMap(data) ,
      typeRequest: TYPEREQUEST.GET,
    );

    return result;
  }
}
