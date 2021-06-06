import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/configuration/app_configuration.dart';

import 'package:marketplace_store_app/app/modules/login/login_bloc.dart';
import 'package:marketplace_store_app/app/utils/preferences/cd_preferences.dart';

import 'package:rxdart/rxdart.dart';

import 'models/current_user.dart';

class AppBloc extends Disposable {
  static const FIRST_ACCESS = "FIRSTACCESS";
  final currentUser = BehaviorSubject<CurrentUser>();

  @override
  void dispose() {
    currentUser.close();
  }

  Future<CurrentUser> getCurrentUserFutureValue() async {
    var loginBloc = Modular.get<LoginBloc>();

    var localUser = await loginBloc.getToken();

    return currentUser.stream.value;
  }

  Future<CurrentUser> setCurrentUserFutureValue(
      CurrentUser _currentUser) async {
    var loginBloc = Modular.get<LoginBloc>();

    var localUser = await loginBloc.setToken(_currentUser);
    return currentUser.stream.value;
  }

  void setTokenUser(token) {
    getCurrentUserFutureValue().then((current) {
      current.token = token;
      setCurrentUserFutureValue(current);
    });
  }

  Future<bool> getFirstAccess() async {
    var access =
        await codePreferences.getBoolean(key: FIRST_ACCESS, ifNotExists: true);
    if (access) {
      codePreferences.set(key: FIRST_ACCESS, value: false);
    }
    return access;
  }
}
