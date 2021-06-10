import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/modules/home/modules/account/page/alter_bank_page.dart';
import 'package:marketplace_store_app/app/modules/home/modules/account/page/alter_pass_page.dart';
import 'package:marketplace_store_app/app/modules/home/modules/account/page/help_page.dart';
import 'package:marketplace_store_app/app/modules/home/modules/account/page/wallet_page.dart';
import 'package:marketplace_store_app/app/routes/constants_routes.dart';

import 'account_controller.dart';
import 'account_page.dart';

class AccountModule extends Module {
  @override
  final List<Bind> binds = [

  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => AccountPage()),

    ChildRoute(ConstantsRoutes.ALTERPASS, child: (_, args) => AlterPassPage()),
    ChildRoute(ConstantsRoutes.HELP, child: (_, args) => HelpPage()),
    ChildRoute(ConstantsRoutes.WALLET, child: (_, args) => WalletPage()),
    ChildRoute(ConstantsRoutes.MYBANK, child: (_, args) => AlterBankPage()),
  ];
}