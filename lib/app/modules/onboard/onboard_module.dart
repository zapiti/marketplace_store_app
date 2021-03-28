import 'package:flutter_modular/flutter_modular.dart';

import 'onboard_controller.dart';
import 'onboard_page.dart';

class OnboardModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => OnboardController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => OnboardPage()),
  ];
}