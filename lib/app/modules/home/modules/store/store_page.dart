import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_entregador/app/routes/constants_routes.dart';
import 'store_controller.dart';

class StorePage extends StatefulWidget {


  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends ModularState<StorePage, StoreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ConstantsRoutes.getNameByRoute(ModalRoute
            .of(context)
            .settings
            .name)),
      ),
      body: Container(color: Colors.green,),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.add),
      ),
    );
  }
}