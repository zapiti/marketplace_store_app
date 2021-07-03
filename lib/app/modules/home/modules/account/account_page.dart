import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/component/mobile/title_descritption_mobile_widget.dart';
import 'package:marketplace_store_app/app/component/simple/line_view_widget.dart';
import 'package:marketplace_store_app/app/modules/login/login_bloc.dart';
import 'package:marketplace_store_app/app/routes/constants_routes.dart';
import 'account_controller.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends ModularState<AccountPage, AccountController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //pegar valores do walletinfo
    
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
            iconData: Icons.lock_outline,
          ),
          lineViewWidget(),
          titleDescriptionMobileWidget(
            context,
            title: "Minha carteira",
            action: () {
              Modular.to.pushNamed(ConstantsRoutes.CALL_WALLET);
            },
            iconData: Icons.monetization_on,
          ),
          lineViewWidget(),
          titleDescriptionMobileWidget(
            context,
            title: "Ajuda",
            action: () {
              Modular.to.pushNamed(ConstantsRoutes.CALL_HELP);
            },
            iconData: Icons.info,
          ),
          lineViewWidget(),
          titleDescriptionMobileWidget(
            context,
            title: "Sair",
            action: () {
              var loginBloc = Modular.get<LoginBloc>();
              loginBloc.getLogout();
            },
            iconData: Icons.exit_to_app,
          ),
          lineViewWidget(),
        ],
      ),
    );
  }
}
