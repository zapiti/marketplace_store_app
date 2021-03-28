
import 'package:marketplace_entregador/app/models/user_entity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecurityPreference {
  static void clean() {
    final storage = new FlutterSecureStorage();
    storage.deleteAll();
  }

  static void save(UserEntity user) async {
    final storage = new FlutterSecureStorage();
    await storage.write(
        key: UserEntity.USER, value: (user.username ?? "").trim());
    await storage.write(
        key: UserEntity.PASS, value: (user.password ?? "").trim());
  }

  static Future<UserEntity> getUser() async {
    var user = UserEntity();
    final storage = new FlutterSecureStorage();
    user.username = await storage.read(key: UserEntity.USER);
    user.password = await storage.read(key: UserEntity.PASS);
    return user;
  }
}


// class SecurityPreference {
//   static void clean() {}
//
//   static void save(UserEntity user) async {
//     PrefService.setString(UserEntity.USER, (user.username ?? "").trim());
//     PrefService.setString(UserEntity.PASS, (user.password ?? "").trim());
//   }
//
//   static Future<UserEntity> getUser() async {
//     var user = UserEntity();
//
//     user.username = PrefService.getString(UserEntity.USER);
//     user.password = PrefService.getString(UserEntity.PASS);
//     return user;
//   }
// }
