

import 'package:marketplace_store_app/app/modules/home/model/product.dart';

class Order {
  DateTime dtCreate = DateTime.now().add(Duration(minutes: -20));

  int numPedido = 80045;

  List<Product> products = [ Product(),Product(),Product(),Product(),Product(),Product()];

}