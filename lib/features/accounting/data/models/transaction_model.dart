import '../../domain/entities/transaction_entity.dart';

class TransactionModel extends TransactionEntity {
  const TransactionModel({
    required super.reference,
    required super.date,
    required super.description,
    required super.amount,
    required super.status,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      reference: json['reference'] as String,
      date: DateTime.parse(json['date'] as String),
      description: json['description'] as String,
      amount: (json['amount'] as num).toDouble(),
      status: _statusFromString(json['status'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reference': reference,
      'date': date.toIso8601String(),
      'description': description,
      'amount': amount,
      'status': _statusToString(status),
    };
  }

  TransactionEntity toEntity() {
    return TransactionEntity(
      reference: reference,
      date: date,
      description: description,
      amount: amount,
      status: status,
    );
  }

  static TransactionStatus _statusFromString(String status) {
    switch (status.toLowerCase()) {
      case 'posted':
        return TransactionStatus.posted;
      case 'draft':
        return TransactionStatus.draft;
      case 'cancelled':
        return TransactionStatus.cancelled;
      default:
        return TransactionStatus.draft;
    }
  }

  static String _statusToString(TransactionStatus status) {
    switch (status) {
      case TransactionStatus.posted:
        return 'posted';
      case TransactionStatus.draft:
        return 'draft';
      case TransactionStatus.cancelled:
        return 'cancelled';
    }
  }
}
