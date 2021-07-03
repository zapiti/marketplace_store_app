import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/app_bloc.dart';
import 'package:marketplace_store_app/app/models/current_user.dart';
import 'package:marketplace_store_app/app/routes/constants_routes.dart';
import 'package:marketplace_store_app/app/utils/theme/app_theme_utils.dart';

class MenuBottom extends StatefulWidget {
  final Widget child;

  MenuBottom(this.child);

  @override
  _MenuBottomState createState() => _MenuBottomState();
}

class _MenuBottomState extends State<MenuBottom> {
  final appStore = Modular.get<AppBloc>();

  onTapSelectNavigation(int index, BuildContext context) {
    appStore.setCurrentIndex(index);

    switch (index) {
      case 0:
        Modular.to.navigate(ConstantsRoutes.CALL_HOMEPAGE);
        return;
      case 1:
        Modular.to.navigate(ConstantsRoutes.CALL_STOREPAGE);
        return;
      case 2:
        Modular.to.navigate(ConstantsRoutes.CALL_ACCOUNTPAGE);
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<int>(
            stream: appStore.currentIndex,
            initialData: 0,
            builder: (ctx, snapshotIndex) => StreamBuilder<CurrentUser?>(
              stream: appStore.currentUser,
                builder: (ctx, snapshot) =>Container(

                    color: AppThemeUtils.whiteColor,
                    child:  SafeArea(

                        child:  Scaffold(
                    body:  Column(
                      children: [
                        Expanded(child: widget.child),
                      ],
                    ),
                    bottomNavigationBar: snapshot.data == null
                        ? SizedBox()
                        : SafeArea(
                        child: BottomNavigationBar(

                            showSelectedLabels: true,
                            showUnselectedLabels: true,
                      type: BottomNavigationBarType.fixed,
                      backgroundColor: Colors.white,

                      elevation:0.0,
                            selectedItemColor: AppThemeUtils.colorPrimary,
                            unselectedItemColor: AppThemeUtils.greyColor,
                            onTap: (index) =>
                                onTapSelectNavigation(index, context),
                            items: [
                              BottomNavigationBarItem(
                                icon: Icon(Icons.home),
                                label: 'Home',
                              ),
                              BottomNavigationBarItem(
                                icon: Icon(Icons.store),
                                label: 'Minha loja',
                              ),
                              BottomNavigationBarItem(
                                icon: Icon(Icons.person),
                                label: 'Conta',
                              ),
                            ],
                            currentIndex: snapshotIndex.data ?? 0,
                          )))))));
  }
}
