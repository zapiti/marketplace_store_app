import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketplace_store_app/app/image/image_path.dart';
import 'package:marketplace_store_app/app/utils/theme/app_theme_utils.dart';
import '../store_controller.dart';

class NewStoreProductBarCodePage extends StatefulWidget {
  @override
  _NewStoreProductBarCodePageState createState() =>
      _NewStoreProductBarCodePageState();
}

class _NewStoreProductBarCodePageState
    extends ModularState<NewStoreProductBarCodePage, StoreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Novo produto"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 56),
                      child: Stack(
                        children: [
                          Center(
                              child: SvgPicture.asset(
                            ImagePath.bg_barcode,
                            width: 270,
                            height: 270,
                          )),
                          Center(
                              child: SvgPicture.asset(
                            ImagePath.ic_barcode,
                            width: 170,
                            height: 170,
                          )),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: double.infinity,
                      child: Text(
                        "Código de barras",
                        textAlign: TextAlign.center,
                        style: AppThemeUtils.normalBoldSize(
                            color: AppThemeUtils.black, fontSize: 18),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      width: double.infinity,
                      child: Text(
                        "Para a segurança dos produtos, escaneie o código de barras do item.",
                        textAlign: TextAlign.center,
                        style: AppThemeUtils.normalSize(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 70,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      "DIGITAR CÓDIGO",
                      style: AppThemeUtils.normalSize(
                          color: AppThemeUtils.whiteColor),
                    ),
                    onPressed: () {
                      controller.saveProductToDigite(context);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: AppThemeUtils.colorPrimary),
                  ),
                )),
                Expanded(
                    child: Container(
                  height: 70,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      "LER CÓDIGO",
                      style: AppThemeUtils.normalSize(
                          color: AppThemeUtils.whiteColor),
                    ),
                    onPressed: () {
                      controller.saveProductToCode(context);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: AppThemeUtils.colorPrimary),
                  ),
                ))
              ],
            ),
            Container(
              height: 70,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: double.infinity,
              child: ElevatedButton(
                child: Text(
                  "PRODUTO SEM CÓDIGO",
                  style:
                      AppThemeUtils.normalSize(color: AppThemeUtils.whiteColor),
                ),
                onPressed: () {
                  controller.saveProduct(context);
                },
                style:
                    ElevatedButton.styleFrom(primary: AppThemeUtils.greyColor),
              ),
            )
          ],
        ));
  }
}
