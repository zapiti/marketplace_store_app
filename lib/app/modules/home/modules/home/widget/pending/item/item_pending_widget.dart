import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_app/app/modules/home/modules/home/model/order.dart';
import 'package:new_marketplace_app/app/routes/constants_routes.dart';
import 'package:new_marketplace_app/app/utils/date/date_utils.dart';
import 'package:new_marketplace_app/app/utils/theme/app_theme_utils.dart';

class ItemPendingWidget extends StatelessWidget {
  final Order itemPedingOrder;

  ItemPendingWidget(this.itemPedingOrder);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          border: Border.all(color: AppThemeUtils.colorGreenSuccess, width: 1),
          shape: BoxShape.rectangle,
        ),
        child: InkWell(
            onTap: () {
              Modular.to.pushNamed(ConstantsRoutes.CALL_DETAILS_PENDING,
                  arguments: itemPedingOrder);
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
                      child: Text("Pedido #${itemPedingOrder.numPedido}",
                          textAlign: TextAlign.start,
                          style: AppThemeUtils.normalBoldSize(
                            color: AppThemeUtils.colorGreenSuccess,
                          )),
                    ),
                    Container(
                      child: Text(
                          "há ${MyDateUtils.hoursToCompareNow(itemPedingOrder.dtCreate)}",
                          style: AppThemeUtils.normalSize()),
                    )
                  ],
                )),
                Container(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: AppThemeUtils.colorGreenSuccess,
                  ),
                )
              ],
            )));
  }
}
