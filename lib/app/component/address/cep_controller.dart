import 'package:flutter/material.dart';
import 'package:search_cep/search_cep.dart';

class CepController {
  static getCepController(
      {required TextEditingController zipCodeController,
      required TextEditingController addressController,
      required TextEditingController neighborhoodController,
      required TextEditingController cityController,
      required TextEditingController stateController,
      required Function(bool) enableField}) {
    zipCodeController.addListener(() async {
      if (zipCodeController.text.length == 10) {
        var resulted = await ViaCepSearchCep().searchInfoByCep(
            cep:
                zipCodeController.text.replaceAll(".", "").replaceAll("-", ""));

        if (resulted.isRight()) {
          enableField(true);
        } else {
          cleanFields(zipCodeController, addressController,
              neighborhoodController, cityController, stateController);
          enableField(false);
        }
        if (resulted.isRight()) {
          resulted.fold((l) => l, (result) {
            if (result.logradouro != null &&
                (result.logradouro ?? '').isNotEmpty) {
              addressController.text = result.logradouro ?? '';
            }
            if (result.bairro != null && (result.bairro ?? '').isNotEmpty) {
              neighborhoodController.text = result.bairro ?? '';
            }
            if (result.localidade != null &&
                (result.localidade ?? '').isNotEmpty) {
              cityController.text = result.localidade ?? '';
            }
            if (result.uf != null && (result.uf ?? '').isNotEmpty) {
              stateController.text = result.uf ?? '';
            }
          });
        }
      } else {
        cleanFields(zipCodeController, addressController,
            neighborhoodController, cityController, stateController);
      }
    });
  }

  static void cleanFields(
      TextEditingController zipCodeController,
      TextEditingController addressController,
      TextEditingController neighborhoodController,
      TextEditingController cityController,
      TextEditingController stateController) {
    if (addressController.text.isNotEmpty &&
        neighborhoodController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        stateController.text.isNotEmpty) {
      addressController.clear();
      neighborhoodController.clear();
      cityController.clear();
      stateController.clear();
    }
  }
}
