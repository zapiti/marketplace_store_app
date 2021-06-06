import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/component/load/load_elements.dart';
import 'package:marketplace_store_app/app/image/image_logo_widget.dart';
import 'package:marketplace_store_app/app/modules/login/login_bloc.dart';
import 'package:marketplace_store_app/app/routes/constants_routes.dart';
import 'package:marketplace_store_app/app/utils/string/string_file.dart';
import 'package:marketplace_store_app/app/utils/theme/app_theme_utils.dart';

import '../user_term.dart';

class RegistreThreePage extends StatefulWidget {
  @override
  _RegistreThreePageState createState() => _RegistreThreePageState();
}

class _RegistreThreePageState extends State<RegistreThreePage> {
  var bloc = Modular.get<LoginBloc>();

  String errorPass;
  String errorPassConfirm;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: bloc.loadingSubject,
        initialData: false,
        builder: (context, snapshot) {
          var _isLoadRequest = snapshot.data;
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
                                          "Dados de acesso",
                                          style: AppThemeUtils.normalBoldSize(
                                              fontSize: 18),
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, right: 10, left: 10),
                                        child: Text(
                                          "Escolha um e-mail para que possa acessar o aplicativo.",
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
                                                  enabled: !_isLoadRequest,
                                                  obscureText: snapshot.data,
                                                  controller:
                                                      bloc.passController,
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
                                                  enabled: !_isLoadRequest,
                                                  obscureText: snapshot.data,
                                                  controller: bloc
                                                      .passControllerConfirm,
                                                  onChanged: (text) {
                                                    if (errorPassConfirm !=
                                                        null) {
                                                      setState(() {
                                                        errorPassConfirm = null;
                                                      });
                                                    }
                                                  },
                                                  decoration: InputDecoration(
                                                      errorText: errorPass,
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
                                                      labelText:
                                                          'Confirmar Senha'),
                                                ))),
                                    _isLoadRequest
                                        ? SizedBox()
                                        : Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    child: RichText(
                                                        textAlign:
                                                            TextAlign.start,
                                                        maxLines: 3,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        text: TextSpan(
                                                          text: StringFile
                                                              .leEConcordo,
                                                          style: AppThemeUtils
                                                              .normalSize(
                                                            color: Colors
                                                                .grey[700],
                                                          ),
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                                text: StringFile
                                                                    .politicaDePrivacidade,
                                                                style: AppThemeUtils
                                                                    .normalBoldSize(),
                                                                recognizer:
                                                                    TapGestureRecognizer()
                                                                      ..onTap =
                                                                          () {
                                                                        goToTerm(StringFile.politicaDePrivacidade,
                                                                                context)
                                                                            .then((value) {
                                                                          bloc.userTermAccept.add(value ??
                                                                              false);
                                                                        });
                                                                      }),
                                                          ],
                                                        ))),
                                                StreamBuilder<bool>(
                                                    stream: bloc.userTermAccept,
                                                    initialData: false,
                                                    builder: (context,
                                                            snapshot) =>
                                                        Switch(
                                                            value:
                                                                snapshot.data,
                                                            hoverColor:
                                                                AppThemeUtils
                                                                    .colorPrimary,
                                                            activeColor:
                                                                AppThemeUtils
                                                                    .colorPrimary,
                                                            onChanged: bloc
                                                                .userTermAccept
                                                                .add))
                                              ],
                                            )),
                                    _isLoadRequest
                                        ? loadElements(context)
                                        : Padding(
                                            padding: EdgeInsets.only(
                                                top: 20, left: 10, right: 10),
                                            child: SizedBox(
                                              width: double.infinity,
                                              height: 50,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: AppThemeUtils
                                                        .colorPrimary),
                                                child: Text(
                                                  "ENTRAR",
                                                  style:
                                                      AppThemeUtils.normalSize(
                                                          color: AppThemeUtils
                                                              .whiteColor),
                                                ),
                                                onPressed: () {
                                                  bloc.getRegistre(context);
                                                },
                                              ),
                                            ),
                                          ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ));
        });
  }
}
