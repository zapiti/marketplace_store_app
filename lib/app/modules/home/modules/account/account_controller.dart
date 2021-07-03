import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/models/page/response_paginated.dart';
import 'package:marketplace_store_app/app/modules/home/modules/account/repository/account_repository.dart';
import 'package:rxdart/rxdart.dart';

class AccountController extends Disposable {
  final _repository = AccountRepository();

  var showPassActual = BehaviorSubject<bool>.seeded(true);
  var showPass = BehaviorSubject<bool>.seeded(true);
  var showPassConfirm = BehaviorSubject<bool>.seeded(true);
  final walletInfo = BehaviorSubject<ResponsePaginated?>();

  var controllerPass = TextEditingController();
  var controllerConfirmPass = TextEditingController();
  var controllerPassActualPass = TextEditingController();

  @override
  void dispose() {
    showPassActual.drain();
    showPass.drain();
    showPassConfirm.drain();
    walletInfo.drain();
  }

  getWalletInfo() async {
    walletInfo.sink.add(null);
    var response = await _repository.getWalletInfo();
    walletInfo.sink.add(response);
  }

  void updatePass(String text, BuildContext context) {}
}
