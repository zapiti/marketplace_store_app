import 'package:marketplace_store_app/app/models/page/response_paginated.dart';
import 'package:marketplace_store_app/app/modules/home/modules/home/model/order.dart';


class HomeRepository {
  Future<ResponsePaginated> getListPendingOrder() async {
    await Future.delayed(Duration(seconds: 1));

    return ResponsePaginated(data: [Order(), Order()]);
  }

  Future<ResponsePaginated>  getListHistoryOrder() async{
    await Future.delayed(Duration(seconds: 1));

    return ResponsePaginated(data: [Order(), Order(),Order(), Order(),Order(), Order()]);
  }
}
