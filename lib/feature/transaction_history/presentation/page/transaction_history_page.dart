import 'package:fintech_p2p_money/feature/transaction_history/domain/entities/transaction_history_entity.dart';
import 'package:fintech_p2p_money/feature/transaction_history/presentation/bloc/transaction_history_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({super.key});

  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  final scrollController = ScrollController();
  List<String> transactions = [];

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final bloc = context.read<TransactionHistoryBloc>();
    bloc.add(FetchHistory());
    scrollController.addListener(() {
      if (!scrollController.hasClients) return;
      if (bloc.state is TransactionHistoryPaginating) return;
      if (transactions.isEmpty) return;
      final pos = scrollController.position.pixels;
      if (pos < scrollController.position.maxScrollExtent) return;
      bloc.add(PaginateHistory(transactions));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        actions: [
          PopupMenuButton<TransactionFilter>(
            itemBuilder: (context) {
              return TransactionFilter.values
                  .map((e) => PopupMenuItem(value: e, child: Text(e.name)))
                  .toList();
            },
            onSelected: (value) {
              context.read<TransactionHistoryBloc>().add(ChangeFilter(value));
            },
          ),
        ],
      ),
      body: BlocBuilder<TransactionHistoryBloc, TransactionHistoryState>(
        builder: (context, state) {
          if (state is TransactionHistoryLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is TransactionHistoryData) {
            transactions = state.historyEntity.transactions;
          }

          if (transactions.isEmpty) return Center(child: Text("No History"));

          return SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder:
                      (context, index) => Text(
                        transactions[index],
                        style: TextStyle(fontSize: 28),
                      ),
                  itemCount: transactions.length,
                  separatorBuilder: (context, index) => SizedBox(height: 20),
                ),
                if (state is TransactionHistoryPaginating)
                  CircularProgressIndicator(),
              ],
            ),
          );
        },
      ),
    );
  }
}
