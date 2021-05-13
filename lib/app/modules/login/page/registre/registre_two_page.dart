import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/component/load/load_elements.dart';
import 'package:marketplace_store_app/app/image/image_logo_widget.dart';
import 'package:marketplace_store_app/app/modules/login/login_bloc.dart';
import 'package:marketplace_store_app/app/routes/constants_routes.dart';
import 'package:marketplace_store_app/app/utils/theme/app_theme_utils.dart';

class RegistreTwoPage extends StatefulWidget {
  @override
  _RegistreTwoPageState createState() => _RegistreTwoPageState();
}

class _RegistreTwoPageState extends State<RegistreTwoPage> {
  var bloc = Modular.get<LoginBloc>();

  String errorEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppThemeUtils.colorPrimary),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height,
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            padding:
                                EdgeInsets.only(top: 10, right: 10, left: 10),
                            child: Text(
                              "Dados de acesso",
                              style: AppThemeUtils.normalBoldSize(fontSize: 18),
                            )),
                        Padding(
                            padding:
                                EdgeInsets.only(top: 10, right: 10, left: 10),
                            child: Text(
                              "Escolha um e-mail para que possa acessar o aplicativo.",
                              style: AppThemeUtils.normalSize(fontSize: 16),
                            )),
                        Padding(
                            padding:
                                EdgeInsets.only(top: 20, left: 10, right: 10),
                            child: TextField(
                              controller: bloc.emailController,
                              onChanged: (text) {
                                if (errorEmail != null) {
                                  setState(() {
                                    errorEmail = null;
                                  });
                                }
                              },
                              decoration: InputDecoration(
                                  errorText: errorEmail,
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

                                if(EmailValidator.validate(bloc.emailController.text)){
                                Modular.to.pushNamed(ConstantsRoutes.CALL_REGISTRE_PASS);

                                }else{
                                  setState(() {

                                    errorEmail = "Adicione um e-mail válido";
                                  });
                                }
                               
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
    ));
  }
}
