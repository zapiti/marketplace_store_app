import 'package:intl/intl.dart';


class MyDateUtils {
  static String parseDateTimeFormat(dynamic mydate,
      {format = "dd/MM/yyy", String defaultValue = ""}) {
    var date;
    if (mydate.toString().contains("+")) {
      date = mydate.toString().split("+")[0];
    } else {
      date = mydate;
    }

    if (date.toString().contains("/")) {
      return date.toString();
    } else {
      if (date == null || date == "" || date is List) {
        return defaultValue;
      } else {
        DateTime now = DateTime.now();
        if (date is String) {
          now = DateTime.parse(date);
        } else {
          now = date;
        }

        String formattedDate = DateFormat(format, "pt_BR").format(now);
        return formattedDate;
      }
    }
  }

  static DateTime? convertStringToDateTime(String? date) {
    if (date == null || !date.contains("/")) {
      return null;
    }

    DateTime tempDate = new DateFormat("dd/MM/yyyy").parse(date);
    return tempDate;
  }

  static int compareDateNow(String? dateInit,
      {String? dateEnd, bool isHours = false}) {
    final dateInitial = dateInit == "" || dateInit == null
        ? DateTime.now()
        : DateTime.parse(dateInit);
    final date2 = dateEnd == null ? DateTime.now() : DateTime.parse(dateEnd);
    final difference = isHours
        ? date2.difference(dateInitial).inHours
        : date2.difference(dateInitial).inSeconds;
    return difference;
  }

  static int compareDateNowDatime(DateTime dateInit,
      {DateTime? dateEnd, bool isDays = false}) {
    final dateInitial = dateInit;

    final date2 = dateEnd;
    final difference = isDays
        ? date2?.difference(dateInitial).inDays
        : date2?.difference(dateInitial).inMinutes;
    return difference ?? 0;
  }

  static String getDateFormatGen(String? text2) {
    if (text2 == null || text2 == "" || text2.toString().contains("")) {
      return text2.toString();
    } else {
      var date1 = MyDateUtils.parseDateTimeFormat(text2, format: "dd/MM/yyyy");

      var outputFormat = DateFormat("dd/MM/yyyy");
      var date2 = outputFormat.parse(date1).toLocal();

      return MyDateUtils.parseDateTimeFormat(date2, format: "yyyy/MM/dd");
    }
  }



  static String updateToDateFilter(String text) {
    var temp = text;
    if (text.toString().contains("/")) {
      var inputFormat = DateFormat("dd/MM/yyyy");
      var date1 = inputFormat.parse(text);
      var date = MyDateUtils.parseDateTimeFormat(date1, format: "yyyy/MM/dd");
      //      var outputFormat = DateFormat("yyyy-MM-dd");
      //      var date2 = MyDateUtils.parseDateTimeFormat(
      //          outputFormat.parse("$date1").toLocal(),
      //          format: "yyyy-MM-dd"); // 2019-08-18
      temp = date;
    }
    if (text.toString().contains("-")) {
      var date1 = DateTime.parse(text);
      var date = MyDateUtils.parseDateTimeFormat(date1, format: "yyyy/MM/dd");
      //      var outputFormat = DateFormat("yyyy-MM-dd");
      //      var date2 = MyDateUtils.parseDateTimeFormat(
      //          outputFormat.parse("$date1").toLocal(),
      //          format: "yyyy-MM-dd"); // 2019-08-18
      temp = date;
    }
    return temp;
  }

  static hoursToCompareNow(DateTime dtCreate) {
    final minutes =  compareDateNowDatime(dtCreate,dateEnd: DateTime.now());
    final duration = Duration(minutes: minutes);

    return _printDuration(duration);
  }
}


String _printDuration(Duration duration) {
  String twoDigitDays = duration.inDays.toString();
  String twoDigitHours = twoDigits(duration.inHours.remainder(24));
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));



  return duration.inHours == 0
      ? "$twoDigitMinutes minutos"
      :duration.inDays == 0
      ? "$twoDigitHours:$twoDigitMinutes horas" : "$twoDigitDays dias e $twoDigitHours:$twoDigitMinutes horas";
}

String twoDigits(int n) => n.toString().padLeft(2, "0");