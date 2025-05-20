import 'package:flutter_test/flutter_test.dart';

/// Usage: I see list of {"Sent/Received"} Transactions
Future<void> iSeeListOfTransactions(WidgetTester tester, String param1) async {
  for (int i = 0; i < 5; i++) {
    expect(find.text("Sent $i"), findsOne);
  }
  for (int i = 0; i < 5; i++) {
    expect(find.text("Received $i"), findsOne);
  }
}
