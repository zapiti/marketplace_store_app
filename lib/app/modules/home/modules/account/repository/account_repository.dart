import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/core/request_core.dart';
import 'package:marketplace_store_app/app/models/page/response_paginated.dart';
import 'package:marketplace_store_app/app/modules/home/modules/account/model/wallet_data.dart';

class AccountRepository {
  var _requestManager = Modular.get<RequestCore>();
  final String serviceName = "/api/establishment/getWallet";

  Future<ResponsePaginated> getWalletInfo({int page = 0}) async {
    return await _requestManager.requestWithTokenToForm(
      serviceName: serviceName,
      isObject: true,
      funcFromMap: (data) => WalletData.fromMap(data),
      typeRequest: TYPEREQUEST.GET,
    );
  }
}
