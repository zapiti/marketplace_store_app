import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/component/builder/builder_component.dart';
import 'package:marketplace_store_app/app/component/builder/builder_infinity_listView_component.dart';
import 'package:marketplace_store_app/app/component/load/load_elements.dart';
import 'package:marketplace_store_app/app/component/picker/user_image_widget.dart';
import 'package:marketplace_store_app/app/models/page/response_paginated.dart';
import 'package:marketplace_store_app/app/modules/home/item/item_product_edit.dart';
import 'package:marketplace_store_app/app/routes/constants_routes.dart';
import 'package:marketplace_store_app/app/utils/theme/app_theme_utils.dart';
import 'store_controller.dart';

class StorePage extends StatefulWidget {
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends ModularState<StorePage, StoreController> {
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pedidos"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: UserImageWidget(
                    changeImage: (txt) {},
                    width: MediaQuery.of(context).size.width,
                    height: 160,
                    isRounded: false,
                    userImage: controller.imageBackground.stream,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 100),
                  child: Center(
                      child: UserImageWidget(
                    changeImage: (txt) {},
                    userImage: controller.imgUser.stream,
                  )),
                )
              ],
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin: EdgeInsets.all(20),
                child: ElevatedButton(
                  child: Text(
                    "ADICIONAR PRODUTO",
                    style: AppThemeUtils.normalSize(
                        color: AppThemeUtils.colorPrimary),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: AppThemeUtils.whiteColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(4.0),
                          side: BorderSide(color: AppThemeUtils.colorPrimary))),
                  onPressed: () {
                    Modular.to.pushNamed(ConstantsRoutes.CALL_NEWPRODUCT);
                  },
                )),
            Expanded(
                child: builderComponent<ResponsePaginated>(
                    stream: controller.listProducts,
                    emptyMessage:
                        "Seu estabelecimento ainda não possui produtos.",
                    initCallData: () => controller.getListProducts(),
                    // tryAgain: () {
                    //   _blocFaq.getListFaq();
                    // },
                    buildBodyFunc: (context, response) =>
                        builderInfinityListViewComponent(response,
                            callMoreElements: (page) => {},
                            buildBody: (content) => ItemProductEdit(content))))
          ],
        ));
  }
}
