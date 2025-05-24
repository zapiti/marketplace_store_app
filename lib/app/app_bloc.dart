import 'package:flutter_modular/flutter_modular.dart';
import 'package:jwt_decode/jwt_decode.dart';


import 'package:new_marketplace_app/app/modules/login/login_bloc.dart';
import 'package:new_marketplace_app/app/utils/preferences/local_data_store.dart';


import 'package:rxdart/rxdart.dart';

import 'models/current_user.dart';

class AppBloc extends Disposable {
  static const FIRST_ACCESS = "FIRSTACCESS";
  final currentUser = BehaviorSubject<CurrentUser?>();
  final loadElement = BehaviorSubject<bool>.seeded(false);
  final currentIndex = BehaviorSubject<int>.seeded(0);
  final loginBloc = Modular.get<LoginBloc>();

  @override
  void dispose() {
    loadElement.close();
    currentUser.close();
    currentIndex.close();
  }

  Future<CurrentUser?> getCurrentUserFutureValue() async {
    var localUser = await loginBloc.getToken();
    if (localUser != null) {
      try {
        final user = CurrentUser.fromMap(Jwt.parseJwt(localUser));
        currentUser.sink.add(user);
      } catch (e) {}
    }

    return currentUser.stream.valueOrNull;
  }

  getCurrentUser() async {
    var _currentUser = await loginBloc.getCurrentUser();
    if(!currentUser.isClosed)
    currentUser.sink.add(_currentUser);
  }

  Future<bool> getFirstAccess() async {
    var access =
        await LocalDataStore.getValue(key: FIRST_ACCESS);
    if (access == 'true') {
      LocalDataStore.setData(key: FIRST_ACCESS, value: false.toString());
    }
    return access == 'true';
  }

  void setCurrentIndex(int index) {
    currentIndex.sink.add(index);
  }
}
