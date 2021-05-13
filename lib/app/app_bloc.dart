import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/configuration/app_configuration.dart';

import 'package:marketplace_store_app/app/modules/login/login_bloc.dart';

import 'package:rxdart/rxdart.dart';

import 'models/current_user.dart';

class AppBloc extends Disposable {
  final currentUser = BehaviorSubject<CurrentUser>();

  @override
  void dispose() {
    currentUser.close();
  }

  Future<CurrentUser> getCurrentUserFutureValue() async {
    var loginBloc = Modular.get<LoginBloc>();

    var localUser = await loginBloc.getToken();

    return AppConfiguration.userTest;
  }

  Future<CurrentUser> setCurrentUserFutureValue(CurrentUser currentUser) async {
    var loginBloc = Modular.get<LoginBloc>();

    var localUser = await loginBloc.setToken(currentUser);
    return AppConfiguration.userTest;
  }

  void setTokenUser(token) {
    getCurrentUserFutureValue().then((current) {
      current.token = token;
      setCurrentUserFutureValue(current);
    });
  }

 Future<bool> getFirstAcess() async{
    return false;
  }
}
