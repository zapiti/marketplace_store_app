class BankAccount {
  String? id;
  String? cpfCnpj;
  String? bank;
  int? account;
  int? agency;
  String? createdAt;
  String? updatedAt;

  BankAccount({
    this.id,
    this.cpfCnpj,
    this.bank,
    this.account,
    this.agency,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMapFromUpdate() {
    return {
      'id': id,
      'cpfCnpj': cpfCnpj,
      'bank': bank,
      'account': account,
      'agency': agency,
    };
  }

  Map<String, dynamic> toMapForCreate() {
    return {
      'cpfCnpj': cpfCnpj,
      'bank': bank,
      'account': account,
      'agency': agency,
    };
  }

  factory BankAccount.fromMap(Map<String, dynamic> map) {
    return BankAccount(
      id: map['id'],
      cpfCnpj: map['cpfCnpj'],
      bank: map['bank'],
      account: map['account']?.toInt(),
      agency: map['agency']?.toInt(),
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  @override
  String toString() {
    return 'BankAccount(id: $id, cpfCnpj: $cpfCnpj, bank: $bank, account: $account, agency: $agency, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
