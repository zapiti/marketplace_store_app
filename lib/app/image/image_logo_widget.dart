

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketplace_store_app/app/utils/theme/app_theme_utils.dart';
import 'image_path.dart';

class GetLogoIcon extends StatelessWidget {
  final double width;
  final double height;

  GetLogoIcon({this.width: 250, this.height: 130});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        child: SvgPicture.asset(
          ImagePath.imageLogo,
        ));
  }
}

class GetLogoIcon2 extends StatelessWidget {
  final double width;
  final double height;

  GetLogoIcon2({this.width: 300, this.height: 80});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          width: width,
          height: height,

                  child: SvgPicture.asset(
                    ImagePath.imageLogo2,
                  )),Container(child: Text("Entregador",style: AppThemeUtils.normalSize(color: AppThemeUtils.colorPrimary),),)
    ],) ;
  }
}