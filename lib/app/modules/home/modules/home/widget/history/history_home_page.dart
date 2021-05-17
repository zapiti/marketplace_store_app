import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/component/builder/builder_component.dart';
import 'package:marketplace_store_app/app/component/builder/builder_infinity_listView_component.dart';
import 'package:marketplace_store_app/app/models/page/response_paginated.dart';

import '../../home_controller.dart';
import 'item/item_history_widget.dart';

class HistoryHomePage extends StatelessWidget {
  final HomeController controller;

  HistoryHomePage(this.controller);

  @override
  Widget build(BuildContext context) {
    return builderComponent<ResponsePaginated>(
        stream: controller.listHistoryOrders,
        emptyMessage:
            "Seu estabelecimento ainda não recebeu pedidos para ser exibidos pedidos anteriores.",
        initCallData: () => controller.getListHistoryOrder(),
        // tryAgain: () {
        //   _blocFaq.getListFaq();
        // },
        buildBodyFunc: (context, response) => builderInfinityListViewComponent(
            response,
            callMoreElements: (page) => {},
            buildBody: (content) => ItemHistoryWidget(content)));
  }
}
