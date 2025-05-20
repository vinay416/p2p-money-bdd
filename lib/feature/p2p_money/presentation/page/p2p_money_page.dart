import 'package:fintech_p2p_money/feature/p2p_money/presentation/bloc/p2p_money_bloc.dart';
import 'package:fintech_p2p_money/feature/transaction_history/presentation/page/transaction_history_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class P2pMoneyPage extends StatefulWidget {
  const P2pMoneyPage({super.key});

  @override
  State<P2pMoneyPage> createState() => _P2pMoneyPageState();
}

class _P2pMoneyPageState extends State<P2pMoneyPage> {
  final amountController = TextEditingController();
  final phoneNoController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    phoneNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transfer"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TransactionHistoryPage(),
                ),
              );
            },
            icon: Icon(Icons.history),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<P2pMoneyBloc, P2pMoneyState>(
          buildWhen: (previous, current) => current is! P2pMoneyLoading,
          builder: (context, state) {
            if (state is P2pMoneyFailure) {
              return Text(state.msg);
            }

            if (state is P2pMoneySuccess) {
              return Column(children: [Text("Money Sent"), Text(state.payId)]);
            }

            String? error;
            if (state is P2pMoneyInitial) {
              error = state.validationError;
            }

            return Column(
              spacing: 20,
              children: [
                TextFormField(controller: amountController),
                TextFormField(controller: phoneNoController),
                if (error != null) Text(error),
                buildButton(),
              ],
            );
          },
        ),
      ),
    );
  }

  BlocSelector<P2pMoneyBloc, P2pMoneyState, bool> buildButton() {
    return BlocSelector<P2pMoneyBloc, P2pMoneyState, bool>(
      selector: (state) {
        return state is P2pMoneyLoading;
      },
      builder: (context, loading) {
        if (loading) return CircularProgressIndicator();
        return ElevatedButton(
          onPressed: () {
            context.read<P2pMoneyBloc>().add(
              SendMoneyEvent(
                amount: amountController.text.trim(),
                sendTo: phoneNoController.text.trim(),
              ),
            );
          },
          child: Text("Send"),
        );
      },
    );
  }
}
