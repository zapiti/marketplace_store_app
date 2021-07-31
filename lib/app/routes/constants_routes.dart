import 'package:flutter/material.dart';

class ConstantsRoutes {
  static const String HOME = '/home';
  static const String HOMEPAGE = '/homepage';
  static const String CALL_HOMEPAGE = HOME + HOMEPAGE;

  static const String STOREPAGE = '/storepage';
  static const String CALL_STOREPAGE = HOME + STOREPAGE;

  static const String ACCOUNTPAGE = '/accountpage';
  static const String CALL_ACCOUNTPAGE = HOME + ACCOUNTPAGE;

  static const String LOGIN = '/login';
  static const String LOGIN_PASS = '/pass';
  static const String CALL_LOGIN = LOGIN + LOGIN_PASS;
  static const String RECOVERYPASS = "/recovery";

  static const String ONBOARD = "/onboard";

  static const String REGISTRE = '/registre';
  static const String CALL_REGISTRE = LOGIN + REGISTRE;

  static const String REGISTRE_EMAIL = '/registre_email';
  static const String CALL_REGISTRE_EMAIL = LOGIN + REGISTRE_EMAIL;

  static const String REGISTRE_PASS = '/registre_pass';
  static const String CALL_REGISTRE_PASS = LOGIN + REGISTRE_PASS;

  static const String SUCESS_REGISTER = '/registre_sucess';
  static const String CALL_SUCESS_REGISTER = LOGIN + SUCESS_REGISTER;

  static const String SUCESS_ALTERPASS = '/sucess_alter';
  static const String CALL_SUCESS_ALTERPASS = LOGIN + SUCESS_ALTERPASS;

  static const String DETAILS_HISTORY = "/details_order_history";
  static const String CALL_DETAILS_HISTORY = CALL_HOMEPAGE + DETAILS_HISTORY;

  static const String DETAILS_PENDING = "/details_order_peding";
  static const String CALL_DETAILS_PENDING = CALL_HOMEPAGE + DETAILS_PENDING;

  static const String NEWPRODUCT = "/new_product";
  static const String CALL_NEWPRODUCT = CALL_STOREPAGE + NEWPRODUCT;

  static const String NEWPRODUCTQUANTITY = "/new_product_quantidade";
  static const String CALL_NEWPRODUCTQUANTITY =
      CALL_STOREPAGE + NEWPRODUCTQUANTITY;

  static const String NEWPRODUCTBARCODE = "/new_product_barcode";
  static const String CALL_NEWPRODUCTBARCODE =
      CALL_STOREPAGE + NEWPRODUCTBARCODE;

  static const String ALTERPASS = "/alter_pass";
  static const String CALL_ALTERPASS = CALL_ACCOUNTPAGE + ALTERPASS;

  static const String HELP = "/help";
  static const String CALL_HELP = CALL_ACCOUNTPAGE + HELP;

  static const String WALLET = "/wallet";
  static const String CALL_WALLET = CALL_ACCOUNTPAGE + WALLET;

  static const String MYBANK = "/mybank";
  static const String CALL_MYBANK = CALL_ACCOUNTPAGE + MYBANK;

  ///***passe @route
  ///para pegar o nome da rota
  static String getNameByRoute(
    String route,
  ) {
    switch (route) {
      case ConstantsRoutes.HOMEPAGE:
        return "Pedidos";
      default:
        return "Início";
    }
  }

  ///*** verifica se a rota deve levar em conta a rota anterior (por causa dos tabs)
  static String getExtractRouteByContext(BuildContext context,
      {required String route}) {
    String? currentRoute = ModalRoute.of(context)!.settings.name;

    if (currentRoute == "/") {
      return route;
    }

    return (currentRoute ?? '') + route;
  }
}
