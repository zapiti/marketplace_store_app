import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';

class Utils {
  static double percentage(partialValue, totalValue) {
    return (100 * partialValue) / totalValue;
  }

  static String removeMask(String text) {
    var _phoneUnMask = text?.replaceAll('(', '');
    _phoneUnMask = _phoneUnMask?.replaceAll(')', '');
    _phoneUnMask = _phoneUnMask?.replaceAll(' ', '');
    _phoneUnMask = _phoneUnMask?.replaceAll('-', '');
    _phoneUnMask = _phoneUnMask?.replaceAll('.', '');
    _phoneUnMask = _phoneUnMask?.replaceAll(' ', '');
    _phoneUnMask = _phoneUnMask?.replaceAll('/', '');
    return _phoneUnMask;
  }

  static String geMaskCep() {
    return '00.000-000';
  }

 static showSnackbar(BuildContext context, String text) {
    Flushbar(
      message: text,duration: Duration(seconds: 2),
    )..show(context);
  }

  static String getMaskCnpj() {
    return '00.000.000/0000-00';
  }

  static String  getPhoneMask() {
    return '(00) 0 0000-0000';
  }
}
