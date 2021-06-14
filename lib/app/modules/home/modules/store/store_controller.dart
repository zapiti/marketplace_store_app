import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/component/dialog/dialog_generic.dart';
import 'package:marketplace_store_app/app/models/current_user.dart';
import 'package:marketplace_store_app/app/models/page/response_paginated.dart';
import 'package:marketplace_store_app/app/models/pairs.dart';
import 'package:marketplace_store_app/app/modules/home/model/product.dart';
import 'package:marketplace_store_app/app/modules/home/modules/store/repository/store_repository.dart';
import 'package:marketplace_store_app/app/routes/constants_routes.dart';
import 'package:marketplace_store_app/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_app/app/utils/utils.dart';
import 'package:rxdart/rxdart.dart';

class StoreController extends Disposable {
  final imageTempProduct = BehaviorSubject<String>();
  final listProducts = BehaviorSubject<ResponsePaginated>();

  final _repository = StoreRepository();
  Pairs newStoreUnity;

  final nomeProductController = TextEditingController();
  final valueProductController = MoneyMaskedTextController(leftSymbol: "R\$");
  final valuePromotionController = MoneyMaskedTextController(leftSymbol: "R\$");
  final categoryController = TextEditingController();
  final setorProductController = TextEditingController();
  final descrProductController = TextEditingController();
  final quantityProductController = TextEditingController();
  final specificationProductController = TextEditingController();
  final minQuantityProductController = TextEditingController();
  final maxQuantityProductController = TextEditingController();
  final barCodeController = TextEditingController();

  @override
  void dispose() {
    listProducts.close();
    imageTempProduct.close();
  }

  getListProducts() async {
    listProducts.sink.add(null);
    var response = await _repository.getListProducts();
    listProducts.sink.add(response);
  }

  saveProducts(BuildContext context) async {
    final product = _buildProduct();

    var response = await _repository.saveProducts(product);

    if (response.error == null) {
      Navigator.of(context).popUntil((route) => route.isFirst);
      getListProducts();
    } else {
      Utils.showSnackbar(context, response.error);
    }
  }

  updateProducts(BuildContext context) async {
    final product = Product();
    var response = await _repository.updateProducts(product);

    if (response.error == null) {
      Navigator.of(context).popUntil((route) => route.isFirst);
      getListProducts();
    } else {
      Utils.showSnackbar(context, response.error);
    }
  }

  void nextToQuantity(BuildContext context) {
    Modular.to.pushNamed(ConstantsRoutes.CALL_NEWPRODUCTQUANTITY);
  }

  void nextToQrcode(BuildContext context) {
    Modular.to.pushNamed(ConstantsRoutes.CALL_NEWPRODUCTBARCODE);
  }

  void saveProductToDigite(BuildContext context) {
    showGenericDialog(
        context: context,
        title: "Digite o código",
        description: "",
        positiveText: "Confirmar",
        containsPop: false,
        positiveCallback: () {
          saveProducts(context);
          Navigator.of(context, rootNavigator: true).pop();
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
              controller: this.barCodeController,
              decoration: BoxDecoration(),
              style: AppThemeUtils.normalSize(color: AppThemeUtils.black),
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

  void updateImageStore(String txt) {}

  void updateImageBg(String txt) {}

  _buildProduct() {
    return Product(
        name: this.nomeProductController.text,
        value: this.valueProductController.numberValue,
        promotionalValue: this.valuePromotionController.numberValue,
        category: this.categoryController.text,
        sector: this.setorProductController.text,
        description: this.descrProductController.text,
        quantityType: _getProductQuantity(),
        stock: null,
        specification: this.specificationProductController.text,
        qtdMax: _getQtdMax(),
        qtdMin: _getQtdMin(),
        barCode: this.barCodeController.text,
        image: null);
  }

  double _getQtdMin() {
    return this.newStoreUnity.first == "Unidade"
        ? null
        : double.parse(this.minQuantityProductController.text);
  }

  double _getQtdMax() {
    return this.newStoreUnity.first == "Unidade"
        ? null
        : double.parse(this.maxQuantityProductController.text);
  }

  String _getProductQuantity() {
    return this.newStoreUnity.first == "Unidade"
        ? this.quantityProductController.text
        : null;
  }
}
