class CurrentUser {
  String? sub;
  String? username;
  String? profile;
  Establishment? establishment;
  String? iat;
  String? exp;

  CurrentUser(
      {this.sub,
      this.username,
      this.profile,
      this.establishment,
      this.iat,
      this.exp});

  Map<String, dynamic> toMap() {
    return {
      'sub': sub,
      'username': username,
      'profile': profile,
      'establishment': establishment?.toMap(),
      'iat': iat,
      'exp': exp,
    };
  }

  static CurrentUser? fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return CurrentUser(
      sub: map['sub']?.toString(),
      username: map['username']?.toString(),
      profile: map['profile']?.toString(),
      establishment: Establishment.fromMap(map['establishment']),
      iat: map['iat']?.toString(),
      exp: map['exp']?.toString(),
    );
  }
}

class Establishment {
  String? id;
  String? cnpj;
  String? companyName;
  double? wallet;
  String? email;
  String? phone;
  String? responsible;
  String? description;
  String? status;
  String? type;
  String? preparationTime;
  double? deliveryValue;
  String? rank;
  String? image;
  String? coverImage;
  String? createdAt;
  String? updatedAt;

  Establishment(
      {this.id,
      this.cnpj,
      this.companyName,
      this.wallet,
      this.email,
      this.phone,
      this.responsible,
      this.description,
      this.status,
      this.type,
      this.preparationTime,
      this.deliveryValue,
      this.rank,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.coverImage});

  static Establishment? fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return Establishment(
      id: map['id']?.toString(),
      cnpj: map['cnpj']?.toString(),
      companyName: map['companyName']?.toString(),
      wallet: null == (temp = map['wallet'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      email: map['email']?.toString(),
      phone: map['phone']?.toString(),
      responsible: map['responsible']?.toString(),
      description: map['description']?.toString(),
      status: map['status']?.toString(),
      type: map['type']?.toString(),
      preparationTime: map['preparationTime']?.toString(),
      deliveryValue: null == (temp = map['deliveryValue'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      rank: map['rank']?.toString(),
      image: map['image']?.toString(),
      coverImage: map['image']?.toString(),
      createdAt: map['createdAt']?.toString(),
      updatedAt: map['updatedAt']?.toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cnpj': cnpj,
      'companyName': companyName,
      'wallet': wallet,
      'email': email,
      'phone': phone,
      'responsible': responsible,
      'description': description,
      'status': status,
      'type': type,
      'preparationTime': preparationTime,
      'deliveryValue': deliveryValue,
      'rank': rank,
      'image': image,
      'coverImage': coverImage,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
