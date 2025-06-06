import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ModularApp(module: AppModule(), child: AppWidget()),
  ),
);
