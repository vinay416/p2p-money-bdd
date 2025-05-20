import 'package:fintech_p2p_money/feature/p2p_money/domain/entities/payment_entity.dart';

class PaymentModel extends PaymentEntity {
  const PaymentModel({required super.id});

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(id: json["id"] as String);
  }
}
