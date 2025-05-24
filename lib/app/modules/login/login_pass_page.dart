import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_app/app/component/load/load_elements.dart';

import 'package:new_marketplace_app/app/modules/login/login_bloc.dart';
import 'package:new_marketplace_app/app/modules/login/page/alter_pass/alter_pass_bottom_sheet.dart';

import 'package:new_marketplace_app/app/utils/theme/app_theme_utils.dart';

class LoginPassPage extends StatefulWidget {
  @override
  _LoginPassPageState createState() => _LoginPassPageState();
}

class _LoginPassPageState extends State<LoginPassPage> {
  var bloc = Modular.get<LoginBloc>();

  String? errorPass;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: bloc.loadingSubject,
      initialData: false,
      builder: (context, snapshot) {
        var _isLoadRequest = snapshot.data ?? false;
        return WillPopScope(
          onWillPop: () async {
            return !_isLoadRequest;
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: IconThemeData(color: AppThemeUtils.colorPrimary),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
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
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.only(
                                    top: 10,
                                    right: 10,
                                    left: 10,
                                  ),
                                  child: Text(
                                    "Senha de acesso",
                                    style: AppThemeUtils.normalBoldSize(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                    right: 10,
                                    left: 10,
                                  ),
                                  child: Text(
                                    "Olá! Insira sua senha para acessar sua conta",
                                    style: AppThemeUtils.normalSize(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                StreamBuilder<bool>(
                                  stream: bloc.showPass.stream,
                                  initialData: false,
                                  builder:
                                      (
                                        BuildContext context,
                                        AsyncSnapshot<dynamic> snapshot,
                                      ) => Padding(
                                        padding: EdgeInsets.only(
                                          top: 20,
                                          left: 10,
                                          right: 10,
                                        ),
                                        child: TextField(
                                          enabled: !_isLoadRequest,
                                          obscureText: snapshot.data,
                                          controller: bloc.passController,
                                          onChanged: (text) {
                                            if (errorPass != null) {
                                              setState(() {
                                                errorPass = null;
                                              });
                                            }
                                          },
                                          decoration: InputDecoration(
                                            errorText: errorPass,
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                snapshot.data
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color:
                                                    AppThemeUtils
                                                        .colorPrimaryDark,
                                              ),
                                              onPressed: () {
                                                bloc.showPass.sink.add(
                                                  !snapshot.data,
                                                );
                                              },
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(),
                                            ),
                                            labelText: 'Senha',
                                          ),
                                        ),
                                      ),
                                ),
                                _isLoadRequest
                                    ? loadElements(context)
                                    : Padding(
                                      padding: EdgeInsets.only(
                                        top: 20,
                                        left: 10,
                                        right: 10,
                                      ),
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 50,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppThemeUtils.colorPrimary,
                                          ),
                                          child: Text(
                                            "ENTRAR",
                                            style: AppThemeUtils.normalSize(
                                              color: AppThemeUtils.whiteColor,
                                            ),
                                          ),
                                          onPressed: () {
                                            bloc.getLogin(context);
                                          },
                                        ),
                                      ),
                                    ),
                                _isLoadRequest
                                    ? SizedBox()
                                    : Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: SizedBox(
                                        child: TextButton(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.lock,
                                                color:
                                                    AppThemeUtils.colorPrimary,
                                                size: 20,
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                "Esqueci minha senha",
                                                style: AppThemeUtils.normalSize(
                                                  color:
                                                      AppThemeUtils
                                                          .colorPrimary,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          onPressed: () {
                                            showBottomSheetAlterPass(context);
                                          },
                                        ),
                                      ),
                                    ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
