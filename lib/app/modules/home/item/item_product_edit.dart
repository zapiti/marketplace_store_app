import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:marketplace_store_app/app/component/simple/line_view_widget.dart';
import 'package:marketplace_store_app/app/modules/home/model/product.dart';
import 'package:marketplace_store_app/app/utils/image_utils.dart';
import 'package:marketplace_store_app/app/utils/theme/app_theme_utils.dart';

class ItemProductEdit extends StatefulWidget {
  final Product product;

  ItemProductEdit(this.product);

  @override
  _ItemProductEditState createState() => _ItemProductEditState();
}

class _ItemProductEditState extends State<ItemProductEdit> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      widget.product.name,
                      style: AppThemeUtils.normalBoldSize(),
                    ),
                  ),
                  Container(
                    child: Text(
                      widget.product.description,
                      style: AppThemeUtils.normalSize(fontSize: 12),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      MoneyMaskedTextController(
                              decimalSeparator: '.',
                              thousandSeparator: ',',
                              leftSymbol: "R\$ ",
                              initialValue: widget.product.value)
                          .text,
                      style: AppThemeUtils.normalBoldSize(
                          color: AppThemeUtils.colorGreenSuccess, fontSize: 18),
                    ),
                  )
                ],
              )),
              Container(
                  height: 130,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 20),
                        child: Center(
                            child: ImageUtils.imageFromBase64String(
                          widget.product.image,
                          height: 180,
                          fit: BoxFit.cover,
                          width: 150,
                        )),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          width: 150,
                          height: 200,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                                decoration: new BoxDecoration(
                                  color: AppThemeUtils.colorPrimary,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                    color: AppThemeUtils.colorPrimary,
                                    icon: Icon(
                                      Icons.edit_outlined,
                                      color: AppThemeUtils.whiteColor,
                                    ),
                                    onPressed: () {})),
                          ))
                    ],
                  ))
            ],
          ),
        ),
        lineViewWidget()
      ],
    );
  }
}
