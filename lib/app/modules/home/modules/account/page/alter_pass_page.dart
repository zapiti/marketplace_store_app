import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_entregador/app/utils/theme/app_theme_utils.dart';

import '../account_controller.dart';

class AlterPassPage extends StatefulWidget {
  @override
  _AlterPassPageState createState() => _AlterPassPageState();
}

class _AlterPassPageState
    extends ModularState<AlterPassPage, AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Alterar senha"),
          centerTitle: true,
        ),
        body:SingleChildScrollView(child:  Column(
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
                  "Digite sua senha atual para definir sua nova senha de acesso",
                  style: AppThemeUtils.normalSize(fontSize: 16),
                )),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                
                child: StreamBuilder<bool>(
                    stream: controller.showPassActual.stream,
                    initialData: true,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshotHide) {
                      return TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(24),
                          ],
                          obscureText: snapshotHide.data,
                          controller: controller.controllerPassActualPass,
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          onChanged: (text) {},
                          onSubmitted: (term) {},
                          decoration: InputDecoration(
                              labelText: "Senha atual",
                              suffixIcon: IconButton(
                                icon: Icon(
                                  snapshotHide.data
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: AppThemeUtils.colorPrimary,
                                ),
                                onPressed: () {
                                  controller.showPassActual.sink
                                      .add(!snapshotHide.data);
                                },
                              ),
                              border: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.3),
                              )));
                    })),
            SizedBox(
              height: 10,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
       
                child: StreamBuilder<bool>(
                    stream: controller.showPass.stream,
                    initialData: true,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshotHide) {
                      return TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(24),
                          ],
                          obscureText: snapshotHide.data,
                          controller: controller.controllerPass,
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          onChanged: (text) {
                            controller.updatePass(text, context);
                          },
                          onSubmitted: (term) {},
                          decoration: InputDecoration(

                              labelText: "Nova senha",
                              suffixIcon: IconButton(
                                icon: Icon(
                                  snapshotHide.data
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: AppThemeUtils.colorPrimary,
                                ),
                                onPressed: () {
                                  controller.showPass.sink
                                      .add(!snapshotHide.data);
                                },
                              ),
                              border: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.3),
                              )));
                    })),
            SizedBox(
              height: 5,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                
                child: StreamBuilder<bool>(
                    stream: controller.showPassConfirm.stream,
                    initialData: true,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshotShowHide2) {
                      return TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(24),
                          ],
                          obscureText: snapshotShowHide2.data ?? true,
                          controller: controller.controllerConfirmPass,
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          onSubmitted: (term) {},
                          decoration: InputDecoration(

                              labelText: "Confirmar nova senha",
                              suffixIcon: IconButton(
                                icon: Icon(
                                  snapshotShowHide2.data
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: AppThemeUtils.colorPrimary,
                                ),
                                onPressed: () {
                                  controller.showPassConfirm.sink
                                      .add(!snapshotShowHide2.data);
                                },
                              ),
                              border: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.3),
                              )));
                    })),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppThemeUtils.colorPrimary),
                  child: Text(
                    "ALTERAR SENHA",
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
