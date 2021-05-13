


import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/component/builder/builder_component.dart';
import 'package:marketplace_store_app/app/component/builder/builder_infinity_listView_component.dart';
import 'package:marketplace_store_app/app/models/page/response_paginated.dart';

import '../../home_controller.dart';
import 'item/item_history_widget.dart';

class HistoryHomePage extends StatefulWidget {
  @override
  _HistoryHomePageState createState() => _HistoryHomePageState();
}

class _HistoryHomePageState extends State<HistoryHomePage> {
  final _homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return builderComponent<ResponsePaginated>(
        stream: _homeController.listHistoryOrders,
        emptyMessage:
        "Seu estabelecimento ainda não recebeu pedidos para ser exibidos pedidos anteriores.",
        initCallData: () => _homeController.getListHistoryOrder(),
        // tryAgain: () {
        //   _blocFaq.getListFaq();
        // },
        buildBodyFunc: (context, response) => builderInfinityListViewComponent(
            response,
            callMoreElements: (page) => {},
            buildBody: (content) => ItemHistoryWidget(content)));
  }
}
