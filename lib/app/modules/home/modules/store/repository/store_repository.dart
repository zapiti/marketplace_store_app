import 'package:marketplace_entregador/app/models/page/response_paginated.dart';
import 'package:marketplace_entregador/app/modules/home/model/product.dart';

class StoreRepository {
  Future<ResponsePaginated> getListProducts() async {
    return ResponsePaginated(content: [Product()]);
  }
}
