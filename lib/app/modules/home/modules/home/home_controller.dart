import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/models/page/response_paginated.dart';

import 'package:marketplace_store_app/app/modules/home/modules/home/repository/home_repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeController extends Disposable {
  final listPendingOrders = BehaviorSubject<ResponsePaginated?>();
  final listHistoryOrders = BehaviorSubject<ResponsePaginated?>();

  final _repository = HomeRepository();

  final revenue = BehaviorSubject<double>.seeded(5000);



  @override
  void dispose() {
    listHistoryOrders.drain();
    listPendingOrders.drain();
    revenue.drain();
  }

  getListPendingOrder() async {
    listPendingOrders.sink.add(null);
    var response = await _repository.getListPendingOrder();
    listPendingOrders.sink.add(response);
  }

  getListHistoryOrder() async {
    listHistoryOrders.sink.add(null);
    var response = await _repository.getListHistoryOrder();
    listHistoryOrders.sink.add(response);
  }



}
