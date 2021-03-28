import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_entregador/app/utils/theme/app_theme_utils.dart';

import '../../login_bloc.dart';

Future<void> showBottomSheetAlterPass(BuildContext context) async {
  return showModalBottomSheet(
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))),
    backgroundColor: Colors.white,
    context: context,
    builder: (context) => _AlterPassBottomSheet(),
  );
}

class _AlterPassBottomSheet extends StatefulWidget {
  _AlterPassBottomSheet();

  @override
  _AlterPassBottomSheetState createState() => _AlterPassBottomSheetState();
}

class _AlterPassBottomSheetState extends State<_AlterPassBottomSheet> {
  var bloc = Modular.get<LoginBloc>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: StreamBuilder<int>(
            stream: bloc.restoreIndex,
            initialData: 0,
            builder: (context, snapshot) {
              var index = snapshot.data;
              return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  iconTheme: IconThemeData(color: AppThemeUtils.colorPrimary),
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  title: Text(
                    "Esqueci minha senha",
                    style: AppThemeUtils.normalSize(
                        color: AppThemeUtils.colorPrimary),
                  ),
                ),
                body: index == 2
                    ? stageThree(context, bloc)
                    : index == 1
                        ? stageTwo(context, bloc)
                        : stageOne(context, bloc),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                floatingActionButton: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      child: Text(index == 2
                          ? "ALTERAR SENHA"
                          : index == 1
                              ? "CONCLUIR"
                              : "CONTINUAR"),
                      style: ElevatedButton.styleFrom(
                          primary: AppThemeUtils.colorPrimary),
                      onPressed: () {
                        bloc.nextActionRestore(() {
                          Navigator.pop(context);
                        });
                      },
                    )),
              );
            }));
  }
}

Widget stageThree(BuildContext context, LoginBloc bloc) {
  return SingleChildScrollView(
    child: Container(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width:
                              MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(
                                  top: 10, right: 10, left: 10),
                              child: Text(
                                "Nova senha",
                                style: AppThemeUtils.normalBoldSize(
                                    fontSize: 18),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 10, right: 10, left: 10),
                              child: Text(
                                "Digite uma nova senha para acessar o seu aplicativo.",
                                style: AppThemeUtils.normalSize(
                                    fontSize: 16),
                              )),
                          StreamBuilder<bool>(
                              stream: bloc.showPass.stream,
                              initialData: false,
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic>
                                  snapshot) =>
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 20,
                                          left: 10,
                                          right: 10),
                                      child: TextField(

                                        obscureText: snapshot.data,
                                        controller:
                                        bloc.passController,
                                        onChanged: (text) {

                                        },
                                        decoration: InputDecoration(

                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                snapshot.data
                                                    ? Icons.visibility
                                                    : Icons
                                                    .visibility_off,
                                                color: AppThemeUtils
                                                    .colorPrimaryDark,
                                              ),
                                              onPressed: () {
                                                bloc.showPass.sink
                                                    .add(!snapshot
                                                    .data);
                                              },
                                            ),
                                            border:
                                            OutlineInputBorder(
                                                borderSide:
                                                BorderSide()),
                                            labelText: 'Senha'),
                                      ))),
                          StreamBuilder<bool>(
                              stream: bloc.showPassConfirm.stream,
                              initialData: false,
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic>
                                  snapshot) =>
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 20,
                                          left: 10,
                                          right: 10),
                                      child: TextField(

                                        obscureText: snapshot.data,
                                        controller: bloc
                                            .passControllerConfirm,
                                        onChanged: (text) {

                                        },
                                        decoration: InputDecoration(

                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                snapshot.data
                                                    ? Icons.visibility
                                                    : Icons
                                                    .visibility_off,
                                                color: AppThemeUtils
                                                    .colorPrimaryDark,
                                              ),
                                              onPressed: () {
                                                bloc.showPassConfirm
                                                    .sink
                                                    .add(!snapshot
                                                    .data);
                                              },
                                            ),
                                            border:
                                            OutlineInputBorder(
                                                borderSide:
                                                BorderSide()),
                                            labelText: 'Confirmar Senha'),
                                      ))),

                        ],
                      )),
                ),
              ),
            ),
          ],
        )),
  );
}

Widget stageTwo(BuildContext context, LoginBloc bloc) {
  return SingleChildScrollView(
      child: Container(
          padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding:
                                  EdgeInsets.only(top: 10, right: 10, left: 10),
                                  child: Text(
                                    "Código de verificação",
                                    style:
                                    AppThemeUtils.normalBoldSize(fontSize: 18),
                                  )),
                              Padding(
                                  padding:
                                  EdgeInsets.only(top: 10, right: 10, left: 10),
                                  child: Text(
                                    "Insira o código enviado para ${bloc.emailController.text} no campo abaixo:",
                                    style: AppThemeUtils.normalSize(fontSize: 16),
                                  )),
                              Padding(
                                  padding:
                                  EdgeInsets.only(top: 20, left: 10, right: 10),
                                  child: TextField(
                                    controller: bloc.codeController,
                                    onChanged: (text) {},
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide()),
                                        labelText: 'Código de verificação'),
                                  )),
                            ],
                          )),
                    ),
                  ),
                ),
              ])));
}

Widget stageOne(BuildContext context, LoginBloc bloc) {
  return SingleChildScrollView(
      child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: SingleChildScrollView(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              padding:
                                  EdgeInsets.only(top: 10, right: 10, left: 10),
                              child: Text(
                                "Recuperar acesso",
                                style:
                                    AppThemeUtils.normalBoldSize(fontSize: 18),
                              )),
                          Padding(
                              padding:
                                  EdgeInsets.only(top: 10, right: 10, left: 10),
                              child: Text(
                                "Digite o e-mail da sua conta para receber as informações de redefinição de senha.",
                                style: AppThemeUtils.normalSize(fontSize: 16),
                              )),
                          Padding(
                              padding:
                                  EdgeInsets.only(top: 20, left: 10, right: 10),
                              child: TextField(
                                controller: bloc.emailController,
                                onChanged: (text) {},
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide()),
                                    labelText: 'E-mail'),
                              )),
                        ],
                      )),
                    ),
                  ),
                ),
              ])));
}
