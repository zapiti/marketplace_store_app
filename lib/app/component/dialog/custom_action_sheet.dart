import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomActionSheet extends StatelessWidget {
  final String title;
  final String? description;
  final List<CupertinoActionSheetAction> actions;

  CustomActionSheet(
      {required this.title, required this.actions, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoActionSheet(
        title: Text(
          title,
          style: TextStyle(
              fontSize: 22,
              color: CupertinoTheme.of(context).primaryColor,
              fontFamily: 'Sora'),
        ),
        message: description != null
            ? Text(description!,
            style: CupertinoTheme.of(context).textTheme.textStyle)
            : Container(),
        cancelButton: CupertinoActionSheetAction(
          child: Text(
            "Cancelar",
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: actions,
      ),
    );
  }

  static showModal(BuildContext buildContext,
      {required String title,
        String? description,
        required List<CupertinoActionSheetAction> actions}) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: buildContext,
        builder: (BuildContext context) {
          return CustomActionSheet(
            actions: actions,
            title: title,
            description: description ?? '',
          );
        });
  }
}
