import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';

class AccountController extends Disposable {
  var controllerPass = TextEditingController();

  var showPassActual = BehaviorSubject<bool>.seeded(true);

  var showPass = BehaviorSubject<bool>.seeded(true);

  var showPassConfirm = BehaviorSubject<bool>.seeded(true);

  var controllerConfirmPass = TextEditingController();

  var controllerPassActualPass  = TextEditingController();



  @override
  void dispose() {
    showPassActual.drain();
    showPass.drain();
    showPassConfirm.drain();
  }

  void updatePass(String text, BuildContext context) {}
}