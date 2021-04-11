import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_entregador/app/component/simple/line_view_widget.dart';
import 'package:marketplace_entregador/app/modules/home/item/item_product.dart';
import 'package:marketplace_entregador/app/modules/home/modules/home/model/order.dart';
import 'package:marketplace_entregador/app/utils/theme/app_theme_utils.dart';

class DetailPendingPage extends StatefulWidget {
  final Order _order;

  DetailPendingPage(this._order);

  @override
  _DetailPendingPageState createState() => _DetailPendingPageState();
}

class _DetailPendingPageState extends State<DetailPendingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
            Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin: EdgeInsets.all(20),
                child: ElevatedButton(
                  child: Text("PEDIDO PRONTO!"),
                  style: ElevatedButton.styleFrom(
                      primary: AppThemeUtils.colorPrimary),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ))
          ],
        ));
  }
}
