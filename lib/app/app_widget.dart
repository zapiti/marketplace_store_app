import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_entregador/app/app_bloc.dart';
import 'package:marketplace_entregador/app/utils/theme/app_theme_utils.dart';



class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Marketplace',theme:AppThemeUtils.customTheme(),
      initialRoute: '/',
      supportedLocales: [const Locale('pt', 'BR')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      debugShowCheckedModeBanner: false,
    ).modular();
  }
}
