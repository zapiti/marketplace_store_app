import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_marketplace_app/app/utils/theme/app_theme_utils.dart';

Function? _customFunction;
String? _imagePath;

int? _duration;

class AnimatedSplash extends StatefulWidget {
  AnimatedSplash(
      {required String? imagePath, Function? customFunction, int? duration}) {
    assert(duration != null);

    assert(imagePath != null);

    _duration = duration;
    _customFunction = customFunction;
    _imagePath = imagePath;
  }

  @override
  _AnimatedSplashState createState() => _AnimatedSplashState();
}

class _AnimatedSplashState extends State<AnimatedSplash>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;
  bool enableSplash = true;
  @override
  void initState() {
    super.initState();

    if (_duration! < 1000) _duration = 2000;
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 800));
    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController!, curve: Curves.easeInCirc));
    _animationController?.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController?.reset();
  }

  @override
  Widget build(BuildContext context) {
    !kIsWeb
        ? Future.delayed(Duration(milliseconds: 3000)).then((value) {
      Future.delayed(Duration(milliseconds: _duration ?? 0)).then((value) {
        if(enableSplash){
          enableSplash = false;
          _customFunction?.call();
        }

      });
    })
        : Future.delayed(Duration.zero).then((value) {
      _customFunction?.call();
    });


    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
               AppThemeUtils.colorPrimary,
               AppThemeUtils.colorPrimaryDark,
              ],
              begin: Alignment.topCenter,
            )),
            child: Stack(
              children: [
                FadeTransition(
                    opacity: _animation!,
                    child: Center(
                        child: Container(
                            height: 250.0,padding:EdgeInsets.symmetric(horizontal: 40) ,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: SvgPicture.asset(_imagePath ?? '')))),
                // Align(
                //     alignment: Alignment.bottomCenter,
                //     child:  Container(
                //         height: 75,
                //         alignment: Alignment.center,
                //
                //         child: FutureBuilder<String>(
                //             future: GetVersion.projectVersion,
                //             builder: (context, snapshot) => snapshot.data == null
                //                 ? SizedBox()
                //                 : Text(
                //               "Versão " + (snapshot.data ?? ""),
                //               style: AppThemeUtils.normalBoldSize(fontSize: 10),
                //             ))),),
              ],
            )));
  }
}
