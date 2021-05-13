import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/utils/theme/app_theme_utils.dart';

import '../account_controller.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends ModularState<HelpPage, AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ajuda"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Text(
                  "Olá, Nos conte em detalhes sobre o que precisa de ajuda.",
                  style: AppThemeUtils.normalSize(fontSize: 16),
                )),

            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(24),
                    ],
                    controller: controller.controllerConfirmPass,
                    textAlign: TextAlign.start,
                    maxLines: 5,
                    textAlignVertical: TextAlignVertical.center,
                    onSubmitted: (term) {},
                    decoration: InputDecoration(
                        labelText: "Digite aqui",
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
                    "ENVIAR",
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
