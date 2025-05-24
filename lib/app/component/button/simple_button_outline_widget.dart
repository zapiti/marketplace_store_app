import 'package:flutter/material.dart';
import 'package:new_marketplace_app/app/utils/theme/app_theme_utils.dart';

class SimpleButtonOutlineWidget extends StatelessWidget {
  SimpleButtonOutlineWidget({required this.text, this.onPressed});

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: () {
          if (onPressed != null) {
            onPressed?.call();
          }
        },
        child: Text(
          text,
          style: TextStyle(color: AppThemeUtils.colorPrimary, fontSize: 16),
        ),
      ),
    );
  }
}
