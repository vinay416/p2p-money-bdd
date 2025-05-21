import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:fintech_p2p_money/feature/transaction_history/domain/entities/transaction_history_entity.dart';
import 'package:fintech_p2p_money/feature/transaction_history/domain/usecases/change_filter_transactions_usecase.dart';
import 'package:fintech_p2p_money/feature/transaction_history/domain/usecases/fetch_transaction_history_usecase.dart';
import 'package:fintech_p2p_money/feature/transaction_history/domain/usecases/paginate_transaction_history_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'transaction_history_event.dart';
part 'transaction_history_state.dart';

@injectable
class TransactionHistoryBloc
    extends Bloc<TransactionHistoryEvent, TransactionHistoryState> {
  final FetchTransactionHistoryUsecase fetchTransactionHistoryUsecase;
  final PaginateTransactionHistoryUsecase paginateTransactionHistoryUsecase;
  final ChangeFilterTransactionsUsecase changeFilterTransactionsUsecase;
  TransactionHistoryBloc({
    required this.changeFilterTransactionsUsecase,
    required this.fetchTransactionHistoryUsecase,
    required this.paginateTransactionHistoryUsecase,
  }) : super(TransactionHistoryInitial()) {
    on<FetchHistory>(_onFetch);
    on<PaginateHistory>(_onPaginate);
    on<ChangeFilter>(_onChangeFilter);
  }

  FutureOr<void> _onChangeFilter(event, emit) async {
    final response = await changeFilterTransactionsUsecase.call(event.filter);
    response.fold(
      (failure) {},
      (history) => emit(TransactionHistoryData(history)),
    );
  }

  FutureOr<void> _onPaginate(PaginateHistory event, emit) async {
    emit(TransactionHistoryPaginating());
    final start = event.history.length + 1;
    final response = await paginateTransactionHistoryUsecase.call(start);
    final state = response.fold(
      (failure) => TransactionHistoryData(
        TransactionHistoryEntity(transactions: event.history),
      ),
      (history) => TransactionHistoryData(
        TransactionHistoryEntity(
          transactions: [
            ...history.transactions,
            ...event.history,
          ],
        ),
      ),
    );
    emit(state);
  }

  FutureOr<void> _onFetch(FetchHistory event, emit) async {
    emit(TransactionHistoryLoading());
    final response = await fetchTransactionHistoryUsecase.call();
    final state = response.fold(
      (failure) =>
          TransactionHistoryData(TransactionHistoryEntity(transactions: [])),
      (history) => TransactionHistoryData(history),
    );
    emit(state);
  }
}
