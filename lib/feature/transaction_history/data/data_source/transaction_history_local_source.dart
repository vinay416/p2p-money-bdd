import 'package:fintech_p2p_money/core/exceptions.dart';
import 'package:fintech_p2p_money/feature/transaction_history/domain/entities/transaction_history_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TransactionHistoryLocalSource {
  Future<TransactionFilter> getFilter();
  Future<void> setFilter(TransactionFilter filter);
}

// ignore: constant_identifier_names
const String TRANSACTION_FILTER_PREFS = "TRANSACTION_FILTER_PREFS";

@LazySingleton(as: TransactionHistoryLocalSource)
class TransactionHistoryLocalSourceImpl
    implements TransactionHistoryLocalSource {
  const TransactionHistoryLocalSourceImpl({required this.prefs});
  final SharedPreferences prefs;

  @override
  Future<TransactionFilter> getFilter() async {
    final filter = prefs.getString(TRANSACTION_FILTER_PREFS);
    return TransactionFilter.fromString(filter);
  }

  @override
  Future<void> setFilter(TransactionFilter filter) async {
    final success = await prefs.setString(
      TRANSACTION_FILTER_PREFS,
      filter.name,
    );
    if (!success) CacheException();
  }
}
