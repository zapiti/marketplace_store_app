
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_entregador/app/routes/constants_routes.dart';



class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Modular.to.navigate(ConstantsRoutes.CALL_HOMEPAGE);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RouterOutlet(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (id) {
          if (id == 0) {
            setState(() {
               currentIndex = 0;
            });
            Modular.to.navigate(ConstantsRoutes.CALL_HOMEPAGE);
          } else if (id == 1) {
            setState(() {
              currentIndex = 1;
            });
            Modular.to.navigate(ConstantsRoutes.CALL_STOREPAGE);
          } else if (id == 2) {
            setState(() {
              currentIndex = 2;
            });
            Modular.to.navigate(ConstantsRoutes.CALL_ACCOUNTPAGE);
          }
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(MaterialCommunityIcons.store),
            label: 'Minha loja',
          ),
          BottomNavigationBarItem(
            icon: Icon(MaterialCommunityIcons.account),
            label: 'Conta',
          ),
        ],
      ),
    );
  }
}