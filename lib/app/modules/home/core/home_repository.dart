

import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_entregador/app/core/request_core.dart';

class HomeRepository {

  acceptTerm() async {
    var _requestManager = Modular.get<RequestCore>();
    var result = await _requestManager.requestWithTokenToForm(
      serviceName: "/user/term/assign",
      body: {},
      isObject: false,
      funcFromMap: (data) => data,
      typeRequest: TYPEREQUEST.POST,
    );
    return result;
  }
}