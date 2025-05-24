import 'package:flutter/cupertino.dart';
import 'package:new_marketplace_app/app/utils/theme/app_theme_utils.dart';

class SimpleNavigationBarWidget extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  final String title;
  final Widget? trailing;

  SimpleNavigationBarWidget({required this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      middle: Text(
        title,
        style: TextStyle(color: AppThemeUtils.whiteColor),
      ),
      // actionsForegroundColor: AppThemeUtils.whiteColor,
      backgroundColor: AppThemeUtils.colorPrimary,
      brightness: Brightness.light,
      trailing: trailing,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    final Color backgroundColor =
        CupertinoDynamicColor.resolve(AppThemeUtils.colorPrimary, context) ??
            CupertinoTheme.of(context).barBackgroundColor;
    return backgroundColor.alpha == 0xFF;
  }
}
