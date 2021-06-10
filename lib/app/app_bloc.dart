import 'package:flutter_modular/flutter_modular.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:marketplace_store_app/app/configuration/app_configuration.dart';

import 'package:marketplace_store_app/app/modules/login/login_bloc.dart';
import 'package:marketplace_store_app/app/utils/preferences/cd_preferences.dart';

import 'package:rxdart/rxdart.dart';

import 'models/current_user.dart';

class AppBloc extends Disposable {
  static const FIRST_ACCESS = "FIRSTACCESS";
  final currentUser = BehaviorSubject<CurrentUser>();
  final loadElement = BehaviorSubject<bool>.seeded(false);
  final loginBloc = Modular.get<LoginBloc>();

  @override
  void dispose() {
    loadElement.close();
    currentUser.close();
  }

  Future<CurrentUser> getCurrentUserFutureValue() async {
    var localUser = await loginBloc.getToken();
    if (localUser != null) {
      try {
        final user = CurrentUser.fromMap(Jwt.parseJwt(localUser));
        currentUser.sink.add(user);
      } catch (e) {}
    }

    return currentUser.stream.value;
  }

  getCurrentUser() async {
    var _currentUser = await loginBloc.getCurrentUser();
    if(!currentUser.isClosed)
    currentUser.sink.add(_currentUser);
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
