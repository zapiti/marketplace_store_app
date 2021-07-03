import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/app_bloc.dart';
import 'package:marketplace_store_app/app/component/builder/builder_component.dart';
import 'package:marketplace_store_app/app/component/builder/builder_infinity_listView_component.dart';
import 'package:marketplace_store_app/app/component/picker/user_image_widget.dart';
import 'package:marketplace_store_app/app/component/state_view/stateful_wrapper.dart';
import 'package:marketplace_store_app/app/models/current_user.dart';
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

  final appBloc = Modular.get<AppBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  StreamBuilder<CurrentUser> buildBody() {
    return StreamBuilder<CurrentUser>(
      stream: appBloc.currentUser,
      builder: (context, snapshotUser) {
        return buildBodyPage(context, snapshotUser);
      },
    );
  }

  StatefulWrapper buildBodyPage(
      BuildContext context, AsyncSnapshot<CurrentUser> snapshotUser) {
    return StatefulWrapper(
      onInit: () {},
      child: Column(
        children: [
          Stack(
            children: [
              buildWallpaper(context, snapshotUser),
              buildTitleTile(snapshotUser)
            ],
          ),
          buildAddProductButton(context),
          buildProductListWidget()
        ],
      ),
    );
  }

  Expanded buildProductListWidget() {
    return Expanded(
      child: builderComponent<ResponsePaginated>(
        stream: controller.listProducts,
        emptyMessage: "Seu estabelecimento ainda não possui produtos.",
        initCallData: () => controller.getListProducts(),
        // tryAgain: () {
        //   _blocFaq.getListFaq();
        // },
        buildBodyFunc: (context, response) => builderInfinityListViewComponent(
          response,
          callMoreElements: (page) => {},
          buildBody: (content) => ItemProductEdit(content),
        ),
      ),
    );
  }

  Container buildAddProductButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: EdgeInsets.all(20),
      child: ElevatedButton(
        child: Text(
          "ADICIONAR PRODUTO",
          style: AppThemeUtils.normalSize(color: AppThemeUtils.colorPrimary),
        ),
        style: ElevatedButton.styleFrom(
          primary: AppThemeUtils.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(4.0),
            side: BorderSide(color: AppThemeUtils.colorPrimary),
          ),
        ),
        onPressed: () {
          Modular.to.pushNamed(ConstantsRoutes.CALL_NEWPRODUCT);
        },
      ),
    );
  }

  Row buildTitleTile(AsyncSnapshot<CurrentUser> snapshotUser) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 100, left: 10),
          child: Center(
            child: UserImageWidget(
              changeImage: (txt) {
                controller.updateImageStore(txt);
              },
              userImage: snapshotUser.data?.establishment?.image,
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 100),
            child: Card(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      child: AutoSizeText(
                        snapshotUser.data?.establishment?.companyName ?? "",
                        maxLines: 1,
                        minFontSize: 8,
                        style: AppThemeUtils.normalBoldSize(),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      child: AutoSizeText(
                        snapshotUser.data?.establishment?.description ?? "",
                        maxLines: 2,
                        minFontSize: 8,
                        style: AppThemeUtils.normalSize(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Container buildWallpaper(
      BuildContext context, AsyncSnapshot<CurrentUser> snapshotUser) {
    return Container(
      child: UserImageWidget(
        changeImage: (txt) {
          controller.updateImageBg(txt);
        },
        width: MediaQuery.of(context).size.width,
        height: 160,
        isRounded: false,
        addButtom: "Imagem de fundo",
        userImage: snapshotUser.data?.establishment?.coverImage,
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Pedidos"),
      centerTitle: true,
    );
  }
}
