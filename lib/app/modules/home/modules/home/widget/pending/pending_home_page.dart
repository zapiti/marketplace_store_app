import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_entregador/app/component/builder/builder_component.dart';
import 'package:marketplace_entregador/app/component/builder/builder_infinity_listView_component.dart';
import 'package:marketplace_entregador/app/models/page/response_paginated.dart';
import 'package:marketplace_entregador/app/modules/home/modules/home/home_controller.dart';

import 'item/item_pending_widget.dart';

class PendingHomePage extends StatefulWidget {
  @override
  _PendingHomePageState createState() => _PendingHomePageState();
}

class _PendingHomePageState extends State<PendingHomePage> {
  final _homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return builderComponent<ResponsePaginated>(
        stream: _homeController.listPendingOrders,
        emptyMessage:
            "Seu estabelecimento ainda não recebeu pedidos. Não esqueça de atualizar os produtos da sua loja.",
        initCallData: () => _homeController.getListPendingOrder(),
        // tryAgain: () {
        //   _blocFaq.getListFaq();
        // },
        buildBodyFunc: (context, response) => builderInfinityListViewComponent(
            response,
            callMoreElements: (page) => {},
            buildBody: (content) => ItemPendingWidget(content)));
  }
}
