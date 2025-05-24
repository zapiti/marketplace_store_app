import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_app/app/component/picker/user_image_widget.dart';
import 'package:new_marketplace_app/app/component/select/custom_drop_menu.dart';
import 'package:new_marketplace_app/app/component/select/select_button.dart';
import 'package:new_marketplace_app/app/models/pairs.dart';
import 'package:new_marketplace_app/app/utils/theme/app_theme_utils.dart';
import 'package:new_marketplace_app/app/utils/utils.dart';
import '../store_controller.dart';

class NewStoreProductQuantityPage extends StatefulWidget {
  @override
  _NewStoreProductQuantityPageState createState() =>
      _NewStoreProductQuantityPageState();
}

class _NewStoreProductQuantityPageState
    extends ModularState<NewStoreProductQuantityPage, StoreController> {
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
                buildTitleTag(),
                buildUnityAndWeightButtons(),
                controller.newStoreUnity == null
                    ? SizedBox()
                    : controller.newStoreUnity?.first == "Unidade"
                        ? buildUnityChoosedBodyWidget()
                        : buildWeightChoosedBodyWidget(),
              ],
            ),
          ),
        ),
        buildAddButton(context)
      ],
    );
  }

  Container buildAddButton(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: double.infinity,
      child: ElevatedButton(
        child: Text(
          "ADICIONAR",
          style: AppThemeUtils.normalSize(color: AppThemeUtils.whiteColor),
        ),
        onPressed: controller.newStoreUnity == null ? null : onPressedMethod,
        style: ElevatedButton.styleFrom(backgroundColor: AppThemeUtils.colorPrimary),
      ),
    );
  }

  void onPressedMethod() {

      if (verifyEmptyFields) {
        Utils.showSnackbar(context, "Preencha os Campos Obrigatorios");
      } else {
        controller.nextToQrcode(context);
      }

  }

  bool get verifyEmptyFields {
    if (controller.newStoreUnity?.first == "Unidade") {
      return controller.stockProductController.text == "";
    } else {
      return controller.specificationProductController.text == "" ||
          controller.maxQuantityProductController.text == "" ||
          controller.minQuantityProductController.text == "";
    }
  }

  Padding buildWeightChoosedBodyWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        children: [
          CustomDropMenuWidget(
            controller: controller.specificationProductController,
            isExpanded: true,
            title: "Especificações*",
            listElements: [
              Pairs("Gramas", "Gramas"),
              Pairs("Kilos", "Kilos"),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller.minQuantityProductController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  onChanged: (text) {},
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      labelText: 'Qtd mínima*'),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                  controller: controller.maxQuantityProductController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (text) {},
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      labelText: 'Qtd máxima*'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Padding buildUnityChoosedBodyWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        controller: controller.stockProductController,
        onChanged: (text) {},
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            labelText: 'Quantidade em estoque*'),
      ),
    );
  }

  Padding buildUnityAndWeightButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: SelectButton(
        title: [
          Pairs("Unidade", "Unidade"),
          Pairs("Peso", "Peso"),
        ],
        tapIndex: (myPairs) {
          setState(() {
            print(myPairs.first);
            controller.newStoreUnity = myPairs;
            controller.first = controller.newStoreUnity?.first;
          });
        },
      ),
    );
  }

  Container buildTitleTag() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: double.infinity,
      child: Text(
        "Quantidade",
        textAlign: TextAlign.center,
        style: AppThemeUtils.normalBoldSize(color: AppThemeUtils.black),
      ),
    );
  }

  StreamBuilder<String?> buildProductImageWidget() {
    return StreamBuilder<String?>(
      stream: controller.imageTempProduct.stream,
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
