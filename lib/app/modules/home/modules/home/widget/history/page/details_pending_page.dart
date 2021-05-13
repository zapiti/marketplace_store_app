import 'package:flutter/material.dart';
import 'package:marketplace_store_app/app/component/simple/line_view_widget.dart';
import 'package:marketplace_store_app/app/modules/home/item/item_product.dart';
import 'package:marketplace_store_app/app/modules/home/modules/home/model/order.dart';
import 'package:marketplace_store_app/app/utils/theme/app_theme_utils.dart';

class DetailHistoryPage extends StatefulWidget {
  final Order _order;

  DetailHistoryPage(this._order);

  @override
  _DetailHistoryPageState createState() => _DetailHistoryPageState();
}

class _DetailHistoryPageState extends State<DetailHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detalhes do pedido"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              child: Text(
                "Número do pedido:\n#${widget._order.numPedido}",
                style: AppThemeUtils.normalBoldSize(fontSize: 18),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            lineViewWidget(),
            Expanded(
                child: ListView.builder(
                    itemCount: widget._order.products.length,
                    itemBuilder: (context, index) =>
                        ItemProduct(widget._order.products[index]))),
          ],
        ));
  }
}
