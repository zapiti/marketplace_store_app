import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/modules/home/modules/home/widget/history/page/details_pending_page.dart';
import 'package:marketplace_store_app/app/modules/home/modules/home/widget/pending/page/details_pending_page.dart';
import 'package:marketplace_store_app/app/routes/constants_routes.dart';

import 'home_controller.dart';
import 'home_initial_page.dart';

class HomePageModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomeInitialPage()),
    ChildRoute(ConstantsRoutes.DETAILS_PENDING, child: (_, args) => DetailPendingPage(args.data)),
    ChildRoute(ConstantsRoutes.DETAILS_HISTORY, child: (_, args) => DetailHistoryPage(args.data)),
  ];
}