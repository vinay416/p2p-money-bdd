import 'package:dartz/dartz.dart';
import 'package:fintech_p2p_money/core/exceptions.dart';
import 'package:fintech_p2p_money/core/failure.dart';
import 'package:fintech_p2p_money/feature/p2p_money/data/data_source/p2p_money_remote_source.dart';
import 'package:fintech_p2p_money/feature/p2p_money/domain/entities/payment_entity.dart';
import 'package:fintech_p2p_money/feature/p2p_money/domain/repository/p2p_money_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: P2pMoneyRepository)
class P2pMoneyRepositoryImpl implements P2pMoneyRepository {
  final P2pMoneyRemoteSource p2pMoneyRemoteSource;
  const P2pMoneyRepositoryImpl({required this.p2pMoneyRemoteSource});

  @override
  Future<Either<Failure, PaymentEntity>> transferMoney({
    required String amount,
    required String sendTo,
  }) async {
    try {
      final payment = await p2pMoneyRemoteSource.transferMoney(
        amount: amount,
        sendTo: sendTo,
      );
      return Right(payment);
    } on PaymentException catch (e) {
      return Left(PaymentFailure(e.msg));
    } catch (e){
      return Left(PaymentFailure("Something went wrong"));
    }
  }
}
