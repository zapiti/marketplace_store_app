class Address {
  String? zipCode;
  String? address;
  String? number;
  String? complement;
  String? neighborhood;
  String? city;
  String? state;

  Address({this.zipCode, this.address, this.number, this.complement,
      this.neighborhood, this.city, this.state});


  static Address? fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return Address(
      zipCode: map['zipCode']?.toString(),
      address: map['address']?.toString(),
      number: map['number']?.toString(),
      complement: map['complement']?.toString(),
      neighborhood: map['neighborhood']?.toString(),
      city: map['city']?.toString(),
      state: map['state']?.toString(),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'zipCode': zipCode,
      'address': address,
      'number': number,
      'complement': complement,
      'neighborhood': neighborhood,
      'city': city,
      'state': state,
    };
  }
}
