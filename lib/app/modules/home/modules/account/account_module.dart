import 'package:flutter_modular/flutter_modular.dart';

import 'account_controller.dart';
import 'account_page.dart';

class AccountModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AccountController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => AccountPage()),
  ];
}