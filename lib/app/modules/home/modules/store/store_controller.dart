import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_entregador/app/models/page/response_paginated.dart';
import 'package:marketplace_entregador/app/modules/home/modules/store/repository/store_repository.dart';
import 'package:rxdart/rxdart.dart';

class StoreController extends Disposable {
  final imageBackground = BehaviorSubject<String>.seeded("https://media-cdn.tripadvisor.com/media/photo-s/05/17/27/44/bar-da-esquina.jpg");
  final imgUser= BehaviorSubject<String>.seeded("https://s3-sa-east-1.amazonaws.com/projetos-artes/fullsize%2F2011%2F06%2F26%2F10%2FWDL-Logo-5088_512_040125572_726027898.jpg");

  final listProducts = BehaviorSubject<ResponsePaginated>();

  final _repository = StoreRepository();

  @override 
  void dispose() {
    imageBackground.close();
    imgUser.close();
    listProducts.close();
  }

  getListProducts() async {
    listProducts.sink.add(null);
    var response = await _repository.getListProducts();
    listProducts.sink.add(response);
  }
}