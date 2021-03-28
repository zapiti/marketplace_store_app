import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_entregador/app/routes/constants_routes.dart';

import '../app_bloc.dart';



class RouterPermissionGuard implements RouteGuard {
  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    // TODO: implement canActivate
    return true;
  }
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
