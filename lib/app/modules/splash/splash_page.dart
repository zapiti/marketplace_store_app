import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_app/app/core/auth/auth_repository_interface.dart';
import 'package:new_marketplace_app/app/image/image_path.dart';
import 'package:new_marketplace_app/app/routes/constants_routes.dart';
import 'package:new_marketplace_app/app/utils/preferences/local_data_store.dart';

import '../../app_bloc.dart';
import 'widget/animated_splash.dart';

class SplashPage extends StatelessWidget {
  final appBloc = Modular.get<AppBloc>();

  @override
  Widget build(BuildContext context) {


    return AnimatedSplash(
      imagePath: ImagePath.imageLogo,
      customFunction: () {
        redirectToPage(context);
      },
      duration: 30,
    );
  }
}

Future<void> redirectToPage(BuildContext context) async {
  final auth = Modular.get<IAuthRepository>();
  final appBloc = Modular.get<AppBloc>();

  if (!kIsWeb) {
    _redirectToAuth(context, auth, appBloc);
  } else {
    _redirectToAuth(context, auth, appBloc);
  }
}

void _redirectToAuth(
    BuildContext context, IAuthRepository auth, AppBloc appBloc) {
  appBloc.getFirstAccess().then((access) {
    if (access) {
      Modular.to.pushReplacementNamed(ConstantsRoutes.ONBOARD);
    } else {
      // Verificar primeiro se o usuário está no modo convidado
      LocalDataStore.getValue(key: 'isGuest').then((isGuest) {
        if (isGuest == 'true') {
          // Se for usuário convidado, vai direto para a tela principal
          Modular.to.pushReplacementNamed(ConstantsRoutes.HOME);
        } else {
          // Caso contrário, verifica se o usuário está logado
          appBloc.getCurrentUserFutureValue().then((currentUser) {
            print("user ${currentUser?.toMap()}");

            if (currentUser != null) {
              appBloc.getCurrentUser();
              try {
                appBloc.currentUser.sink.add(currentUser);
                Modular.to.pushReplacementNamed(ConstantsRoutes.HOME);
              } catch (ex) {
                Modular.to.pushReplacementNamed(ConstantsRoutes.HOME);
              }
            } else {
              Modular.to.pushReplacementNamed(ConstantsRoutes.LOGIN);
            }
          });
        }
      });
    }
  });
}
