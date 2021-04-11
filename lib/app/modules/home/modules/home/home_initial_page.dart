import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_entregador/app/component/select/select_button.dart';
import 'package:marketplace_entregador/app/models/pairs.dart';
import 'package:marketplace_entregador/app/modules/home/modules/home/widget/history/history_home_page.dart';
import 'package:marketplace_entregador/app/modules/home/modules/home/widget/pending/pending_home_page.dart';
import 'package:marketplace_entregador/app/routes/constants_routes.dart';
import 'package:marketplace_entregador/app/utils/theme/app_theme_utils.dart';
import 'home_controller.dart';

class HomeInitialPage extends StatefulWidget {
  @override
  _HomeInitialPageState createState() => _HomeInitialPageState();
}

class _HomeInitialPageState
    extends ModularState<HomeInitialPage, HomeController> {
  int selectedIndex = 0;
  final controller = Modular.get<HomeController>();

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
                  selectedIndex = i?.first ?? 0;
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
                        ? PendingHomePage()
                        : HistoryHomePage())),
            StreamBuilder<double>(
                stream: controller.revenue,
                initialData: 0,
                builder: (context, snapshot) => Container(
                      color: AppThemeUtils.colorGreenSuccess,
                      width: MediaQuery.of(context).size.width,padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
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
                                          initialValue: snapshot.data)
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
