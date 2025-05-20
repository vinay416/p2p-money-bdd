import 'package:equatable/equatable.dart';

class TransactionHistoryEntity extends Equatable {
  final List<String> transactions;
  const TransactionHistoryEntity({required this.transactions});

  @override
  List<Object?> get props => [transactions];
}

enum TransactionFilter {
  all,
  sent,
  received;

  factory TransactionFilter.fromString(String? filter) {
    if (TransactionFilter.sent.name == filter) return TransactionFilter.sent;
    if (TransactionFilter.received.name == filter) {
      return TransactionFilter.received;
    }
    return TransactionFilter.all;
  }
}
