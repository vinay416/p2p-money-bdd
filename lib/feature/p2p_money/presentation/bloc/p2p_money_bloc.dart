import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:fintech_p2p_money/core/failure.dart';
import 'package:fintech_p2p_money/feature/p2p_money/domain/usecases/transfer_money_usecase.dart';
import 'package:fintech_p2p_money/feature/p2p_money/utils/validate_phone_no.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'p2p_money_event.dart';
part 'p2p_money_state.dart';

@injectable
class P2pMoneyBloc extends Bloc<P2pMoneyEvent, P2pMoneyState> {
  final TransferMoneyUsecase transferMoneyUsecase;
  P2pMoneyBloc({required this.transferMoneyUsecase})
    : super(P2pMoneyInitial()) {
    on<SendMoneyEvent>(_onSendMoney);
  }

  FutureOr<void> _onSendMoney(SendMoneyEvent event, emit) async {
    final int amount = int.tryParse(event.amount) ?? 0;
    if (amount < 1) {
      emit(P2pMoneyInitial(validationError: "Amount can be less than 1"));
    }

    if (!isPhoneNoValid(event.sendTo)) {
      emit(P2pMoneyInitial(validationError: "Invalid phone no"));
    }

    emit(P2pMoneyLoading());
    final response = await transferMoneyUsecase.call(
      amount: event.amount,
      sendTo: event.sendTo,
    );
    final state = response.fold(
      (failure) => P2pMoneyFailure((failure as PaymentFailure).msg),
      (payment) => P2pMoneySuccess(payment.id),
    );
    emit(state);
  }
}
