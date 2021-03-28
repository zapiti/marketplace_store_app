import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_entregador/app/modules/home/core/home_repository.dart';

import '../../app_bloc.dart';

class HomeBloc extends Disposable {


  //dispose will be called automatically by closing its streams
  @override
  void dispose() {}

  Future<void> acceptTerm() async {
    var result = await HomeRepository().acceptTerm();

    var appBloc = Modular.get<AppBloc>();
    appBloc.getCurrentUserFutureValue().then((current) {
      current.firstAccess = false;
      appBloc.setCurrentUserFutureValue(current);
    });
  }
}
