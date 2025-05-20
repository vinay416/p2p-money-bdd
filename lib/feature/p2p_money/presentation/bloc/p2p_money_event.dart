part of 'p2p_money_bloc.dart';

sealed class P2pMoneyEvent extends Equatable {
  const P2pMoneyEvent();

  @override
  List<Object> get props => [];
}

final class SendMoneyEvent extends P2pMoneyEvent{
  final String amount;
  final String sendTo;
  const SendMoneyEvent({required this.amount, required this.sendTo});

  @override
  List<Object> get props => [amount, sendTo];
}