import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_app/app/routes/constants_routes.dart';

import '../app_bloc.dart';



class RouterPermissionGuard implements RouteGuard {
  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    // TODO: implement canActivate
    return true;
  }

  @override
  // TODO: implement guardedRoute
  String get guardedRoute => "";
  // @override
  // bool canActivate(String url,r) {
  //   return true;
  // }
  //
  // @override
  // // TODO: implement executors
  // List<GuardExecutor> get executors => [LoginExecutor()];
}
//
// class LoginExecutor extends GuardExecutor {
//   @override
//   onGuarded(String path, {bool isActive}) {
//     final _blocApp = Modular.get<AppBloc>();
//     _blocApp.getCurrentUserFutureValue().then((value) {
//
//       if(value ==  null){
//         // Modular.to.pushReplacementNamed(ConstantsRoutes.LOGIN);
//       }else{
//         //  PermissionUtils.initialRedirect();
//       }
//     });
//
//   }
// }
