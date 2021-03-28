import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  getString({@required String formatter}) {
    return DateFormat(formatter, 'pt_BR').format(this);
  }
}