import 'package:flutter/material.dart';
import 'package:marketplace_store_app/app/utils/theme/app_theme_utils.dart';

class SimpleButtonFilledWidget extends StatelessWidget {
  SimpleButtonFilledWidget(
      {@required this.text, this.onPressed, this.color, this.icon});

  final String text;
  final VoidCallback onPressed;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: RaisedButton(
        padding: EdgeInsets.all(16),
        color: color ?? AppThemeUtils.colorPrimary,
        onPressed: () {
          if (onPressed != null) {
            onPressed();
          }
        },
        child: icon != null
            ? Icon(
                icon,
                color: Colors.white,
              )
            : Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none),
      ),
    );
  }
}
