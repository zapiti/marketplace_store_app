import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_entregador/app/routes/constants_routes.dart';
import 'home_controller.dart';

class HomeInitialPage extends StatefulWidget {


  @override
  _HomeInitialPageState createState() => _HomeInitialPageState();
}

class _HomeInitialPageState extends ModularState<HomeInitialPage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ConstantsRoutes.getNameByRoute(ModalRoute
            .of(context)
            .settings
            .name)),
      ),
      body: Container(color: Colors.pink,),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.add),
      ),
    );
  }
}