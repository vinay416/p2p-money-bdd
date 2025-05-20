import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([properties]);
  final List properties = const <dynamic>[];

  @override
  List<Object> get props => [properties];
}

class PaymentFailure extends Failure {
  final String msg;
  const PaymentFailure(this.msg);

  @override
  List<Object> get props => [properties, msg];
}

class ServerFailure extends Failure {
  final String msg;
  const ServerFailure(this.msg);

  @override
  List<Object> get props => [properties, msg];
}
