import 'package:marketplace_store_app/app/models/address/address.dart';

class Store {
  String? cnpj;
  String? companyName;
  String? email;
  String? password;
  String? phone;
  String? responsible;
  String? description;
  String? type;
  Address? address;

  Store({this.cnpj, this.companyName, this.email, this.password, this.phone,
      this.responsible, this.description, this.type, this.address});

  static Store? fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return Store(
      cnpj: map['cnpj']?.toString(),
      companyName: map['companyName']?.toString(),
      email: map['email']?.toString(),
      password: map['password']?.toString(),
      phone: map['phone']?.toString(),
      responsible: map['responsible']?.toString(),
      description: map['description']?.toString(),
      type: map['type']?.toString(),
      address: Address.fromMap(map['address']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cnpj': cnpj,
      'companyName': companyName,
      'email': email,
      'password': password,
      'phone': phone,
      'responsible': responsible,
      'description': description,
      'type': type,
      'address': address?.toMap(),
    };
  }
}
