import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_marketplace_app/app/image/image_path.dart';
import 'package:new_marketplace_app/app/routes/constants_routes.dart';
import 'package:new_marketplace_app/app/utils/theme/app_theme_utils.dart';

class SuccessRegisterPage extends StatefulWidget {
  @override
  _SuccessRegisterPageState createState() => _SuccessRegisterPageState();
}

class _SuccessRegisterPageState extends State<SuccessRegisterPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body:  SingleChildScrollView(
        child:  Container(

        height: MediaQuery.of(context).size.height,
    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom ),
    child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,height: 160,margin: EdgeInsets.only(bottom: 20),
              child: Image.asset(ImagePath.checkSucessImage),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Text(
                "Cadastro efetuado sucesso!",
                style: AppThemeUtils.normalBoldSize(fontSize: 20),textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(right: 20,left: 20,bottom: MediaQuery.of(context).size.height * 0.15),
              child: Text(
                "Aguarde a aprovação que logo entraremos em contato por E-mail liberando o seu acesso.",
                style: AppThemeUtils.normalSize(fontSize: 18),textAlign: TextAlign.center,
              ),
            )
          ]))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(
            child: Text("Confirmar"),
            style:
                ElevatedButton.styleFrom(backgroundColor: AppThemeUtils.colorPrimary),
            onPressed: () {
              Navigator.of(context)
                  .popUntil((route) => route.isFirst);
            },
          )),
    );
  }
}
