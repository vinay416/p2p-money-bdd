import 'package:fintech_p2p_money/feature/transaction_history/domain/entities/transaction_history_entity.dart';

class TransactionHistoryModel extends TransactionHistoryEntity {
  const TransactionHistoryModel({required super.transactions});

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) {
    final List<String> transactions = json["transactions"] ?? [];
    return TransactionHistoryModel(transactions: transactions);
  }
}
