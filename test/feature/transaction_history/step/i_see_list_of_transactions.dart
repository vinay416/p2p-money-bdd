import 'package:flutter_test/flutter_test.dart';

/// Usage: I see list of {"Sent/Received"} Transactions
Future<void> iSeeListOfTransactions(WidgetTester tester, String param1) async {
  if (param1.contains("Sent")) {
    for (int i = 0; i < 10; i++) {
      expect(find.text("Sent $i"), findsOne);
    }
  }
  if (param1.contains("Received")) {
    for (int i = 0; i < 10; i++) {
      expect(find.text("Received $i"), findsOne);
    }
  }
}
