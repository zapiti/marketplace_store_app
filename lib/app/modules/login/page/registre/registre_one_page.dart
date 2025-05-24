import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_app/app/component/address/address_cep_component.dart';

import 'package:new_marketplace_app/app/component/store/store_type.dart';

import 'package:new_marketplace_app/app/modules/login/login_bloc.dart';
import 'package:new_marketplace_app/app/routes/constants_routes.dart';

import 'package:new_marketplace_app/app/utils/theme/app_theme_utils.dart';
import 'package:new_marketplace_app/app/utils/utils.dart';

class RegistreOnePage extends StatefulWidget {
  @override
  _RegistreOnePageState createState() => _RegistreOnePageState();
}

class _RegistreOnePageState extends State<RegistreOnePage> {
  var bloc = Modular.get<LoginBloc>();

  String? errorName;

  var errorDescription;

  var errorResponsable;

  var errorPhone;

  var errorCnpj;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppThemeUtils.colorPrimary),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 20),
              Container(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                              top: 10,
                              right: 10,
                              left: 10,
                            ),
                            child: Text(
                              "Nos conte mais",
                              style: AppThemeUtils.normalBoldSize(fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              right: 10,
                              left: 10,
                            ),
                            child: Text(
                              "Para que possamos conhecer o estabelecimento.",
                              style: AppThemeUtils.normalSize(fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                              left: 10,
                              right: 10,
                            ),
                            child: TextField(
                              controller: bloc.cnpjController,
                              onChanged: (text) {
                                if (errorCnpj != null) {
                                  setState(() {
                                    errorCnpj = null;
                                  });
                                }
                              },
                              decoration: InputDecoration(
                                errorText: errorCnpj,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                                labelText: 'Cnpj',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                              left: 10,
                              right: 10,
                            ),
                            child: TextField(
                              controller: bloc.nameControler,
                              onChanged: (text) {
                                if (errorName != null) {
                                  setState(() {
                                    errorName = null;
                                  });
                                }
                              },
                              decoration: InputDecoration(
                                errorText: errorName,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                                labelText: 'Nome do estabelecimento',
                              ),
                            ),
                          ),
                          StoreType(bloc.typeController),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                              left: 10,
                              right: 10,
                            ),
                            child: TextField(
                              controller: bloc.responsableController,
                              onChanged: (text) {
                                if (errorResponsable != null) {
                                  setState(() {
                                    errorResponsable = null;
                                  });
                                }
                              },
                              decoration: InputDecoration(
                                errorText: errorResponsable,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                                labelText: 'Nome do responsável',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                              left: 10,
                              right: 10,
                            ),
                            child: TextField(
                              controller: bloc.descriptionController,
                              onChanged: (text) {
                                if (errorDescription != null) {
                                  setState(() {
                                    errorDescription = null;
                                  });
                                }
                              },
                              decoration: InputDecoration(
                                errorText: errorDescription,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                                labelText: 'Descrição sobre o estabelecimento',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                              left: 10,
                              right: 10,
                            ),
                            child: TextField(
                              controller: bloc.phoneController,
                              onChanged: (text) {
                                if (errorPhone != null) {
                                  setState(() {
                                    errorPhone = null;
                                  });
                                }
                              },
                              decoration: InputDecoration(
                                errorText: errorPhone,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                                labelText: 'Telefone do estabelecimento',
                              ),
                            ),
                          ),
                          AddressCepComponent(
                            zipCodeController: bloc.zipCodeController,
                            addressController: bloc.addressController,
                            numberController: bloc.numberController,
                            complementController: bloc.complementController,
                            neighborhoodController: bloc.neighborhoodController,
                            cityController: bloc.cityController,
                            stateController: bloc.stateController,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                              left: 10,
                              right: 10,
                              bottom: 200,
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppThemeUtils.colorPrimary,
                                ),
                                child: Text(
                                  "CONTINUAR",
                                  style: AppThemeUtils.normalSize(
                                    color: AppThemeUtils.whiteColor,
                                  ),
                                ),
                                onPressed: () {
                                  var error;
                                  if (!CNPJValidator.isValid(
                                    bloc.cnpjController.text,
                                  )) {
                                    setState(() {
                                      errorCnpj = "Cnpj é inválido";
                                    });
                                  } else if (bloc.nameControler.text.length <=
                                      4) {
                                    setState(() {
                                      errorName =
                                          "Adicione um o nome do com no minimo 3 caracteres";
                                    });
                                  } else if (bloc.typeController.text.isEmpty) {
                                    Utils.showSnackbar(
                                      context,
                                      "Selecione o tipo de estabelecimento",
                                    );
                                  } else if (bloc
                                      .responsableController
                                      .text
                                      .isEmpty) {
                                    setState(() {
                                      errorResponsable =
                                          "Responsável não pode ser vazio";
                                    });
                                  } else if (bloc
                                      .descriptionController
                                      .text
                                      .isEmpty) {
                                    setState(() {
                                      errorDescription =
                                          "Descrição não pode ser vazio";
                                    });
                                  } else if (bloc
                                      .phoneController
                                      .text
                                      .isEmpty) {
                                    setState(() {
                                      errorPhone = "Telefone é obrigatório";
                                    });
                                  } else if (bloc
                                          .zipCodeController
                                          .text
                                          .isEmpty ||
                                      bloc.addressController.text.isEmpty ||
                                      bloc.numberController.text.isEmpty ||
                                      bloc
                                          .neighborhoodController
                                          .text
                                          .isEmpty ||
                                      bloc.cityController.text.isEmpty ||
                                      bloc.numberController.text.isEmpty ||
                                      bloc.stateController.text.isEmpty) {
                                    Utils.showSnackbar(
                                      context,
                                      "Endereço é obrigatório",
                                    );
                                  } else {
                                    Modular.to.pushNamed(
                                      ConstantsRoutes.CALL_REGISTRE_EMAIL,
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
