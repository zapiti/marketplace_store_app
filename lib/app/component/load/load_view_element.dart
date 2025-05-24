import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_app/app/utils/theme/app_theme_utils.dart';


import '../../app_bloc.dart';
import 'load_elements.dart';

class LoadViewElement extends StatelessWidget {
  final appBloc = Modular.get<AppBloc>();
  final Widget child;

  LoadViewElement(this.child);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: appBloc.loadElement.stream,
      initialData: false,
      builder: (context, snapshot) => AbsorbPointer(
          absorbing: snapshot.data!,
          child: !snapshot.data! ? SizedBox(): Stack(children: [
            child,
            Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Colors.black45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    loadElements(context, color: AppThemeUtils.whiteColor),
                    Text(
                      "Carregando...",
                      style: AppThemeUtils.normalBoldSize(
                          color: AppThemeUtils.whiteColor),
                    )
                  ],
                )),
          ])),
    );
  }
}
