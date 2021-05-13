import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/component/dialog/dialog_generic.dart';
import 'package:marketplace_store_app/app/modules/login/core/login_repository.dart';
import 'package:rxdart/rxdart.dart';

class LoginRememberBloc extends Disposable {
  @override
  void dispose() {
    _stateController.close();
  }

  final PublishSubject<bool> _stateController = PublishSubject<bool>();

  Stream<bool> get outStateController => _stateController.stream;

  sendEmail(BuildContext context, {@required String email}) {
    _putData(isLoading: true);
    LoginRepository.sendRecoverEmail(email: email).then((response) {
      _putData();

      if (response.error != null) {
        showGenericDialog(
            context: context,
            title: "Erro",
            description: response.error,
            positiveCallback: () {});

        return;
      }

      showGenericDialog(
          context: context,
          title: "Sucesso",
          description: response.content,
          positiveCallback: () {});

      Modular.to.pop();
      return;
    });
  }

  _putData({bool isLoading = false}) {
    if (!_stateController.isClosed) {
      _stateController.sink.add(isLoading);
    }
  }
}
