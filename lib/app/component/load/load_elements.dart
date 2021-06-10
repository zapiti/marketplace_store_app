import 'package:flutter/material.dart';

Widget loadElements(BuildContext context,
    {double size = 80,
    double width = 80,
    Color color,
    bool isSimple = false,
    EdgeInsets margin}) {
  return Container(
    width: width ,
    height: size,
    margin: margin,
    color: color,
    alignment: Alignment.center,
    child: CircularProgressIndicator(
      valueColor:
          AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColorLight),
      strokeWidth: 4,
    ),
  );
}
