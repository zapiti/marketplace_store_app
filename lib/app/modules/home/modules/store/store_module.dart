import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_app/app/modules/home/modules/store/page/new_store_product_barcode_page.dart';
import 'package:new_marketplace_app/app/modules/home/modules/store/page/new_store_product_page.dart';
import 'package:new_marketplace_app/app/modules/home/modules/store/page/new_store_product_quantity_page.dart';
import 'package:new_marketplace_app/app/routes/constants_routes.dart';

import 'store_controller.dart';
import 'store_page.dart';

class StoreModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => StorePage()),
    ChildRoute(ConstantsRoutes.NEWPRODUCT,
        child: (_, args) => NewStoreProductPage()),
    ChildRoute(ConstantsRoutes.NEWPRODUCTQUANTITY,
        child: (_, args) => NewStoreProductQuantityPage()),
    ChildRoute(ConstantsRoutes.NEWPRODUCTBARCODE,
        child: (_, args) => NewStoreProductBarCodePage()),
  ];
}
