import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/app_bloc.dart';
import 'package:marketplace_store_app/app/component/select/select_button.dart';
import 'package:marketplace_store_app/app/models/current_user.dart';
import 'package:marketplace_store_app/app/models/pairs.dart';
import 'package:marketplace_store_app/app/modules/home/modules/home/widget/history/history_home_page.dart';
import 'package:marketplace_store_app/app/modules/home/modules/home/widget/pending/pending_home_page.dart';
import 'package:marketplace_store_app/app/utils/theme/app_theme_utils.dart';
import 'home_controller.dart';

class HomeInitialPage extends StatefulWidget {
  @override
  _HomeInitialPageState createState() => _HomeInitialPageState();
}

class _HomeInitialPageState
    extends ModularState<HomeInitialPage, HomeController> {
  int selectedIndex = 0;

  final appController = Modular.get<AppBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pedidos"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SelectButton(
              initialItem: selectedIndex,
              tapIndex: (i) {
                setState(() {
                  selectedIndex = i.first ?? 0;
                });
              },
              title: [
                Pairs(0, "Em andamento"),
                Pairs(1, "Anteriores"),
              ],
            ),
            Expanded(
                child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(child: child, opacity: animation);
                    },
                    child: selectedIndex == 0
                        ? PendingHomePage(controller)
                        : HistoryHomePage(controller))),
            StreamBuilder<CurrentUser?>(
                stream: appController.currentUser,
                builder: (context, snapshot) => Container(
                      color: AppThemeUtils.colorGreenSuccess,
                      width: MediaQuery.of(context).size.width,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "",
                            style: AppThemeUtils.normalSize(
                                color: AppThemeUtils.black, fontSize: 26),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Receita do estabelecimento ",
                                  style: AppThemeUtils.normalSize(
                                      color: AppThemeUtils.whiteColor,
                                      fontSize: 16)),
                              TextSpan(
                                  text: MoneyMaskedTextController(
                                          decimalSeparator: '.',
                                          thousandSeparator: ',',
                                          leftSymbol: "R\$ ",
                                          initialValue: snapshot.data
                                                  ?.establishment?.wallet ??
                                              0.0)
                                      .text,
                                  style: AppThemeUtils.normalBoldSize(
                                      color: AppThemeUtils.whiteColor,
                                      fontSize: 16)),
                            ],
                          )),
                    ))
          ],
        ));
  }
}
