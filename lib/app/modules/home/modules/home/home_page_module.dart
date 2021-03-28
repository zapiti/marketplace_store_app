import 'package:flutter_modular/flutter_modular.dart';

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
  ];
}