import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see more Transactions
Future<void> iSeeMoreTransactions(WidgetTester tester) async {
  final transactionItems = find.byWidgetPredicate(
    (widget) => widget is Text && widget.style?.fontSize == 28,
  );

  final count = tester.widgetList(transactionItems).length;
  expect(
    count,
    greaterThan(15),
    reason: 'Expected more than 15 transactions, found $count',
  );
}
