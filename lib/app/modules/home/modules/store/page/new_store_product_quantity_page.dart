import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_entregador/app/component/picker/user_image_widget.dart';
import 'package:marketplace_entregador/app/component/select/custom_drop_menu.dart';
import 'package:marketplace_entregador/app/component/select/select_button.dart';
import 'package:marketplace_entregador/app/models/pairs.dart';
import 'package:marketplace_entregador/app/utils/theme/app_theme_utils.dart';
import '../store_controller.dart';

class NewStoreProductQuantityPage extends StatefulWidget {
  @override
  _NewStoreProductQuantityPageState createState() =>
      _NewStoreProductQuantityPageState();
}

class _NewStoreProductQuantityPageState
    extends ModularState<NewStoreProductQuantityPage, StoreController> {
  Pairs newStoreUnity;

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
                        "Quantidade",
                        textAlign: TextAlign.center,
                        style: AppThemeUtils.normalBoldSize(
                            color: AppThemeUtils.black),
                      ),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: SelectButton(
                          title: [
                            Pairs("Unidade", "Unidade"),
                            Pairs("Peso", "Peso")
                          ],
                          tapIndex: (myPairs) {
                            setState(() {
                              newStoreUnity = myPairs;
                            });
                          },
                        )),
                    newStoreUnity == null
                        ? SizedBox()
                        : newStoreUnity.first == "Unidade"
                            ? Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: TextField(
                                  controller:
                                      controller.quantityProductController,
                                  onChanged: (text) {},
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide()),
                                      labelText: 'Quantidade em estoque*'),
                                ))
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: Column(
                                  children: [
                                    CustomDropMenuWidget(
                                      controller: controller.categoryController,
                                      isExpanded: true,
                                      title: "Espeficações*",
                                      listElements: [
                                        Pairs("Gramas", "Gramas"),
                                        Pairs("Kilos", "Kilos"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: TextField(
                                          controller: controller
                                              .quantityProductController,
                                          onChanged: (text) {},
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide()),
                                              labelText: 'Qtd mínima*'),
                                        )),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            child: TextField(
                                          controller: controller
                                              .quantityProductController,
                                          onChanged: (text) {},
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide()),
                                              labelText: 'Qtd máxima*'),
                                        ))
                                      ],
                                    )
                                  ],
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
                  "ADICIONAR",
                  style:
                      AppThemeUtils.normalSize(color: AppThemeUtils.whiteColor),
                ),
                onPressed: newStoreUnity == null
                    ? null
                    : () {
                        controller.nextToQrcode(context);
                      },
                style: ElevatedButton.styleFrom(
                    primary: AppThemeUtils.colorPrimary),
              ),
            )
          ],
        ));
  }
}
