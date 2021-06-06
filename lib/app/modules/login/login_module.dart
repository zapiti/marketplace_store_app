import 'package:flutter/cupertino.dart';
import 'package:marketplace_store_app/app/modules/login/page/alter_pass/success_pass_page.dart';
import 'package:marketplace_store_app/app/modules/login/page/registre/registre_one_page.dart';
import 'package:marketplace_store_app/app/modules/login/page/registre/registre_three_page.dart';
import 'package:marketplace_store_app/app/modules/login/page/registre/registre_two_page.dart';
import 'package:marketplace_store_app/app/modules/login/page/registre/success_register_page.dart';
import 'package:marketplace_store_app/app/routes/constants_routes.dart';

import 'login_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_page.dart';
import 'login_pass_page.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [Bind((i) => LoginBloc())];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => LoginPage()),
    ChildRoute(ConstantsRoutes.LOGIN_PASS, child: (_, args) => LoginPassPage(),  transition: TransitionType.fadeIn),
    ChildRoute(ConstantsRoutes.REGISTRE, child: (_, args) => RegistreOnePage(),  transition: TransitionType.fadeIn),
    ChildRoute(ConstantsRoutes.REGISTRE_EMAIL, child: (_, args) => RegistreTwoPage(),  transition: TransitionType.fadeIn),
    ChildRoute(ConstantsRoutes.REGISTRE_PASS, child: (_, args) => RegistreThreePage(),  transition: TransitionType.fadeIn),
    ChildRoute(ConstantsRoutes.SUCESS_REGISTER, child: (_, args) => SuccessRegisterPage(),  transition: TransitionType.fadeIn),
    ChildRoute(ConstantsRoutes.SUCESS_ALTERPASS, child: (_, args) => SuccessPassPage(),  transition: TransitionType.fadeIn),
  ];
}
