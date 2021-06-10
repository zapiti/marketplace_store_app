import 'package:marketplace_store_app/app/models/code_response.dart';
import 'package:marketplace_store_app/app/models/page/response_paginated.dart';
import 'package:marketplace_store_app/app/utils/object/object_utils.dart';

class ResponseUtils {
  ///***@response e a resposta do servidor e @funcFromMap converte a resposta do servidor em algo @namedResponse e caso o servidor tenha um nome na resposta
  static List<T> getResponseList<T>(
      CodeResponse response, Function funcFromMap) {
    if (response?.sucess == null) {
      return [];
    }
    List<T> listElementGeneric = [];
    List listContent = response?.sucess?.toList();

    for (var columns in listContent) {
      var prods = funcFromMap(columns);
      listElementGeneric.add(prods);
    }
    return listElementGeneric;
  }

  ///***@response e a resposta do servidor e @funcFromMap converte a resposta do servidor em algo @namedResponse e caso o servidor tenha um nome na resposta
  static ResponsePaginated getResponsePaginated<T>(
      CodeResponse response, Function funcFromMap,
      {String namedResponse, int status}) {
    if (response?.sucess == null || response.error != null) {
      return ResponsePaginated(
          error: response.error ?? "Sem resposta do servidor!");
    }
    final resulted = response?.sucess.toString().contains("data")
        ? response.sucess["data"]
        : response.sucess;

    if (resulted.length == 0) {
      return ResponsePaginated.fromMapSimple(List<T>());
    }
    var tempResp = namedResponse != null ? resulted[namedResponse] : resulted;
    List<T> listElementGeneric = List<T>();
    List listElement = ObjectUtils.parseToObjectList<T>(tempResp,
        defaultValue: tempResp, isContent: true);

    if (listElement.isNotEmpty) {
      for (var columns in listElement) {
        var order = funcFromMap(columns);
        listElementGeneric.add(order);
      }
    }
    return ResponsePaginated.fromMap(response?.sucess, listElementGeneric);
  }

  ///***@response e a resposta do servidor e @funcFromMap converte a resposta do servidor em algo
  static ResponsePaginated getResponsePaginatedObject<T>(
      CodeResponse response, Function funcFromMap,
      {bool isObject = true, String namedResponse, int status}) {
    if (!isObject) {
      return getResponsePaginated(response, funcFromMap,
          namedResponse: namedResponse, status: status);
    } else {
      if (response?.sucess == null || response.error != null) {
        return ResponsePaginated(
            error: response.error ?? "Sem resposta do servidor!");
      }
      final resulted = response?.sucess.toString().contains("data")
          ? response.sucess["data"]
          : response.sucess;
      var tempResp = namedResponse != null
          ? resulted[namedResponse]
          : resulted;
      var object = ObjectUtils.parseToMap(tempResp, defaultValue: tempResp);

      return ResponsePaginated.fromMapSimple(funcFromMap(object));
    }
  }

  ///***@service e o nome do servico  @body e o body passado na requisicao  @result e o resultado do servidor
  static String getErrorBody(dynamic result) {
    var error = ObjectUtils.parseToMap(result, defaultValue: result) ?? result;

    if (error.toString().contains("data")) {
      error = error["data"];
    }

    if (error is Map && error != null) {
      return error["message"]?.toString() ??
          error["message"]?.toString() ??
          error["titulo"]?.toString() ??
          error["message"]?.toString() ??
          error["error_description"]?.toString() ??
          error["error"]?.toString();
    }
    if (error?.toString()?.contains("html") ?? false) {
      return (error?.toString()?.contains("Cannot") ?? false)
          ? "Serviço não existe"
          : "Servidor indisponível";
    } else {
      return error?.toString();
    }
  }
}
