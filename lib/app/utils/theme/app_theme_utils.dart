import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace_store_app/app/utils/colors/hex_color_utils.dart';

enum ThemeSize { BIG, MEDIUM, SMALL }
enum ThemeLayoutType { WEB, ANDROID, IOS }

class AppThemeUtils {
  static var black = Colors.black;

  static var yellow = Colors.yellow;

  static TextStyle bigBoldSize({Color? color, double? fontSize = 22}) =>
      GoogleFonts.openSans(
          decoration: TextDecoration.none,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: color);

  static TextStyle bigSize({Color? color, double? fontSise = 22}) =>
      GoogleFonts.openSans(
          decoration: TextDecoration.none, fontSize: fontSise, color: color);

  static TextStyle normalBoldSize({Color? color, double? fontSize = 14, TextDecoration decoration = TextDecoration.none}) =>
      GoogleFonts.openSans(
          decoration: decoration,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: color);

  static TextStyle normalSize({
    Color? color,
    double? fontSize = 14,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
  }) =>
      GoogleFonts.openSans(
          decoration: decoration,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color);

  static TextStyle smallSize({Color? color, double? fontSize = 14, TextDecoration decoration = TextDecoration.none}) =>
      GoogleFonts.openSans(
          decoration: decoration, fontSize: fontSize, color: color);

  static Color colorPrimary = HexColor("192BC2"); //" 00A4D5");
  static Color colorPrimaryDark = HexColor("192BC2"); //"00A4D5");

  static Color whiteColor = HexColor("FFFFFF");

  static Color colorError = Colors.grey;
  static Color greyColor = Colors.grey;
  static Color greyLightColor = Colors.grey[400]!;

  static Color colorRedError = Color.fromARGB(255, 139, 0, 0);
  static Color colorGreenSuccess = Color.fromARGB(255, 53, 151, 90);
  static Color colorOrangeWarning = Color.fromARGB(255, 255, 69, 0);

  static bool isWeb(BuildContext context) {
    return kIsWeb;
  }

  static ThemeData customTheme() {
    return ThemeData(
        primaryColor: AppThemeUtils.colorPrimary,
        primaryColorLight: AppThemeUtils.colorPrimary,
        buttonColor: AppThemeUtils.whiteColor,
        iconTheme: IconThemeData(color: Colors.white),
          );
  }
}
