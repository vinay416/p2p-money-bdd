part of 'transaction_history_bloc.dart';

sealed class TransactionHistoryState extends Equatable {
  const TransactionHistoryState();

  @override
  List<Object> get props => [];
}

final class TransactionHistoryInitial extends TransactionHistoryState {}

final class TransactionHistoryLoading extends TransactionHistoryState {}

final class TransactionHistoryData extends TransactionHistoryState {
  final TransactionHistoryEntity historyEntity;
  const TransactionHistoryData(this.historyEntity);

  @override
  List<Object> get props => [historyEntity];
}

final class TransactionHistoryPaginating extends TransactionHistoryState {}
