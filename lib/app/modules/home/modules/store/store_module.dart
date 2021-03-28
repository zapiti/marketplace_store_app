import 'package:flutter_modular/flutter_modular.dart';

import 'store_controller.dart';
import 'store_page.dart';

class StoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => StoreController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => StorePage()),
  ];
}