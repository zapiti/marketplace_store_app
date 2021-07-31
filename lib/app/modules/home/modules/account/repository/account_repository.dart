import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/core/request_core.dart';
import 'package:marketplace_store_app/app/models/page/response_paginated.dart';
import 'package:marketplace_store_app/app/modules/home/modules/account/model/bank_account.dart';
import 'package:marketplace_store_app/app/modules/home/modules/account/model/wallet_data.dart';

class AccountRepository {
  var _requestManager = Modular.get<RequestCore>();
  final String apiEstablismentAccount = "/api/establishment/account";
  final String getWalletServiceName = "/api/establishment/getWallet";
  final String sendHelpMessageService = "/api/establishment/help";
  final String getStablishmentBankAccount =
      "/api/establishment/account/findByLoggedUser";

  Future<ResponsePaginated?> getWalletInfo() async {
    return await _requestManager.requestWithTokenToForm(
      serviceName: getWalletServiceName,
      isObject: true,
      funcFromMap: (data) => WalletData.fromMap(data),
      typeRequest: TYPEREQUEST.GET,
    );
  }

  Future<ResponsePaginated?> getAccount() async {
    return await _requestManager.requestWithTokenToForm(
      serviceName: getStablishmentBankAccount,
      isObject: true,
      funcFromMap: (data) => BankAccount.fromMap(data),
      typeRequest: TYPEREQUEST.GET,
    );
  }

  Future<ResponsePaginated?> sendHelpMessage(String message) async {
    final body = {"message": message};

    return await _requestManager.requestWithTokenToForm(
      serviceName: sendHelpMessageService,
      isObject: true,
      body: body,
      funcFromMap: (data) => (data),
      typeRequest: TYPEREQUEST.POST,
    );
  }

  Future<ResponsePaginated?> createAccount(BankAccount bankAccount) async {
    return await _requestManager.requestWithTokenToForm(
      serviceName: apiEstablismentAccount,
      isObject: true,
      body: bankAccount.toMapForCreate(),
      funcFromMap: (data) => (data),
      typeRequest: TYPEREQUEST.POST,
    );
  }

  Future<ResponsePaginated?> updateAccount(BankAccount bankAccount) async {
    return await _requestManager.requestWithTokenToForm(
      serviceName: apiEstablismentAccount,
      isObject: true,
      body: bankAccount.toMapFromUpdate(),
      funcFromMap: (data) => (data),
      typeRequest: TYPEREQUEST.PUT,
    );
  }
}
