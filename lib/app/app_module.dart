import 'package:dio/dio.dart';
import 'package:marketplace_entregador/app/modules/login/login_module.dart';
import 'package:marketplace_entregador/app/modules/login/page/login_remember/login_remember_bloc.dart';
import 'package:marketplace_entregador/app/modules/onboard/onboard_module.dart';

import 'package:marketplace_entregador/app/routes/constants_routes.dart';

import 'app_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_entregador/app/app_widget.dart';
import 'package:marketplace_entregador/app/modules/home/home_module.dart';

import 'core/request_core.dart';
import 'guard/router_login_guard.dart';
import 'guard/router_permission_guard.dart';

import 'modules/login/core/auth_repository.dart';
import 'modules/login/login_bloc.dart';
import 'modules/splash/splash_page.dart';
import 'utils/preferences/local_data_store.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds =>
      [
        Bind((i) => AppBloc()),
        Bind((i) => LocalDataStore()),
        Bind((i) => LoginBloc()),
        Bind((i) => AuthRepository()),
        Bind((i) => Dio()),
        Bind((i) => RequestCore()),
        Bind((i) => LoginRememberBloc())
      ];

  @override
  List<ModularRoute> get routes =>
      [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => SplashPage(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(ConstantsRoutes.ONBOARD,
          module: OnboardModule(),),
        ModuleRoute(ConstantsRoutes.HOME,
            module: HomeModule(),
            transition: TransitionType.fadeIn,
            guards: [RouterPermissionGuard()]),

        ModuleRoute(ConstantsRoutes.LOGIN,
            module: LoginModule(), guards: [RouterLoginGuard()]),
      ];

}
