import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/core/request_core.dart';
import 'package:marketplace_store_app/app/models/page/response_paginated.dart';

class LoginRepository {
  static Future<ResponsePaginated> sendRecoverEmail(
      {@required String email}) async {
    RequestCore _requestManager = Modular.get();

    var result = await _requestManager.requestWithTokenToForm(
      serviceName: "/user/password/reset?email=$email",
      isObject: true,
      funcFromMap: (data) => data["message"]?.toString(),
      typeRequest: TYPEREQUEST.POST,
    );

    return result;
  }
}
