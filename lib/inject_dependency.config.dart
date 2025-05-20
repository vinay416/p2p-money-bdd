// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import 'core/register_module.dart' as _i537;
import 'feature/p2p_money/data/data_source/p2p_money_remote_source.dart'
    as _i311;
import 'feature/p2p_money/data/repository/p2p_money_repository_impl.dart'
    as _i937;
import 'feature/p2p_money/domain/repository/p2p_money_repository.dart' as _i839;
import 'feature/p2p_money/domain/usecases/transfer_money_usecase.dart' as _i643;
import 'feature/p2p_money/presentation/bloc/p2p_money_bloc.dart' as _i148;
import 'feature/transaction_history/data/data_source/transaction_history_local_source.dart'
    as _i563;
import 'feature/transaction_history/data/data_source/transaction_history_remote_data_source.dart'
    as _i348;
import 'feature/transaction_history/data/repository/transaction_history_repository_impl.dart'
    as _i1059;
import 'feature/transaction_history/domain/repository/transaction_history_repository.dart'
    as _i624;
import 'feature/transaction_history/domain/usecases/change_filter_transactions_usecase.dart'
    as _i321;
import 'feature/transaction_history/domain/usecases/fetch_transaction_history_usecase.dart'
    as _i1038;
import 'feature/transaction_history/domain/usecases/paginate_transaction_history_usecase.dart'
    as _i21;
import 'feature/transaction_history/presentation/bloc/transaction_history_bloc.dart'
    as _i14;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i361.Dio>(() => registerModule.dio);
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i348.TransactionHistoryRemoteDataSource>(
      () =>
          _i348.TransactionHistoryRemoteDataSourceImpl(client: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i311.P2pMoneyRemoteSource>(
      () => _i311.P2pMoneyRemoteSourceImpl(client: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i563.TransactionHistoryLocalSource>(
      () => _i563.TransactionHistoryLocalSourceImpl(
        prefs: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.lazySingleton<_i839.P2pMoneyRepository>(
      () => _i937.P2pMoneyRepositoryImpl(
        p2pMoneyRemoteSource: gh<_i311.P2pMoneyRemoteSource>(),
      ),
    );
    gh.lazySingleton<_i624.TransactionHistoryRepository>(
      () => _i1059.TransactionHistoryRepositoryImpl(
        transactionHistoryLocalSource:
            gh<_i563.TransactionHistoryLocalSource>(),
        transactionHistoryRemoteDataSource:
            gh<_i348.TransactionHistoryRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i643.TransferMoneyUsecase>(
      () => _i643.TransferMoneyUsecase(
        p2pMoneyRepository: gh<_i839.P2pMoneyRepository>(),
      ),
    );
    gh.lazySingleton<_i321.ChangeFilterTransactionsUsecase>(
      () => _i321.ChangeFilterTransactionsUsecase(
        transactionHistoryRepository: gh<_i624.TransactionHistoryRepository>(),
      ),
    );
    gh.lazySingleton<_i21.PaginateTransactionHistoryUsecase>(
      () => _i21.PaginateTransactionHistoryUsecase(
        transactionHistoryRepository: gh<_i624.TransactionHistoryRepository>(),
      ),
    );
    gh.lazySingleton<_i1038.FetchTransactionHistoryUsecase>(
      () => _i1038.FetchTransactionHistoryUsecase(
        transactionHistoryRepository: gh<_i624.TransactionHistoryRepository>(),
      ),
    );
    gh.factory<_i148.P2pMoneyBloc>(
      () => _i148.P2pMoneyBloc(
        transferMoneyUsecase: gh<_i643.TransferMoneyUsecase>(),
      ),
    );
    gh.factory<_i14.TransactionHistoryBloc>(
      () => _i14.TransactionHistoryBloc(
        changeFilterTransactionsUsecase:
            gh<_i321.ChangeFilterTransactionsUsecase>(),
        fetchTransactionHistoryUsecase:
            gh<_i1038.FetchTransactionHistoryUsecase>(),
        paginateTransactionHistoryUsecase:
            gh<_i21.PaginateTransactionHistoryUsecase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i537.RegisterModule {}
