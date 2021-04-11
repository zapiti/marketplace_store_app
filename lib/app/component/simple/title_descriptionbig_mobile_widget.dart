import 'package:flutter/material.dart';
import 'package:marketplace_entregador/app/utils/theme/app_theme_utils.dart';

class TitleDescriptionBigMobileWidget extends StatelessWidget {
  String title;
  Widget customIcon;
  Function action;

  TitleDescriptionBigMobileWidget(
      {this. title, this. action, this.customIcon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: action,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Container(
                          child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title ?? "",
                          maxLines: 1,
                          style: AppThemeUtils.normalBoldSize(fontSize: 16)),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ))),
                  SizedBox(width: 10),
                  customIcon ??
                      (action != null
                          ? Icon(
                              Icons.keyboard_arrow_right,
                              color:AppThemeUtils.colorPrimary,
                            )
                          : SizedBox()),
                  SizedBox(width: 10),
                ],
              ),
            ],
          ),
        ));
  }
}
