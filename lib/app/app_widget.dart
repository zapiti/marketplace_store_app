import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_app/app/utils/theme/app_theme_utils.dart';

import 'component/load/load_view_element.dart';
import 'component/menu_bottom.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MaterialApp(
          title: 'Marketplace',
          theme: AppThemeUtils.customTheme(),
          initialRoute: '/',
          supportedLocales: [const Locale('pt', 'BR')],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false, builder: (_, child) {
          return MenuBottom(child!);
        },
        ).modular(),
        LoadViewElement(SizedBox()),
      ],
    );
  }
}
