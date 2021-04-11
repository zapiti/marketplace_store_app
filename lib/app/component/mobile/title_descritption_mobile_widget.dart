import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_entregador/app/utils/theme/app_theme_utils.dart';


Widget titleDescriptionWebWidget(BuildContext context,
    {String title,
    String description,
    GestureTapCallback action,
    Widget customIcon}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      children: <Widget>[
        SizedBox(height: 10),
        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                child: SelectableText(title ?? "--",
                    style: AppThemeUtils.normalSize(fontSize: 14))),
          ],
        ),
        description == null ? SizedBox():  Container(
            width: MediaQuery.of(context).size.width,
            child: SelectableText(
              description ?? "--",
              style: AppThemeUtils.normalBoldSize(),
            )),
        SizedBox(width: 10),
        action != null ? Icon(Icons.keyboard_arrow_right) : SizedBox(),
        SizedBox(width: 20),
      ],
    ),
  );
}

Widget titleDescriptionMobileWidget(BuildContext context,
    {String title,
    String description,
    GestureTapCallback action,
    Widget customIcon, IconData iconData}) {
  return InkWell(
    onTap: action,
    child:
       Container(
         margin: EdgeInsets.all(20),
           child:  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
           Icon(iconData ?? Icons.keyboard_arrow_right,color: AppThemeUtils.colorPrimary,),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(title ?? "",
                        style: AppThemeUtils.normalBoldSize(fontSize: 14))),
              ],
            )),
            description == null ? SizedBox():   Container(
              margin: EdgeInsets.only(left: 10),
                child: Text(
              description,
              style: AppThemeUtils.normalSize(fontSize: 14),
            )),
          ],
        )
    ),
  );
}
