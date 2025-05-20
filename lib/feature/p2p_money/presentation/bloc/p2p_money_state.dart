part of 'p2p_money_bloc.dart';

sealed class P2pMoneyState extends Equatable {
  const P2pMoneyState();

  @override
  List<Object> get props => [];
}

final class P2pMoneyInitial extends P2pMoneyState {
  final String? validationError;
  const P2pMoneyInitial({this.validationError});

  @override
  List<Object> get props => [(validationError ?? "")];
}

final class P2pMoneyLoading extends P2pMoneyState {}

final class P2pMoneyFailure extends P2pMoneyState {
  final String msg;
  const P2pMoneyFailure(this.msg);

  @override
  List<Object> get props => [msg];
}

final class P2pMoneySuccess extends P2pMoneyState {
  final String payId;
  const P2pMoneySuccess(this.payId);

  @override
  List<Object> get props => [payId];
}
