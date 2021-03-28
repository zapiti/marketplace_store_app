import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'image/image_path.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final _bloc = Modular.get<AppBloc>();

    return MaterialApp(
      title: 'Marketplace',
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
