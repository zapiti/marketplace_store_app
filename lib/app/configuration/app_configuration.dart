import 'package:marketplace_store_app/app/models/current_user.dart';

class AppConfiguration {
  static final PRODUCTION_SERVER = "PRODUCTION_SERVER";
  static final SOCKET_ATTENDANCE_PORT = "SOCKET_ATTENDANCE_PORT";
  static final pushApi = "3e264704-d426-4bce-8581-357afba8afae";

  static CurrentUser userTest = CurrentUser();

  static String baseUrl() {
    return "http://192.168.100.12:3000";
  }

  static final isMockDevTest = false;

  static const version = "1.0.46";
}
