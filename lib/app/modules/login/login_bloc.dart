import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_entregador/app/component/dialog/dialog_generic.dart';
import 'package:marketplace_entregador/app/component/generic_dialog_widget.dart';
import 'package:marketplace_entregador/app/models/current_user.dart';
import 'package:marketplace_entregador/app/models/user_entity.dart';
import 'package:marketplace_entregador/app/modules/login/page/user_term.dart';
import 'package:marketplace_entregador/app/routes/constants_routes.dart';
import 'package:marketplace_entregador/app/utils/preferences/cd_preferences.dart';
import 'package:marketplace_entregador/app/utils/preferences/local_data_store.dart';
import 'package:marketplace_entregador/app/utils/preferences/security_preference.dart';
import 'package:rxdart/rxdart.dart';

import 'core/auth_repository.dart';

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

  var restoreIndex  = BehaviorSubject<int>.seeded(0);

  var codeController = TextEditingController();

  @override
  void dispose() {
    loadingSubject.drain();
    showPass.drain();
    userTermAccept.drain();
    showPassConfirm.drain();
    restoreIndex.drain();
  }

  Future<void> getLogout() async {
    await storage.clear();
    Modular.to.pushReplacementNamed(ConstantsRoutes.LOGIN);
  }

  Future<void> getLogin(BuildContext context) async {
    loadingSubject.sink.add(true);
    Future.delayed(Duration(seconds: 2),(){
      loadingSubject.sink.add(false);
      Modular.to.pushReplacementNamed(ConstantsRoutes.HOME);
    });
    // var response = await _authRepository.getLogin(
    //     username: emailController.text.toLowerCase(),
    //     password: passController.text);
    // loadingSubject.sink.add(false);
    // if (response.error == null) {
    //   var user = response.content;
    //   var current = CurrentUser.fromMap(user);
    //   await SecurityPreference.save(UserEntity(
    //       username: emailController.text.toLowerCase(),
    //       password: passController.text));
    //
    //   if (current.firstAccess ?? false) {
    //     await goToTerm();
    //   } else {
    //     Modular.to.pushReplacementNamed(ConstantsRoutes.HOME);
    //   }
    // } else {
    //   var erro = response.error == "Bad credentials"
    //       ? "Login ou senha incorretos"
    //       : response.error;
    //   showGenericDialog(
    //       context: context,
    //       title: "Ops!!!",
    //       description: erro,
    //       positiveCallback: () {});
    // }
  }

  Future goToTerm() async {
    var termos = await goToUserTerms();
    if (termos) {
      Modular.to.pushReplacementNamed(ConstantsRoutes.HOME);
    } else {
      storage.clear().then((value) {});
    }
  }

  Future<bool> goToUserTerms() async {
    var group = await Modular.to.push(
      MaterialPageRoute(builder: (context) => UserTerm("Termos de uso")),
    );
    return group;
  }

  Future<CurrentUser> getToken() {
    return _authRepository.getToken();
  }

  setToken(CurrentUser currentUser) {
    _authRepository.setToken(currentUser);
  }

  void nextActionRestore( Function() success) {
    var index = restoreIndex.stream.value;

    if(index >= 2 ){
      success();
      restoreIndex.sink.add(0);
      Modular.to.pushNamed(ConstantsRoutes.CALL_SUCESS_ALTERPASS);

    }else{
      restoreIndex.sink.add(index+1);
    }

  }
}
