import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/core/auth/auth_repository_interface.dart';
import 'package:marketplace_store_app/app/image/image_path.dart';
import 'package:marketplace_store_app/app/routes/constants_routes.dart';

import '../../app_bloc.dart';
import 'widget/animated_splash.dart';

class SplashPage extends StatelessWidget {
  var appBloc = Modular.get<AppBloc>();

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
  appBloc.getFirstAcess().then((access) {
    if (access ?? false) {
      Modular.to.pushReplacementNamed(ConstantsRoutes.ONBOARD);
    } else {
      appBloc.getCurrentUserFutureValue().then((currentUser) {
        print("user ${currentUser?.toMap()}");

        if (currentUser != null) {
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
