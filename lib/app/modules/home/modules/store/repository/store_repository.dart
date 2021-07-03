import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/core/request_core.dart';
import 'package:marketplace_store_app/app/models/page/response_paginated.dart';
import 'package:marketplace_store_app/app/modules/home/model/product.dart';

class StoreRepository {
  var _requestManager = Modular.get<RequestCore>();

  Future<ResponsePaginated> getListProducts({int page = 0}) async {
    var result = await _requestManager.requestWithTokenToForm(
      serviceName:
          "/api/product/findAllByEstablishmentLogged?size=100&page=$page",
      isObject: false,
      funcFromMap: (data) => Product.fromMap(data),
      typeRequest: TYPEREQUEST.GET,
    );

    return result;
  }

  Future<ResponsePaginated> saveProducts(Product product) async {
    var result = await _requestManager.requestWithTokenToForm(
      serviceName: "/api/product",
      isObject: true,
      body: product.toMap(),
      funcFromMap: (data) => data,
      typeRequest: TYPEREQUEST.POST,
    );

    return result;
  }

  Future<ResponsePaginated> updateProducts(Product product) async {
    var result = await _requestManager.requestWithTokenToForm(
      serviceName: "/api/product",
      isObject: true,
      body: product.toMap(),
      funcFromMap: (data) => data,
      typeRequest: TYPEREQUEST.PUT,
    );

    return result;
  }
}
