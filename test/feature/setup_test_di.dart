import 'package:dio/dio.dart';
import 'package:fintech_p2p_money/feature/p2p_money/data/data_source/p2p_money_remote_source.dart';
import 'package:fintech_p2p_money/feature/p2p_money/data/repository/p2p_money_repository_impl.dart';
import 'package:fintech_p2p_money/feature/p2p_money/domain/repository/p2p_money_repository.dart';
import 'package:fintech_p2p_money/feature/p2p_money/domain/usecases/transfer_money_usecase.dart';
import 'package:fintech_p2p_money/feature/p2p_money/presentation/bloc/p2p_money_bloc.dart';
import 'package:fintech_p2p_money/feature/transaction_history/data/data_source/transaction_history_local_source.dart';
import 'package:fintech_p2p_money/feature/transaction_history/data/data_source/transaction_history_remote_data_source.dart';
import 'package:fintech_p2p_money/feature/transaction_history/data/repository/transaction_history_repository_impl.dart';
import 'package:fintech_p2p_money/feature/transaction_history/domain/repository/transaction_history_repository.dart';
import 'package:fintech_p2p_money/feature/transaction_history/domain/usecases/change_filter_transactions_usecase.dart';
import 'package:fintech_p2p_money/feature/transaction_history/domain/usecases/fetch_transaction_history_usecase.dart';
import 'package:fintech_p2p_money/feature/transaction_history/domain/usecases/paginate_transaction_history_usecase.dart';
import 'package:fintech_p2p_money/feature/transaction_history/presentation/bloc/transaction_history_bloc.dart';
import 'package:fintech_p2p_money/inject_dependency.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'setup_test_di.mocks.dart';

@GenerateMocks([Dio, SharedPreferences])
Future<void> setupTestDI() async {
  await getIt.reset();
  getIt.registerFactory<P2pMoneyBloc>(
    () => P2pMoneyBloc(transferMoneyUsecase: getIt()),
  );
  getIt.registerLazySingleton<TransferMoneyUsecase>(
    () => TransferMoneyUsecase(p2pMoneyRepository: getIt()),
  );
  getIt.registerLazySingleton<P2pMoneyRepository>(
    () => P2pMoneyRepositoryImpl(p2pMoneyRemoteSource: getIt()),
  );
  getIt.registerLazySingleton<P2pMoneyRemoteSource>(
    () => P2pMoneyRemoteSourceImpl(client: getIt()),
  );
  getIt.registerLazySingleton<Dio>(() => MockDio());
  getIt.registerFactory<TransactionHistoryBloc>(
    () => TransactionHistoryBloc(
      changeFilterTransactionsUsecase: getIt(),
      fetchTransactionHistoryUsecase: getIt(),
      paginateTransactionHistoryUsecase: getIt(),
    ),
  );
  getIt.registerLazySingleton<ChangeFilterTransactionsUsecase>(
    () =>
        ChangeFilterTransactionsUsecase(transactionHistoryRepository: getIt()),
  );
  getIt.registerLazySingleton<FetchTransactionHistoryUsecase>(
    () => FetchTransactionHistoryUsecase(transactionHistoryRepository: getIt()),
  );
  getIt.registerLazySingleton<PaginateTransactionHistoryUsecase>(
    () => PaginateTransactionHistoryUsecase(
      transactionHistoryRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<TransactionHistoryRepository>(
    () => TransactionHistoryRepositoryImpl(
      transactionHistoryLocalSource: getIt(),
      transactionHistoryRemoteDataSource: getIt(),
    ),
  );
  getIt.registerLazySingleton<TransactionHistoryLocalSource>(
    () => TransactionHistoryLocalSourceImpl(prefs: getIt()),
  );
  getIt.registerLazySingleton<TransactionHistoryRemoteDataSource>(
    () => TransactionHistoryRemoteDataSourceImpl(client: getIt()),
  );
  getIt.registerLazySingleton<SharedPreferences>(() => MockSharedPreferences());
}
