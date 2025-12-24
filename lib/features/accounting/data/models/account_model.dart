import '../../domain/entities/account_entity.dart';

class AccountModel extends AccountEntity {
  const AccountModel({
    required super.accountNumber,
    required super.accountName,
    required super.balance,
    required super.category,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      accountNumber: json['accountNumber'] as String,
      accountName: json['accountName'] as String,
      balance: (json['balance'] as num).toDouble(),
      category: json['category'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accountNumber': accountNumber,
      'accountName': accountName,
      'balance': balance,
      'category': category,
    };
  }

  AccountEntity toEntity() {
    return AccountEntity(
      accountNumber: accountNumber,
      accountName: accountName,
      balance: balance,
      category: category,
    );
  }
}
