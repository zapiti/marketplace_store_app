
import 'transaction.dart';

class WalletData {
  final int wallet;
  final List<Transaction> transactions;
  WalletData({
    required this.wallet,
    required this.transactions,
  });

  Map<String, dynamic> toMap() {
    return {
      'wallet': wallet,
      'transactions': transactions.map((x) => x.toMap()).toList(),
    };
  }

  factory WalletData.fromMap(Map<String, dynamic> map) {
    return WalletData(
      wallet: map['wallet']?.toInt(),
      transactions: List<Transaction>.from(
          map['transactions']?.map((x) => Transaction.fromMap(x))),
    );
  }
}
