import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_store_app/app/image/image_path.dart';
import 'package:marketplace_store_app/app/utils/theme/app_theme_utils.dart';

Widget emptyViewMobile(BuildContext context,
    {String? emptyMessage,
      VoidCallback? tentarNovamente,
      bool isError = false,
      double? height = 130.0,
      double? heightImage = 50,
      double? size, String? buttomText}) {
  return Container(
      width: MediaQuery.of(context).size.width,
      child:SingleChildScrollView(child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(height: 30,),
          Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Image.asset(
                isError ? ImagePath.imageError : ImagePath.imageEmpty,
                height: 80,
                width:  150,

              )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              emptyMessage ?? "Não há nada por aqui",
              maxLines: 6,textAlign: TextAlign.center,
              style: AppThemeUtils.normalSize(
                  color: isError
                      ? AppThemeUtils.colorError
                      : Theme.of(context).textTheme.bodyText1?.color),
            ),
          ),
          SizedBox(height: 15,),
          tentarNovamente != null
              ? ElevatedButton(
              onPressed: tentarNovamente,
              child: Text(
                buttomText ?? "Atualizar",
                style: AppThemeUtils.normalSize(
                    color: Theme.of(context).primaryColor),
              ),
            )
              : SizedBox(),
        ],
      )));
}

