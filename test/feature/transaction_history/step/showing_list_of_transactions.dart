import 'package:flutter_test/flutter_test.dart';

import 'i_see_list_of_transactions.dart';
import 'showing_loader_while_fetch.dart';

/// Usage: Showing List of Transactions
Future<void> showingListOfTransactions(WidgetTester tester) async {
  await showingLoaderWhileFetch(tester);
  await iSeeListOfTransactions(tester, "Sent/Received");
}
