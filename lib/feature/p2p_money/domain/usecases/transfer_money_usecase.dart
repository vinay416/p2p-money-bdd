import 'package:dartz/dartz.dart';
import 'package:fintech_p2p_money/core/failure.dart';
import 'package:fintech_p2p_money/feature/p2p_money/domain/entities/payment_entity.dart';
import 'package:fintech_p2p_money/feature/p2p_money/domain/repository/p2p_money_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class TransferMoneyUsecase {
  final P2pMoneyRepository p2pMoneyRepository;
  const TransferMoneyUsecase({required this.p2pMoneyRepository});

  Future<Either<Failure, PaymentEntity>> call({
    required String amount,
    required String sendTo,
  }) async {
    return await p2pMoneyRepository.transferMoney(
      amount: amount,
      sendTo: sendTo,
    );
  }
}
