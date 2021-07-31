import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/component/builder/builder_component.dart';
import 'package:marketplace_store_app/app/models/page/response_paginated.dart';
import 'package:marketplace_store_app/app/modules/home/modules/account/model/bank_account.dart';
import 'package:marketplace_store_app/app/utils/theme/app_theme_utils.dart';

import '../account_controller.dart';

class AlterBankPage extends StatefulWidget {
  @override
  _AlterBankPageState createState() => _AlterBankPageState();
}

class _AlterBankPageState
    extends ModularState<AlterBankPage, AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Cadastre sua conta bancária"),
      // leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: Colors.black),
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //       this.dispose();
      //     }),
      centerTitle: true,
    );
  }

  Widget buildBody() {
    return builderComponent<ResponsePaginated?>(
      stream: controller.accountInfo.stream,
      buildBodyFunc: (context, response) => buildBodyPage(),
    );
  }

  SingleChildScrollView buildBodyPage() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitleDescription(),
          buildCPFCNPJTextField(),
          buildBankTextField(),
          buildAccountTextField(),
          buildAgencyTextField(),
          buildAddAccountButton(),
        ],
      ),
    );
  }

  Container buildTitleDescription() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Text(
        "Para receber o saldo, preencha os campos com sua conta",
        style: AppThemeUtils.normalSize(fontSize: 16),
      ),
    );
  }

  Container buildCPFCNPJTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(24),
        ],
        controller: controller.controllerCPFCNPJ,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        onChanged: (text) {},
        onSubmitted: (term) {},
        decoration: InputDecoration(
          labelText: "CPF/CNPJ",
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.3),
          ),
        ),
      ),
    );
  }

  Container buildBankTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(24),
        ],
        controller: controller.controllerBankName,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        onChanged: (text) {},
        onSubmitted: (term) {},
        decoration: InputDecoration(
          labelText: "Banco",
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.3),
          ),
        ),
      ),
    );
  }

  Container buildAccountTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(24),
        ],
        controller: controller.controllerAccountNumber,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        onChanged: (text) {},
        onSubmitted: (term) {},
        decoration: InputDecoration(
          labelText: "Conta",
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.3),
          ),
        ),
      ),
    );
  }

  Container buildAgencyTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(24),
        ],
        controller: controller.controllerAgency,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        onChanged: (text) {},
        onSubmitted: (term) {},
        decoration: InputDecoration(
          labelText: "Agência",
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.3),
          ),
        ),
      ),
    );
  }

  Container buildAddAccountButton() {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: AppThemeUtils.colorPrimary),
          child: Text(
            controller.buttonText.value,
            style: AppThemeUtils.normalSize(color: AppThemeUtils.whiteColor),
          ),
          onPressed: () {
            // controller.createAccount();
            controller.createOrUpdateAccount(context);
          },
        ),
      ),
    );
  }
}
