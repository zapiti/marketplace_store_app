import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/component/picker/user_image_widget.dart';
import 'package:marketplace_store_app/app/component/store/product_type.dart';
import 'package:marketplace_store_app/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_app/app/utils/utils.dart';
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
      appBar: buildAppBar(),
      body: buildBody(context),
    );
  }

  Column buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildProductImageWidget(),
                buildAboutTheProductTextTag(),
                buildProductNameTextInput(),
                SizedBox(height: 4),
                buildValueAndPromotionTextField(),
                ProductType(controller.categoryController),
                buildProductDescriptionTextField(),
              ],
            ),
          ),
        ),
        buildContinueButton(context)
      ],
    );
  }

  Container buildContinueButton(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: double.infinity,
      child: ElevatedButton(
        child: Text(
          "CONTINUAR",
          style: AppThemeUtils.normalSize(color: AppThemeUtils.whiteColor),
        ),
        onPressed: onPressedMethod(),
        style: ElevatedButton.styleFrom(primary: AppThemeUtils.colorPrimary),
      ),
    );
  }

  Function onPressedMethod() {
    return () {
      if (verifyEmptyFields) {
        Utils.showSnackbar(context, "Preencha os Campos Obrigatorios");
      } else {
        controller.nextToQuantity(context);
      }
    };
  }

  bool get verifyEmptyFields {
    return controller.nomeProductController.text == "" ||
        controller.valueProductController.numberValue == 0.0;
  }

  Padding buildProductDescriptionTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: controller.descrProductController,
        onChanged: (text) {},
        maxLines: 5,
        decoration: InputDecoration(
            errorText: errorNameProduct,
            border: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            labelText: 'Descrição do produto'),
      ),
    );
  }

  Row buildValueAndPromotionTextField() {
    return Row(
      children: [
        buildValueTextField(),
        buildPromotionTextField(),
      ],
    );
  }

  Expanded buildPromotionTextField() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 20, left: 5),
        child: TextField(
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          controller: controller.valuePromotionController,
          onChanged: (text) {},
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
              labelText: 'Promoção'),
        ),
      ),
    );
  }

  Expanded buildValueTextField() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 5),
        child: TextField(
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          controller: controller.valueProductController,
          onChanged: (text) {},
          decoration: InputDecoration(
              errorText: errorValue,
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
              labelText: 'Valor*'),
        ),
      ),
    );
  }

  Padding buildProductNameTextInput() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: controller.nomeProductController,
        onChanged: (text) {},
        decoration: InputDecoration(
            errorText: errorNameProduct,
            border: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            labelText: 'Nome do produto*'),
      ),
    );
  }

  Container buildAboutTheProductTextTag() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: double.infinity,
      child: Text(
        "Sobre o produto",
        textAlign: TextAlign.center,
        style: AppThemeUtils.normalBoldSize(color: AppThemeUtils.black),
      ),
    );
  }

  StreamBuilder<String> buildProductImageWidget() {
    return StreamBuilder(
      stream: controller.imageTempProduct,
      builder: (context, snapshot) => Container(
        child: UserImageWidget(
          changeImage: (txt) {},
          width: MediaQuery.of(context).size.width,
          height: 160,
          isRounded: false,
          addButtom: "Adicionar foto do produto",
          userImage: snapshot.data ?? "",
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Novo produto"),
      centerTitle: true,
    );
  }
}
