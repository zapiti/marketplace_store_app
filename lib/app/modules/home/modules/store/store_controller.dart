import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_app/app/component/dialog/dialog_generic.dart';
import 'package:new_marketplace_app/app/models/page/response_paginated.dart';
import 'package:new_marketplace_app/app/models/pairs.dart';
import 'package:new_marketplace_app/app/modules/home/model/product.dart';
import 'package:new_marketplace_app/app/modules/home/modules/store/repository/store_repository.dart';
import 'package:new_marketplace_app/app/routes/constants_routes.dart';
import 'package:new_marketplace_app/app/utils/theme/app_theme_utils.dart';
import 'package:new_marketplace_app/app/utils/utils.dart';
import 'package:rxdart/rxdart.dart';

class StoreController extends Disposable {
  final imageTempProduct = BehaviorSubject<String?>();
  final listProducts = BehaviorSubject<ResponsePaginated?>();

  final _repository = StoreRepository();
  Pairs? newStoreUnity;
  String? first;

  final nomeProductController = TextEditingController();
  final valueProductController = MoneyMaskedTextController(leftSymbol: "R\$");
  final valuePromotionController = MoneyMaskedTextController(leftSymbol: "R\$");
  final categoryController = TextEditingController();
  final setorProductController = TextEditingController();
  final descrProductController = TextEditingController();
  final quantityProductController = TextEditingController();
  final stockProductController = TextEditingController();
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
    if (response?.error == null) {
      getListProducts();
      Modular.to.navigate(ConstantsRoutes.CALL_STOREPAGE);
    } else {
      Utils.showSnackbar(context, response?.error);
    }
  }

  updateProducts(BuildContext context) async {
    final product = Product();
    var response = await _repository.updateProducts(product);

    if (response?.error == null) {
      Navigator.of(context).popUntil((route) => route.isFirst);
      getListProducts();
    } else {
      Utils.showSnackbar(context, response?.error);
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
            controller: this.barCodeController,
            decoration: BoxDecoration(),
            style: AppThemeUtils.normalSize(color: AppThemeUtils.black),
          ),
        ),
      ),
    );
  }

  void saveProductToCode(BuildContext context) {}

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
      quantityType: this.first?.toUpperCase(),
      stock: _getStock(),
      specification: _getSpecification(),
      qtdMax: _getQtdMax(),
      qtdMin: _getQtdMin(),
      barCode: this.barCodeController.text,
      image: imageTempProduct.stream.valueOrNull,
    );
  }

  double? _getStock() {
    return isUnitySelected() ? double.parse(stockProductController.text) : 0.0;
  }

  String? _getSpecification() {
    return isUnitySelected()
        ? null
        : this.specificationProductController.text.toUpperCase();
  }

  double? _getQtdMin() {
    return isUnitySelected()
        ? null
        : double.parse(this.minQuantityProductController.text);
  }

  double? _getQtdMax() {
    return isUnitySelected()
        ? null
        : double.parse(this.maxQuantityProductController.text);
  }

  bool isUnitySelected() => this.newStoreUnity?.first == "Unidade";
}
