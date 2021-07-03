import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/component/builder/builder_component.dart';
import 'package:marketplace_store_app/app/component/builder/builder_infinity_listView_component.dart';
import 'package:marketplace_store_app/app/models/page/response_paginated.dart';
import 'package:marketplace_store_app/app/modules/home/modules/home/home_controller.dart';

import 'item/item_pending_widget.dart';

class PendingHomePage extends StatelessWidget {
  final HomeController controller;

  PendingHomePage(this.controller);

  @override
  Widget build(BuildContext context) {
    return builderComponent<ResponsePaginated?>(
        stream: controller.listPendingOrders,
        emptyMessage:
            "Seu estabelecimento ainda não recebeu pedidos. Não esqueça de atualizar os produtos da sua loja.",
        initCallData: () => controller.getListPendingOrder(),
        // tryAgain: () {
        //   _blocFaq.getListFaq();
        // },
        buildBodyFunc: (context, response) => builderInfinityListViewComponent(
            response,
            callMoreElements: (page) => {},
            buildBody: (content) => ItemPendingWidget(content)));
  }
}
