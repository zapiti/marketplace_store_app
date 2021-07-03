import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationColoredCardWidget extends StatelessWidget {
  final Widget? child;
  final Function()? action;
  final Color? color;

  NotificationColoredCardWidget({this.child, this.action,this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(

        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child:  Card(child:  Container(

        decoration: BoxDecoration(
            color: color ?? Color.fromARGB(255, 205, 229, 214),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        clipBehavior: Clip.antiAlias,
        child: child,
      ))),
    );
  }
}
