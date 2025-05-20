import 'package:dio/dio.dart';
import 'package:fintech_p2p_money/feature/transaction_history/data/model/transaction_history_model.dart';
import 'package:injectable/injectable.dart';

abstract class TransactionHistoryRemoteDataSource {
  Future<TransactionHistoryModel> fetch();
  Future<TransactionHistoryModel> paginate(int start);
}

// ignore: constant_identifier_names
const String TRANSACTIONS_HISTORY_URL =
    "https://fintech.com/transactions/history";

@LazySingleton(as: TransactionHistoryRemoteDataSource)
class TransactionHistoryRemoteDataSourceImpl
    implements TransactionHistoryRemoteDataSource {
  final Dio client;
  const TransactionHistoryRemoteDataSourceImpl({required this.client});

  @override
  Future<TransactionHistoryModel> fetch() async {
    return await _getTransactions(start: 1);
  }

  @override
  Future<TransactionHistoryModel> paginate(int start) async {
    return await _getTransactions(start: start);
  }

  Future<TransactionHistoryModel> _getTransactions({required int start}) async {
    final response = await client.get(
      TRANSACTIONS_HISTORY_URL,
      queryParameters: {"start": start, "offset": 10},
    );

    final Map<String, dynamic> transactions = response.data ?? {};
    return TransactionHistoryModel.fromJson(transactions);
  }
}
