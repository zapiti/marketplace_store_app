import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
        appBar: AppBar(
          title: Text("Cadastre sua conta bancária"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //     margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            //     child: Text(
            //       "Alter Senha",
            //       style: AppThemeUtils.normalBoldSize(fontSize: 18),
            //     )),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Text(
                  "Para receber o saldo, preencha os campos com sua conta",
                  style: AppThemeUtils.normalSize(fontSize: 16),
                )),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(24),
                    ],
                    controller: controller.controllerPassActualPass,
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.center,
                    onChanged: (text) {},
                    onSubmitted: (term) {},
                    decoration: InputDecoration(
                        labelText: "CPF/CNPJ",
                        border: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.3),
                        )))),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(24),
                    ],
                    controller: controller.controllerPassActualPass,
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.center,
                    onChanged: (text) {},
                    onSubmitted: (term) {},
                    decoration: InputDecoration(
                        labelText: "Banco",
                        border: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.3),
                        )))),

            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(24),
                    ],
                    controller: controller.controllerPassActualPass,
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.center,
                    onChanged: (text) {},
                    onSubmitted: (term) {},
                    decoration: InputDecoration(
                        labelText: "Conta",
                        border: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.3),
                        )))),

            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(24),
                    ],
                    controller: controller.controllerPassActualPass,
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.center,
                    onChanged: (text) {},
                    onSubmitted: (term) {},
                    decoration: InputDecoration(
                        labelText: "Agência",
                        border: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.3),
                        )))),

            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppThemeUtils.colorPrimary),
                  child: Text(
                    "ADICIONAR CONTA",
                    style: AppThemeUtils.normalSize(
                        color: AppThemeUtils.whiteColor),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        )));
  }
}
