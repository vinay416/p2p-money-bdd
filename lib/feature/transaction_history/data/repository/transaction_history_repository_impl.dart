import 'package:dartz/dartz.dart';
import 'package:fintech_p2p_money/core/failure.dart';
import 'package:fintech_p2p_money/feature/transaction_history/data/data_source/transaction_history_local_source.dart';
import 'package:fintech_p2p_money/feature/transaction_history/data/data_source/transaction_history_remote_data_source.dart';
import 'package:fintech_p2p_money/feature/transaction_history/domain/entities/transaction_history_entity.dart';
import 'package:fintech_p2p_money/feature/transaction_history/domain/repository/transaction_history_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TransactionHistoryRepository)
class TransactionHistoryRepositoryImpl implements TransactionHistoryRepository {
  final TransactionHistoryLocalSource transactionHistoryLocalSource;
  final TransactionHistoryRemoteDataSource transactionHistoryRemoteDataSource;
  const TransactionHistoryRepositoryImpl({
    required this.transactionHistoryLocalSource,
    required this.transactionHistoryRemoteDataSource,
  });

  @override
  Future<Either<Failure, TransactionHistoryEntity>> changeFilter(
    TransactionFilter filter,
  ) async {
    try {
      await transactionHistoryLocalSource.setFilter(filter);
      final history = await transactionHistoryRemoteDataSource.fetch();
      final transactions =
          history.transactions.where((e) => e == filter.name).toList();
      return Right(TransactionHistoryEntity(transactions: transactions));
    } catch (e) {
      return Left(ServerFailure("Error occured"));
    }
  }

  @override
  Future<Either<Failure, TransactionHistoryEntity>> fetch() async {
    try {
      final filter = await transactionHistoryLocalSource.getFilter();
      final history = await transactionHistoryRemoteDataSource.fetch();

      List<String> transactions = history.transactions;
      if (filter != TransactionFilter.all) {
        history.transactions.where((e) => e == filter.name).toList();
      }
      return Right(TransactionHistoryEntity(transactions: transactions));
    } catch (e) {
      return Left(ServerFailure("Error occured"));
    }
  }

  @override
  Future<Either<Failure, TransactionHistoryEntity>> paginte(int start) async {
    try {
      final filter = await transactionHistoryLocalSource.getFilter();
      final history = await transactionHistoryRemoteDataSource.paginate(start);
      List<String> transactions = history.transactions;
      if (filter != TransactionFilter.all) {
        history.transactions.where((e) => e == filter.name).toList();
      }
      return Right(TransactionHistoryEntity(transactions: transactions));
    } catch (e) {
      return Left(ServerFailure("Error occured"));
    }
  }
}
