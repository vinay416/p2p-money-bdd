part of 'transaction_history_bloc.dart';

sealed class TransactionHistoryEvent extends Equatable {
  const TransactionHistoryEvent();

  @override
  List<Object> get props => [];
}

final class FetchHistory extends TransactionHistoryEvent{}

final class PaginateHistory extends TransactionHistoryEvent{
  final List<String> history;
  const PaginateHistory(this.history);

  @override
  List<Object> get props => [history];
}

final class ChangeFilter extends TransactionHistoryEvent{
  final TransactionFilter filter;
  const ChangeFilter(this.filter);

  @override
  List<Object> get props => [filter];
}