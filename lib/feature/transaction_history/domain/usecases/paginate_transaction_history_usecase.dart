import 'package:dartz/dartz.dart';
import 'package:fintech_p2p_money/core/failure.dart';
import 'package:fintech_p2p_money/feature/transaction_history/domain/entities/transaction_history_entity.dart';
import 'package:fintech_p2p_money/feature/transaction_history/domain/repository/transaction_history_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PaginateTransactionHistoryUsecase {
  final TransactionHistoryRepository transactionHistoryRepository;
  const PaginateTransactionHistoryUsecase({
    required this.transactionHistoryRepository,
  });

  Future<Either<Failure, TransactionHistoryEntity>> call(int start) async {
    return await transactionHistoryRepository.paginte(start);
  }
}
