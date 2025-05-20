import 'package:equatable/equatable.dart';

class PaymentEntity extends Equatable {
  const PaymentEntity({required this.id});
  final String id;

  @override
  List<Object?> get props => [id];
}
