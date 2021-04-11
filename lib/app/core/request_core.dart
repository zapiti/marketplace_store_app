import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_entregador/app/configuration/app_configuration.dart';
import 'package:marketplace_entregador/app/models/code_response.dart';
import 'package:marketplace_entregador/app/models/page/response_paginated.dart';
import 'package:marketplace_entregador/app/modules/login/core/auth_repository.dart';
import 'package:marketplace_entregador/app/modules/login/login_bloc.dart';
import 'package:marketplace_entregador/app/utils/network/network_service.dart';
import 'package:marketplace_entregador/app/utils/preferences/security_preference.dart';
import 'package:marketplace_entregador/app/utils/response/response_utils.dart';
import 'package:marketplace_entregador/app/utils/string/string_file.dart';

import 'auth/auth_repository_interface.dart';
import 'client/api_client.dart';

enum TYPEREQUEST { PATCH, POST, PUT, GET, DELETE }

class RequestCore {
  static const TYPE_GET = "GET";
  static const TYPE_POST = "POST";
  static const TYPE_PUT = "PUT";
  static const showBody = true;


  ///@serviceName e o nome do servico chamado
  ///@funcFromMap e conversao da sua funcao para algo que voce quer
  ///@body e o corpo da requisicao
  ///@typeRequest  e o tipo da requisicao
  ///@namedResponse e se a requisicao tem um nome
  ///@isImage e caso o enviado seja multpartFile
  ///isJsonResponse e caso nao precise dar parce no body pra json
  Future<ResponsePaginated> requestWithTokenToForm(
      {@required serviceName,
      @required funcFromMap,
      dynamic body,
      @required TYPEREQUEST typeRequest,
      String namedResponse,
      bool isImage = false,
      bool isJsonResponse = true, bool isObject = true}) async {
    try {
      debugPrint(
          "SERVICOCHAMADO = $serviceName body = ${jsonEncode(body ?? {})}");
    } catch (e) {}

    var checkCelular = await NetWorkService.check();
    if (!checkCelular) {
      return ResponsePaginated(error: StringFile.semConexaoRede);
    } else {
      if (AppConfiguration.isMockDevTest) {
        return ResponsePaginated();
      } else {
        var api = await ApiClient().getApiClient();

        try {
          return await requestMyApp(typeRequest, api, serviceName, isJsonResponse, isImage, body, funcFromMap, namedResponse, isObject);
        } on DioError catch (e) {
          print(
              "***RETORNO-SERVICO (Erro)(${typeRequest.toString()}) = $serviceName body = ${showBody ? e : {}}");

          if(e.response?.statusCode == 403){
            return tryAgainElement(typeRequest, api, serviceName, isJsonResponse, isImage, body, funcFromMap, namedResponse, isObject);
          }else{
            var msg =
            ResponseUtils.getErrorBody( e.response?.data);
            return ResponseUtils.getResponsePaginatedObject(
                CodeResponse(error: msg), funcFromMap,
                status: e?.response?.statusCode);
          }

        } on Exception catch (e) {
          var msg =
              ResponseUtils.getErrorBody( e?.toString()) ??
                  "Sem descrição de erro";
          return ResponseUtils.getResponsePaginatedObject(
              CodeResponse(error: msg), funcFromMap,
              status: 500);
        }
      }
    }
  }

  Future<ResponsePaginated> requestMyApp(TYPEREQUEST typeRequest, Dio api, serviceName, bool isJsonResponse, bool isImage, body, funcFromMap, String namedResponse, bool isObject) async {
        Response response;
    switch (typeRequest) {
      case TYPEREQUEST.GET:
        response = await api.get(
          serviceName,
          options: Options(
            contentType: "application/json;charset=UTF-8",
          ),
        );
        break;
      case TYPEREQUEST.POST:
        response = await api.post(
          serviceName,
          data: isJsonResponse
              ? isImage
                  ? body
                  : jsonEncode(body ?? {})
              : body,
          options: Options(
            contentType: isImage
                ? 'multipart/form-data'
                : "application/json;charset=UTF-8",
          ),
        );
        break;

      case TYPEREQUEST.PUT:
        response = await api.put(
          serviceName,
          data: isJsonResponse
              ? isImage
                  ? body
                  : jsonEncode(body ?? {})
              : body,
          options: Options(
            contentType: isImage
                ? 'multipart/form-data'
                : "application/json;charset=UTF-8",
          ),
        );
        break;

      case TYPEREQUEST.PATCH:
        response = await api.patch(
          serviceName,
          data: isJsonResponse
              ? isImage
                  ? body
                  : jsonEncode(body ?? {})
              : body,
          options: Options(
            contentType: isImage
                ? 'multipart/form-data'
                : "application/json;charset=UTF-8",
          ),
        );
        break;
      case TYPEREQUEST.DELETE:
        response = await api.delete(
          serviceName,
          data: isJsonResponse
              ? isImage
                  ? body
                  : jsonEncode(body ?? {})
              : body,
          options: Options(
            contentType: isImage
                ? 'multipart/form-data'
                : "application/json;charset=UTF-8",
          ),
        );
        break;
      default:
        response = await api.post(
          serviceName,
          data: isJsonResponse
              ? isImage
                  ? body
                  : jsonEncode(body ?? {})
              : body,
          options: Options(
            contentType: isImage
                ? 'multipart/form-data'
                : "application/json;charset=UTF-8",
          ),
        );
        break;
    }

    var statusCode = response?.statusCode;
    print("Current status code: $statusCode");

    print(
        "##RETORNO-SERVICO(${typeRequest.toString()}) = $serviceName body = ${showBody ? response?.data : {}}");
    if (statusCode == 200 || statusCode == 201 || statusCode == 202) {


        return ResponseUtils.getResponsePaginatedObject(
            CodeResponse(
                sucess:  response?.data),
            funcFromMap,
            namedResponse: namedResponse,isObject: isObject,
            status: response?.statusCode);

      // return tryAgainElement(typeRequest, api, serviceName, isJsonResponse, isImage, body, funcFromMap, namedResponse, isObject);


    } else {
      return ResponseUtils.getResponsePaginatedObject(
          CodeResponse(error: response), funcFromMap,
          status: response?.statusCode);
    }
  }
  Future<ResponsePaginated> tryAgainElement(TYPEREQUEST typeRequest, Dio api, serviceName, bool isJsonResponse, bool isImage, body, funcFromMap, String namedResponse, bool isObject) async {
    var user = await SecurityPreference.getUser();
    var auth = Modular.get<AuthRepository>();

    ResponsePaginated codeReponse =
    await auth.getLogin(username: user.username, password: user.password,);
    if (codeReponse.error != null) {
      auth.getLogout();
      return ResponsePaginated(error: "Falha ao logar");
    } else {
      try {
        return await requestMyApp(typeRequest, api, serviceName, isJsonResponse, isImage, body, funcFromMap, namedResponse, isObject);
      } on DioError catch (e) {
        // auth.getLogout();
        return ResponsePaginated(error: "Falha ao logar");
      } on Exception catch (exe) {
        //   auth.getLogout();
        return ResponsePaginated(error: "Falha ao logar");
      }
    }
  }
}
