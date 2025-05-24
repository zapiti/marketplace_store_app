import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_marketplace_app/app/image/image_path.dart';
import 'package:new_marketplace_app/app/routes/constants_routes.dart';
import 'package:new_marketplace_app/app/utils/theme/app_theme_utils.dart';
import 'onboard_controller.dart';

class OnboardPage extends StatefulWidget {
  @override
  _OnboardPageState createState() => _OnboardPageState();
}

class _OnboardPageState extends ModularState<OnboardPage, OnboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: buildBody(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: buildFloatingButton(context),
    );
  }

  Container buildFloatingButton(BuildContext context) {
    return Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(
          child: Text("ENTRAR"),
          style: ElevatedButton.styleFrom(backgroundColor: AppThemeUtils.colorPrimary),
          onPressed: () {
            Modular.to.pushReplacementNamed(ConstantsRoutes.LOGIN);
          },
        ));
  }

  SingleChildScrollView buildBody(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 230,
                    child: SvgPicture.asset(ImagePath.onboard_1),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      "Impulsione seu negócio",
                      style: AppThemeUtils.normalBoldSize(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        right: 20,
                        left: 20,
                        bottom: MediaQuery.of(context).size.height * 0.15),
                    child: Text(
                      "Torne-se nosso parceiro, faça a gestão dos seus produtos, anuncie promoções e cresça com a gente!",
                      style: AppThemeUtils.normalSize(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  )
                ])));
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
