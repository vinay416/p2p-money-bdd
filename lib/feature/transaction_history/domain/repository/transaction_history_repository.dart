import 'package:dartz/dartz.dart';
import 'package:fintech_p2p_money/core/failure.dart';
import 'package:fintech_p2p_money/feature/transaction_history/domain/entities/transaction_history_entity.dart';

abstract class TransactionHistoryRepository {
  Future<Either<Failure, TransactionHistoryEntity>> fetch();
  Future<Either<Failure, TransactionHistoryEntity>> paginte(int start);
  Future<Either<Failure, TransactionHistoryEntity>> changeFilter(
    TransactionFilter filter,
  );
}
