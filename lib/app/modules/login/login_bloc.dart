import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_app/app/models/address/address.dart';
import 'package:new_marketplace_app/app/models/current_user.dart';
import 'package:new_marketplace_app/app/models/store/store.dart';

import 'package:new_marketplace_app/app/modules/login/page/user_term.dart';
import 'package:new_marketplace_app/app/routes/constants_routes.dart';

import 'package:new_marketplace_app/app/utils/preferences/local_data_store.dart';

import 'package:new_marketplace_app/app/utils/utils.dart';
import 'package:rxdart/rxdart.dart';

import 'core/auth_repository.dart';
import 'core/login_repository.dart';

class LoginBloc extends Disposable {
  var emailController = TextEditingController();
  var passController = TextEditingController();

  var loadingSubject = BehaviorSubject<bool>.seeded(false);

  var _authRepository = Modular.get<AuthRepository>();

  var showPass = BehaviorSubject<bool>.seeded(true);

  var passControllerConfirm = TextEditingController();

  var userTermAccept = BehaviorSubject<bool>.seeded(false);

  var showPassConfirm = BehaviorSubject<bool>.seeded(true);

  var nameControler = TextEditingController();

  var restoreIndex = BehaviorSubject<int>.seeded(0);

  var codeController = TextEditingController();

  var zipCodeController = MaskedTextController(mask: Utils.geMaskCep());

  var addressController = TextEditingController();

  var stateController = TextEditingController();

  var cityController = TextEditingController();

  var numberController = TextEditingController();

  var complementController = TextEditingController();

  var neighborhoodController = TextEditingController();

  var phoneController = MaskedTextController(mask: Utils.getPhoneMask());

  var descriptionController = TextEditingController();

  var responsableController = TextEditingController();

  var typeController = TextEditingController();

  var cnpjController = MaskedTextController(mask: Utils.getMaskCnpj());

  // Método para entrar sem usuário (como convidado)
  Future<void> enterWithoutUser(BuildContext context) async {
    loadingSubject.sink.add(true);
    try {
      // Definindo que o usuário está entrando como convidado
      await LocalDataStore.setData(key: 'isGuest', value: 'true');

      // Redirecionando para a tela principal
      Modular.to.pushReplacementNamed(ConstantsRoutes.HOME);
    } catch (e) {
      Utils.showSnackbar(
        context,
        "Erro ao entrar como convidado. Tente novamente.",
      );
    } finally {
      loadingSubject.sink.add(false);
    }
  }

  @override
  void dispose() {
    loadingSubject.drain();
    showPass.drain();
    userTermAccept.drain();
    showPassConfirm.drain();
    restoreIndex.drain();
  }

  Future<void> getLogout() async {
    await LocalDataStore.deleteAll();
    Modular.to.pushReplacementNamed(ConstantsRoutes.LOGIN);
  }

  Future<void> getLogin(BuildContext context) async {
    // loadingSubject.sink.add(true);
    // Future.delayed(Duration(seconds: 2), () {
    //   loadingSubject.sink.add(false);
    //   var appBloc = Modular.get<AppBloc>();
    //   appBloc.currentUser.sink.add(AppConfiguration.userTest);
    //   Modular.to.pushReplacementNamed(ConstantsRoutes.HOME);
    // });
    var response = await _authRepository.getLogin(
      username: emailController.text.toLowerCase(),
      password: passController.text,
    );
    // loadingSubject.sink.add(false);
    if (response?.error == null) {
      Modular.to.pushReplacementNamed(ConstantsRoutes.HOME);
    } else {
      Utils.showSnackbar(context, response?.error);
    }
  }

  Future goToTerm() async {
    var termos = await goToUserTerms();
    if (termos) {
      Modular.to.pushReplacementNamed(ConstantsRoutes.HOME);
    } else {
      LocalDataStore.deleteAll().then((value) {});
    }
  }

  Future<bool> goToUserTerms() async {
    var group = await Modular.to.push(
      MaterialPageRoute(builder: (context) => UserTerm("Termos de uso")),
    );
    return group;
  }

  Future<String?> getToken() {
    return _authRepository.getToken();
  }

  setToken(CurrentUser currentUser) {
    _authRepository.setToken(currentUser);
  }

  void nextActionRestore(Function() success) {
    var index = (restoreIndex.stream.valueOrNull ?? 0);

    if (index >= 2) {
      success();
      restoreIndex.sink.add(0);
      Modular.to.pushNamed(ConstantsRoutes.CALL_SUCESS_ALTERPASS);
    } else {
      restoreIndex.sink.add(index + 1);
    }
  }

  void getRegistre(BuildContext context) async {
    if (passController.text.isEmpty) {
      Utils.showSnackbar(context, "Senha não pode ser vazia");
    } else if (passController.text != passControllerConfirm.text) {
      Utils.showSnackbar(context, "Senha não pode ser diferentes");
    } else if (!(userTermAccept.stream.valueOrNull ?? false)) {
      Utils.showSnackbar(
        context,
        "Ë necessario aceitar os termos de uso para se registrar",
      );
    } else {
      final Address address = Address(
        zipCode: zipCodeController.text,
        address: addressController.text,
        number: numberController.text,
        complement: complementController.text,
        neighborhood: neighborhoodController.text,
        city: cityController.text,
        state: stateController.text,
      );

      final Store store = Store(
        cnpj: Utils.removeMask(cnpjController.text),
        companyName: nameControler.text,
        email: emailController.text,
        password: passController.text,
        phone: Utils.removeMask(phoneController.text),
        responsible: responsableController.text,
        description: descriptionController.text,
        type: typeController.text,
        address: address,
      );

      final _result = await LoginRepository.registerStore(store);
      if (_result?.error == null) {
        zipCodeController.clear();
        addressController.clear();
        numberController.clear();
        complementController.clear();
        neighborhoodController.clear();
        cityController.clear();
        stateController.clear();
        cnpjController.clear();
        nameControler.clear();
        emailController.clear();
        passController.clear();
        phoneController.clear();
        responsableController.clear();
        descriptionController.clear();
        typeController.clear();

        Modular.to.pushNamed(ConstantsRoutes.CALL_SUCESS_REGISTER);
      } else {
        Utils.showErrorDialog(context, _result?.error);
      }
    }
  }

  Future<CurrentUser?> getCurrentUser() async {
    final _result = await LoginRepository.getCurrentUser();
    if (_result?.error == null) {
      return _result?.data;
    } else {
      return null;
    }
  }
}
