import 'package:new_marketplace_app/app/models/current_user.dart';

class AppConfiguration {
  static final PRODUCTION_SERVER = "PRODUCTION_SERVER";
  static final SOCKET_ATTENDANCE_PORT = "SOCKET_ATTENDANCE_PORT";
  static final pushApi = "3e264704-d426-4bce-8581-357afba8afae";

  static CurrentUser userTest = CurrentUser();

  static String baseUrl() {
    return "https://9f8decd9d08f.ngrok.io";
  }

  static final isMockDevTest = false;

  static const version = "1.0.46";
}
