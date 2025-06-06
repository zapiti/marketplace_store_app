import 'package:new_marketplace_app/app/modules/home/modules/account/account_module.dart';
import 'package:new_marketplace_app/app/modules/home/modules/home/home_controller.dart';
import 'package:new_marketplace_app/app/modules/home/modules/home/home_page_module.dart';
import 'package:new_marketplace_app/app/modules/home/modules/store/store_controller.dart';
import 'package:new_marketplace_app/app/modules/home/modules/store/store_module.dart';
import 'package:new_marketplace_app/app/routes/constants_routes.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';
import 'modules/account/account_controller.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => AccountController()),
        Bind((i) => StoreController()),
        Bind((i) => HomeController()),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => HomePage(),
      children: [
        ModuleRoute(ConstantsRoutes.HOMEPAGE,
            module: HomePageModule(), transition: TransitionType.fadeIn),
        ModuleRoute(ConstantsRoutes.STOREPAGE,
            module: StoreModule(), transition: TransitionType.fadeIn),
        ModuleRoute(ConstantsRoutes.ACCOUNTPAGE,
            module: AccountModule(), transition: TransitionType.fadeIn),
      ],
    ),
  ];
}
