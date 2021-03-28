import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_entregador/app/component/load/load_elements.dart';
import 'package:marketplace_entregador/app/image/image_logo_widget.dart';
import 'package:marketplace_entregador/app/modules/login/login_bloc.dart';
import 'package:marketplace_entregador/app/routes/constants_routes.dart';
import 'package:marketplace_entregador/app/utils/theme/app_theme_utils.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var bloc = Modular.get<LoginBloc>();

  String errorEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Scaffold(
          body: SingleChildScrollView(
            child:  Container(

    height: MediaQuery.of(context).size.height,
    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom ),
    child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: SingleChildScrollView(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            child: GetLogoIcon2(),
                            padding: EdgeInsets.only(bottom: 30, top: 30),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: "",
                                    style: AppThemeUtils.normalSize(
                                        color: AppThemeUtils.black,
                                        fontSize: 26),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "Bem-vindo! Insira seu",
                                          style: AppThemeUtils.normalSize(
                                              fontSize: 18)),
                                      TextSpan(
                                          text: " e-mail ",
                                          style: AppThemeUtils.normalBoldSize(
                                              fontSize: 16)),
                                      TextSpan(
                                          text: "para acessar sua conta:",
                                          style: AppThemeUtils.normalSize(
                                              fontSize: 18)),
                                    ],
                                  ))),
                          Padding(
                              padding:
                                  EdgeInsets.only(top: 20, left: 10, right: 10),
                              child: TextField(
                                controller: bloc.emailController,onChanged: (text){
                                  if(errorEmail != null){
                                    setState(() {
                                      errorEmail = null;
                                    });
                                  }

                              },
                                decoration: InputDecoration(errorText: errorEmail,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide()),
                                    labelText: 'E-mail'),
                              )),
                          Padding(
                            padding:
                                EdgeInsets.only(top: 20, left: 10, right: 10),
                            child: SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: AppThemeUtils.colorPrimary),
                                child: Text(
                                  "CONTINUAR",
                                  style: AppThemeUtils.normalSize(
                                      color: AppThemeUtils.whiteColor),
                                ),
                                onPressed: () {
                                  // if(EmailValidator.validate(bloc.emailController.text)){
                                    Modular.to.pushNamed(ConstantsRoutes.CALL_LOGIN);

                                  // }else{
                                  //   setState(() {
                                  //
                                  //     errorEmail = "Adicione um e-mail válido";
                                  //   });
                                  // }

                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: SizedBox(
                              width: double.infinity,
                              child: FlatButton(
                                padding: EdgeInsets.all(12),
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "Ainda não tem uma conta?",
                                      style: AppThemeUtils.normalSize(
                                          fontSize: 14),
                                    ),
                                    Text(
                                      "Cadastre-se",
                                      style: AppThemeUtils.normalSize(
                                          color: AppThemeUtils.colorPrimary,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  Modular.to.pushNamed(ConstantsRoutes.CALL_REGISTRE);
                                },
                              ),
                            ),
                          )
                        ],
                      )),
                    ),
                  ),
                ),
              ],
            )),
          ),
        ));
  }
}
