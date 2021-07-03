class UserEntity {

  static final KID = "KID";

  String username;
  String password;

  static var USERLOG = "USERLOG";

  static var USER = "MYUSER";

  static var PASS = "MYPASS";

  UserEntity({required this.username, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }

}
