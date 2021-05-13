import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/component/mobile/title_descritption_mobile_widget.dart';
import 'package:marketplace_store_app/app/component/simple/line_view_widget.dart';
import 'package:marketplace_store_app/app/routes/constants_routes.dart';
import 'account_controller.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends ModularState<AccountPage, AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Conta"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            titleDescriptionMobileWidget(
              context,
              title: "Alterar senha",
              action: () {
                Modular.to.pushNamed(ConstantsRoutes.CALL_ALTERPASS);
              },
              iconData: MaterialCommunityIcons.lock_outline,
            ),
            lineViewWidget(),
            titleDescriptionMobileWidget(
              context,
              title: "Minha carteira",
              action: () {
                Modular.to.pushNamed(ConstantsRoutes.CALL_WALLET);
              },
              iconData: MaterialCommunityIcons.cash_usd,
            ),
            lineViewWidget(),
            titleDescriptionMobileWidget(
              context,
              title: "Ajuda",
              action: () {
                Modular.to.pushNamed(ConstantsRoutes.CALL_HELP);
              },
              iconData: MaterialCommunityIcons.information_outline,
            ),
            lineViewWidget(),
            titleDescriptionMobileWidget(
              context,
              title: "Sair",
              action: () {},
              iconData: MaterialCommunityIcons.exit_to_app,
            ),
            lineViewWidget(),
          ],
        ));
  }
}
