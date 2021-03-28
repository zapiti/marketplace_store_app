import 'package:flutter/material.dart';

class ConstantsRoutes {
  static const String HOME = '/home';
  static const String HOMEPAGE = '/homepage';
  static const String CALL_HOMEPAGE = HOME+HOMEPAGE;

  static const String STOREPAGE = '/storepage';
  static const String CALL_STOREPAGE = HOME+STOREPAGE;

  static const String ACCOUNTPAGE = '/accountpage';
  static const String CALL_ACCOUNTPAGE = HOME+ACCOUNTPAGE;

  static const String LOGIN = '/login';
  static const String LOGIN_PASS = '/pass';
  static const String CALL_LOGIN =  LOGIN+LOGIN_PASS;
  static const String RECOVERYPASS = "/recovery";

  static const String ONBOARD = "/onboard";

  static const String REGISTRE = '/registre';
  static const String CALL_REGISTRE =  LOGIN+REGISTRE;

  static const String REGISTRE_EMAIL = '/registre_email';
  static const String CALL_REGISTRE_EMAIL  =  LOGIN+REGISTRE_EMAIL;

  static const String REGISTRE_PASS = '/registre_pass';
  static const String CALL_REGISTRE_PASS  =  LOGIN+REGISTRE_PASS;

  static const String SUCESS_ALTERPASS = '/sucess_alter';
  static const String CALL_SUCESS_ALTERPASS  =  LOGIN+SUCESS_ALTERPASS;

  ///***passe @route
  ///para pegar o nome da rota
  static String getNameByRoute(
    String route,
  ) {
    switch (route) {
      case ConstantsRoutes.HOMEPAGE:
        return "Início";
        break;
      default:
        return "Início";
        break;
    }
  }

  ///*** verifica se a rota deve levar em conta a rota anterior (por causa dos tabs)
  static String getExtractRouteByContext(BuildContext context,
      {@required String route}) {
    String currentRoute = ModalRoute.of(context).settings.name;

    if (currentRoute == "/") {
      return route;
    }

    return currentRoute + route;
  }
}
