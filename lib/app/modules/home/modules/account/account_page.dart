import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_entregador/app/routes/constants_routes.dart';
import 'account_controller.dart';

class AccountPage extends StatefulWidget {


  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends ModularState<AccountPage, AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ConstantsRoutes.getNameByRoute(ModalRoute
            .of(context)
            .settings
            .name)),
      ),
      body: Container(color: Colors.red,),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.add),
      ),
    );
  }
}