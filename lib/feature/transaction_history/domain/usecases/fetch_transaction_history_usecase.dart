import 'package:dartz/dartz.dart';
import 'package:fintech_p2p_money/core/failure.dart';
import 'package:fintech_p2p_money/feature/transaction_history/domain/entities/transaction_history_entity.dart';
import 'package:fintech_p2p_money/feature/transaction_history/domain/repository/transaction_history_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FetchTransactionHistoryUsecase {
  final TransactionHistoryRepository transactionHistoryRepository;
  const FetchTransactionHistoryUsecase({
    required this.transactionHistoryRepository,
  });

  Future<Either<Failure, TransactionHistoryEntity>> call() async {
    return await transactionHistoryRepository.fetch();
  }
}
