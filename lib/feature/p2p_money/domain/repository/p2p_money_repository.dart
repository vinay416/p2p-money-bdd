import 'package:dartz/dartz.dart';
import 'package:fintech_p2p_money/core/failure.dart';
import 'package:fintech_p2p_money/feature/p2p_money/domain/entities/payment_entity.dart';

abstract class P2pMoneyRepository {
  Future<Either<Failure, PaymentEntity>> transferMoney({
    required String amount,
    required String sendTo,
  });
}
