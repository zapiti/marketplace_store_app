import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/routes/constants_routes.dart';
import 'package:marketplace_store_app/app/utils/theme/app_theme_utils.dart';
import 'package:timelines/timelines.dart';

import '../account_controller.dart';

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends ModularState<WalletPage, AccountController> {
  bool enableWallet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sua carteira"),
          elevation: 0,
          backgroundColor: enableWallet
              ? AppThemeUtils.colorGreenSuccess
              : AppThemeUtils.greyColor,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                      height: 170,
                      width: double.infinity,
                      color: !enableWallet
                          ? AppThemeUtils.greyColor
                          : AppThemeUtils.colorGreenSuccess,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 25),
                            child: Text(
                              MoneyMaskedTextController(
                                      initialValue: 45, leftSymbol: "R\$ ")
                                  .text,
                              style: AppThemeUtils.normalBoldSize(
                                  fontSize: 28,
                                  color: AppThemeUtils.whiteColor),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Saldo atual",
                              style: AppThemeUtils.normalSize(
                                  fontSize: 18,
                                  color: AppThemeUtils.whiteColor),
                            ),
                          )
                        ],
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      margin: EdgeInsets.only(top: 135, right: 30, left: 30),
                      child: ElevatedButton(
                        child: Text(
                          !enableWallet
                              ? "SAQUE DISPONÍVEL EM 7 DIAS"
                              : "SAQUE DISPONÍVEL",
                          style: AppThemeUtils.normalSize(
                              color: !enableWallet
                                  ? AppThemeUtils.greyColor
                                  : AppThemeUtils.colorGreenSuccess),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: AppThemeUtils.whiteColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(12.0),
                                side: BorderSide(
                                    color: !enableWallet
                                        ? AppThemeUtils.greyColor
                                        : AppThemeUtils.colorGreenSuccess))),
                        onPressed: () {
                          setState(() {
                            enableWallet = !enableWallet;
                          });
                        },
                      )),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: AppThemeUtils.whiteColor,
                        ),
                        onPressed: () {
                          Modular.to.pushNamed(ConstantsRoutes.CALL_MYBANK);
                        }),
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Text(
                  "Últimas transações",
                  style: AppThemeUtils.normalBoldSize(fontSize: 18),
                )),
            Container(
                margin: EdgeInsets.only(left: 35, right: 20, top: 10),
                child: FixedTimeline.tileBuilder(
                  mainAxisSize: MainAxisSize.min,
                  theme: TimelineThemeData(
                    nodePosition: 0,
                    color: AppThemeUtils.colorPrimary,
                    connectorTheme: ConnectorThemeData(
                      thickness: 3.0,
                      color: AppThemeUtils.colorPrimary,
                    ),
                    indicatorTheme: IndicatorThemeData(
                      size: 15.0,
                    ),
                  ),
                  verticalDirection: VerticalDirection.up,
                  builder: TimelineTileBuilder.connectedFromStyle(
                    contentsAlign: ContentsAlign.basic,
                    connectionDirection: ConnectionDirection.before,
                    contentsBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Saque realizado",
                              style: AppThemeUtils.normalBoldSize(),
                            ),
                          ),
                          Container(
                            child: Text(
                              MoneyMaskedTextController(
                                      initialValue: 45, leftSymbol: "R\$")
                                  .text,
                              style: AppThemeUtils.normalSize(),
                            ),
                          )
                        ],
                      ),
                    ),
                    connectorStyleBuilder: (context, index) =>
                        ConnectorStyle.solidLine,
                    indicatorStyleBuilder: (context, index) =>
                        IndicatorStyle.dot,
                    itemCount: 10,
                  ),
                ))
          ],
        )));
  }
}
