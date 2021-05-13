import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/component/picker/user_image_widget.dart';
import 'package:marketplace_store_app/app/component/select/custom_drop_menu.dart';
import 'package:marketplace_store_app/app/models/pairs.dart';
import 'package:marketplace_store_app/app/utils/theme/app_theme_utils.dart';
import '../store_controller.dart';

class NewStoreProductPage extends StatefulWidget {
  @override
  _NewStoreProductPageState createState() => _NewStoreProductPageState();
}

class _NewStoreProductPageState
    extends ModularState<NewStoreProductPage, StoreController> {
  var errorNameProduct;
  var errorValue;

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
                  children: [
                    Container(

                      child: UserImageWidget(
                        changeImage: (txt) {},
                        width: MediaQuery.of(context).size.width,
                        height: 160,
                        isRounded: false,
                        addButtom: "Adicionar foto do produto",
                        userImage: controller.imageTempProduct.stream,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: double.infinity,
                      child: Text(
                        "Sobre o produto",
                        textAlign: TextAlign.center,
                        style: AppThemeUtils.normalBoldSize(
                            color: AppThemeUtils.black),
                      ),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: TextField(
                          controller: controller.nomeProductController,
                          onChanged: (text) {},
                          decoration: InputDecoration(
                              errorText: errorNameProduct,
                              border:
                                  OutlineInputBorder(borderSide: BorderSide()),
                              labelText: 'Nome do produto*'),
                        )),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(left: 20, right: 5),
                              child: TextField(
                                controller: controller.valueProductController,
                                onChanged: (text) {},
                                decoration: InputDecoration(
                                    errorText: errorValue,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide()),
                                    labelText: 'Valor*'),
                              )),
                        ),
                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(right: 20, left: 5),
                              child: TextField(
                                controller: controller.valuePromotionController,
                                onChanged: (text) {},
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide()),
                                    labelText: 'Promoção'),
                              )),
                        )
                      ],
                    ),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        child: CustomDropMenuWidget(
                          controller: controller.categoryController,
                          isExpanded: true,
                          title: "Categoria*",
                          listElements: [
                            Pairs("Comida", "Comida"),
                            Pairs("Bebida", "Bebida"),
                          ],
                        )),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: TextField(
                          controller: controller.setorProductController,
                          onChanged: (text) {},
                          decoration: InputDecoration(
                              errorText: errorNameProduct,
                              border:
                                  OutlineInputBorder(borderSide: BorderSide()),
                              labelText: 'Setor onde o produto se localiza'),
                        )),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: TextField(
                          controller: controller.descrProductController,
                          onChanged: (text) {},
                          maxLines: 5,
                          decoration: InputDecoration(
                              errorText: errorNameProduct,
                              border:
                                  OutlineInputBorder(borderSide: BorderSide()),
                              labelText: 'Descrição do produto'),
                        )),
                  ],
                ),
              ),
            ),
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: double.infinity,
              child: ElevatedButton(
                child: Text(
                  "CONTINUAR",
                  style: AppThemeUtils.normalSize(color: AppThemeUtils.whiteColor),
                ),
                onPressed: () {
                  controller.nextToQuantity(context);
                },
                style: ElevatedButton.styleFrom(primary:  AppThemeUtils.colorPrimary),
              ),
            )
          ],
        ));
  }
}
