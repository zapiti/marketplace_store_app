import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_entregador/app/modules/home/modules/home/model/order.dart';
import 'package:marketplace_entregador/app/routes/constants_routes.dart';
import 'package:marketplace_entregador/app/utils/date/date_utils.dart';
import 'package:marketplace_entregador/app/utils/theme/app_theme_utils.dart';

class ItemHistoryWidget extends StatelessWidget {
  final Order itemHistoryOrder;

  ItemHistoryWidget(this.itemHistoryOrder);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          border: Border.all(color: AppThemeUtils.black, width: 1),
          shape: BoxShape.rectangle,
        ),
        child: InkWell(
            onTap: () {
              Modular.to.pushNamed(ConstantsRoutes.CALL_DETAILS_HISTORY,
                  arguments: itemHistoryOrder);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text("Pedido #${itemHistoryOrder.numPedido}",
                          textAlign: TextAlign.start,
                          style: AppThemeUtils.normalBoldSize()),
                    ),
                    Container(
                      child: Text(
                          "${MyDateUtils.parseDateTimeFormat(itemHistoryOrder.dtCreate)}",
                          style: AppThemeUtils.normalSize()),
                    )
                  ],
                )),
                Container(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: AppThemeUtils.black,
                  ),
                )
              ],
            )));
  }
}
