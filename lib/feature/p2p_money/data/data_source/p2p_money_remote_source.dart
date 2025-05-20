import 'package:dio/dio.dart';
import 'package:fintech_p2p_money/core/exceptions.dart';
import 'package:fintech_p2p_money/feature/p2p_money/data/model/payment_model.dart';
import 'package:injectable/injectable.dart';

abstract class P2pMoneyRemoteSource {
  Future<PaymentModel> transferMoney({
    required String amount,
    required String sendTo,
  });
}

// ignore: constant_identifier_names
const String P2P_TRANSFER_URL = "https://fintech.com/p2p_money/transfer";

@LazySingleton(as: P2pMoneyRemoteSource)
class P2pMoneyRemoteSourceImpl implements P2pMoneyRemoteSource {
  final Dio client;
  const P2pMoneyRemoteSourceImpl({required this.client});

  @override
  Future<PaymentModel> transferMoney({
    required String amount,
    required String sendTo,
  }) async {
    final response = await client.post(
      P2P_TRANSFER_URL,
      queryParameters: {"amount": amount, "sendTo": sendTo},
    );
    final Map data = response.data ?? {};
    if (data.isEmpty) throw Exception();
    if (data["status"] == false) throw PaymentException(data["msg"]);
    return PaymentModel.fromJson(data as Map<String, dynamic>);
  }
}
