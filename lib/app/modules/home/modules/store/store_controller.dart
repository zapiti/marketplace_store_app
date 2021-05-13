import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/component/dialog/dialog_generic.dart';
import 'package:marketplace_store_app/app/models/page/response_paginated.dart';
import 'package:marketplace_store_app/app/modules/home/modules/store/repository/store_repository.dart';
import 'package:marketplace_store_app/app/routes/constants_routes.dart';
import 'package:marketplace_store_app/app/utils/theme/app_theme_utils.dart';
import 'package:rxdart/rxdart.dart';

class StoreController extends Disposable {
  final imageBackground = BehaviorSubject<String>.seeded(
      "https://media-cdn.tripadvisor.com/media/photo-s/05/17/27/44/bar-da-esquina.jpg");
  final imgUser = BehaviorSubject<String>.seeded(
      "https://s3-sa-east-1.amazonaws.com/projetos-artes/fullsize%2F2011%2F06%2F26%2F10%2FWDL-Logo-5088_512_040125572_726027898.jpg");

  final listProducts = BehaviorSubject<ResponsePaginated>();

  final _repository = StoreRepository();

  final imageTempProduct = BehaviorSubject<String>.seeded("");

  final descrProductController = TextEditingController();

  final setorProductController = TextEditingController();

  final categoryController = TextEditingController();

  final valuePromotionController = MoneyMaskedTextController(leftSymbol: "R\$");

  final valueProductController = MoneyMaskedTextController(leftSymbol: "R\$");

  final nomeProductController = TextEditingController();

  var quantityProductController = TextEditingController();

  @override
  void dispose() {
    imageBackground.close();
    imgUser.close();
    listProducts.close();
    imageTempProduct.close();
  }

  getListProducts() async {
    listProducts.sink.add(null);
    var response = await _repository.getListProducts();
    listProducts.sink.add(response);
  }

  void nextToQuantity(BuildContext context) {
    Modular.to.pushNamed(ConstantsRoutes.CALL_NEWPRODUCTQUANTITY);
  }

  void nextToQrcode(BuildContext context) {
    Modular.to.pushNamed(ConstantsRoutes.CALL_NEWPRODUCTBARCODE);
  }

  void saveProduct(BuildContext context) {
    Modular.to.pushReplacementNamed(ConstantsRoutes.HOME);
  }

  void saveProductToDigite(BuildContext context) {
     final controller = TextEditingController();


    showGenericDialog(
        context: context,
        title: "Digite o código",

        description: "",
        positiveText: "Confirmar",
        containsPop: false,
        positiveCallback: () {
          Modular.to.pushReplacementNamed(ConstantsRoutes.HOME);

        },
        negativeText: "Cancelar",
        negativeCallback: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
        iconData: Icons.error_outline,
        customWidget: Container(
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey[200],
            child: CupertinoTextField(
              placeholder: "Código do produto",
              keyboardType: TextInputType.number,
              controller: controller,
              decoration: BoxDecoration(),
              style: AppThemeUtils.normalSize(
                  color: AppThemeUtils.black),
            ),
          ),
        ));

  }

  void saveProductToCode(BuildContext context) {


    FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancelar", true, ScanMode.BARCODE)
        .then((barcode) {
      if (barcode != null && barcode != "-1") {
        Modular.to.pushReplacementNamed(ConstantsRoutes.HOME);
      }
    });


  }
}
