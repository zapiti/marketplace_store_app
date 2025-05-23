import 'package:flutter/material.dart';
import 'package:marketplace_store_app/app/utils/theme/app_theme_utils.dart';

class SimpleButtonOutlineWidget extends StatelessWidget {
  SimpleButtonOutlineWidget({required this.text, this.onPressed});

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: RaisedButton(
        padding: EdgeInsets.all(16),
        color: AppThemeUtils.whiteColor,
        onPressed: () {
          if (onPressed != null) {
            onPressed?.call();
          }
        },
        child: Text(
          text,
          style: TextStyle(color: AppThemeUtils.colorPrimary, fontSize: 16),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(4.0),
            side: BorderSide(color:AppThemeUtils.colorPrimary)),
      ),
    );
  }
}
