import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/models/page/response_paginated.dart';
import 'package:marketplace_store_app/app/modules/home/modules/account/model/bank_account.dart';
import 'package:marketplace_store_app/app/modules/home/modules/account/repository/account_repository.dart';
import 'package:marketplace_store_app/app/utils/utils.dart';
import 'package:rxdart/rxdart.dart';

class AccountController extends Disposable {
  final _repository = AccountRepository();

  var showPassActual = BehaviorSubject<bool>.seeded(true);
  var showPass = BehaviorSubject<bool>.seeded(true);
  var showPassConfirm = BehaviorSubject<bool>.seeded(true);
  final walletInfo = BehaviorSubject<ResponsePaginated?>();
  final accountInfo = BehaviorSubject<ResponsePaginated?>();

  var controllerPass = TextEditingController();
  var controllerConfirmPass = TextEditingController();
  var controllerPassActualPass = TextEditingController();

  var controllerBankName = TextEditingController();
  var controllerAccountNumber = TextEditingController();
  var controllerAgency = TextEditingController();
  var controllerCPFCNPJ = TextEditingController();

  var buttonText = BehaviorSubject<String>.seeded("CRIAR CONTA");

  BankAccount bankAccount = BankAccount();
  bool hasData = false;

  getWalletInfo() async {
    walletInfo.sink.add(null);
    var response = await _repository.getWalletInfo();
    walletInfo.sink.add(response);
  }

  getAccount() async {
    accountInfo.sink.add(null);
    var response = await _repository.getAccount();
    accountInfo.sink.add(response);

    bankAccount = response?.data;

    hasData = bankAccount.cpfCnpj != null;

    hasData
        ? buttonText.sink.add("ATUALIZAR CONTA")
        : buttonText.sink.add("CRIAR CONTA");

    controllerCPFCNPJ.text = bankAccount.cpfCnpj ?? "";
    controllerBankName.text = bankAccount.bank ?? "";
    controllerAccountNumber.text = bankAccount.account?.toString() ?? "";
    controllerAgency.text = bankAccount.agency?.toString() ?? "";
  }

  createOrUpdateAccount(BuildContext context) {
    hasData ? _updateAccount(context) : _createAccount(context);
  }

  _createAccount(BuildContext context) async {
    BankAccount localbankAccount = BankAccount(
      cpfCnpj: controllerCPFCNPJ.text,
      bank: controllerBankName.text,
      account: int.parse(controllerAccountNumber.text),
      agency: int.parse(controllerAgency.text),
    );

    await _repository.createAccount(localbankAccount);

    // nao to sabendo pegar a mensagem que retornar
    Navigator.pop(context);
    Utils.showSnackbar(context, "Conta Criada");
  }

  _updateAccount(BuildContext context) {
    BankAccount localbankAccount = BankAccount(
      id: bankAccount.id,
      cpfCnpj: controllerCPFCNPJ.text,
      bank: controllerBankName.text,
      account: int.parse(controllerAccountNumber.text),
      agency: int.parse(controllerAgency.text),
    );

    _repository.updateAccount(localbankAccount);
    // nao to sabendo pegar a mensagem que retornar
    Navigator.pop(context);
    Utils.showSnackbar(context, "Conta Atualizada");
  }

  void updatePass(String text, BuildContext context) {}

  @override
  void dispose() {
    showPassActual.drain();
    showPass.drain();
    showPassConfirm.drain();
    walletInfo.drain();
    accountInfo.drain();
    buttonText.drain();
  }
}
