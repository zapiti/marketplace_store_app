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

class RegistreOnePage extends StatefulWidget {
  @override
  _RegistreOnePageState createState() => _RegistreOnePageState();
}

class _RegistreOnePageState extends State<RegistreOnePage> {
  var bloc = Modular.get<LoginBloc>();

  String errorName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppThemeUtils.colorPrimary),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body:SingleChildScrollView(
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
                              "Nos conte mais",
                              style: AppThemeUtils.normalBoldSize(fontSize: 18),
                            )),
                        Padding(
                            padding:
                                EdgeInsets.only(top: 10, right: 10, left: 10),
                            child: Text(
                              "Para que possamos conhecer o estabelecimento, preencha o nome.",
                              style: AppThemeUtils.normalSize(fontSize: 16),
                            )),
                        Padding(
                            padding:
                                EdgeInsets.only(top: 20, left: 10, right: 10),
                            child: TextField(
                              controller: bloc.nameControler,
                              onChanged: (text) {
                                if (errorName != null) {
                                  setState(() {
                                    errorName = null;
                                  });
                                }
                              },
                              decoration: InputDecoration(
                                  errorText: errorName,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide()),
                                  labelText: 'Nome do estabelecimento'),
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
                                if (bloc.nameControler.text.length >= 3) {
                                  Modular.to.pushNamed(
                                      ConstantsRoutes.CALL_REGISTRE_EMAIL);
                                } else {
                                  setState(() {
                                    errorName =
                                        "Adicione um o nome do com no minimo 3 caracteres";
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
