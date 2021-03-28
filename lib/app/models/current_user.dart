class CurrentUser {
  String email;
  String token;
  String expiration;
  bool firstAccess;
  String accountId;
  String name;

  CurrentUser({this.email, this.token, this.expiration, this.firstAccess, this.name,this.accountId});

  factory CurrentUser.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return CurrentUser(
      email: map['email']?.toString(),
      token: map['token']?.toString(),
      expiration: map['expiration']?.toString(),
      firstAccess: null == (temp = map['firstAccess'])
          ? null
          : (temp is bool
              ? temp
              : (temp is num
                  ? 0 != temp.toInt()
                  : ('true' == temp.toString()))),
      accountId: map['accountId']?.toString(),
      name: map['name']?.toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'token': token,
      'expiration': expiration,
      'firstAccess': firstAccess,
      'accountId': accountId,
      'name': name,
    };
  }
}
