import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/component/builder/builder_component.dart';
import 'package:marketplace_store_app/app/models/page/response_paginated.dart';
import 'package:marketplace_store_app/app/modules/home/modules/account/model/transaction.dart';
import 'package:marketplace_store_app/app/modules/home/modules/account/model/wallet_data.dart';
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
  void initState() {
    super.initState();
    controller.getWalletInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return builderComponent<ResponsePaginated?>(
      stream: controller.walletInfo.stream,
      buildBodyFunc: (context, response) => buildWalletPage(response?.data),
    );
  }

  buildWalletPage(WalletData walletInfo) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTopSidePageWidget(context, walletInfo),
          buildBottomSideTitle(),
          buildBottomSideListView(walletInfo)
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Sua carteira"),
      elevation: 0,
      backgroundColor: enableWalletFunction(),
      centerTitle: true,
    );
  }

  Color enableWalletFunction() {
    return enableWallet
        ? AppThemeUtils.colorGreenSuccess
        : AppThemeUtils.greyColor;
  }

  Container buildBottomSideListView(WalletData walletinfo2) {
    return Container(
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
          connectorStyleBuilder: (context, index) => ConnectorStyle.solidLine,
          indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
          itemCount: walletinfo2.transactions.length,
          contentsBuilder: (context, index) =>
              buildTiles(walletinfo2.transactions[index]),
        ),
      ),
    );
  }

  Padding buildTiles(Transaction transaction) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          transactionDescription(transaction),
          transactionValue(transaction)
        ],
      ),
    );
  }

  Container transactionValue(Transaction transaction) {
    return Container(
      child: Text(
        MoneyMaskedTextController(
                initialValue: transaction.value, leftSymbol: "R\$")
            .text,
        style: AppThemeUtils.normalSize(),
      ),
    );
  }

  Container transactionDescription(Transaction transaction) {
    return Container(
      child: Text(
        transaction.description,
        style: AppThemeUtils.normalBoldSize(),
      ),
    );
  }

  Container buildBottomSideTitle() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Text(
        "Últimas transações",
        style: AppThemeUtils.normalBoldSize(fontSize: 18),
      ),
    );
  }

  Container buildTopSidePageWidget(
      BuildContext context, WalletData walletinfo) {
    return Container(
      child: Stack(
        children: [
          buildTopPageWidget(walletinfo),
          buildWithDrawButton(context),
          buildEditButton()
        ],
      ),
    );
  }

  Container buildEditButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.centerRight,
      child: IconButton(
        icon: Icon(
          Icons.edit,
          color: AppThemeUtils.whiteColor,
        ),
        onPressed: () async {
          await controller.getAccount();
          Modular.to.pushNamed(ConstantsRoutes.CALL_MYBANK);
        },
      ),
    );
  }

  Container buildWithDrawButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: EdgeInsets.only(top: 135, right: 30, left: 30),
      child: ElevatedButton(
        child: Text(
          !enableWallet ? "SAQUE DISPONÍVEL EM 7 DIAS" : "SAQUE DISPONÍVEL",
          style: AppThemeUtils.normalSize(color: enableWalletFunction()),
        ),
        style: ElevatedButton.styleFrom(
          primary: AppThemeUtils.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(12.0),
            side: BorderSide(color: enableWalletFunction()),
          ),
        ),
        onPressed: () {
          setState(
            () {
              enableWallet = !enableWallet;
            },
          );
        },
      ),
    );
  }

  Container buildTopPageWidget(WalletData walletinfo) {
    return Container(
      height: 170,
      width: double.infinity,
      color: enableWalletFunction(),
      child: Column(
        children: [
          buildValueText(walletinfo),
          buildCurrentBalanceWidget(),
        ],
      ),
    );
  }

  Container buildCurrentBalanceWidget() {
    return Container(
      child: Text(
        "Saldo atual",
        style: AppThemeUtils.normalSize(
            fontSize: 18, color: AppThemeUtils.whiteColor),
      ),
    );
  }

  Container buildValueText(WalletData walletinfo) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Text(
        MoneyMaskedTextController(
                initialValue: walletinfo.wallet, leftSymbol: "R\$ ")
            .text,
        style: AppThemeUtils.normalBoldSize(
            fontSize: 28, color: AppThemeUtils.whiteColor),
      ),
    );
  }
}
