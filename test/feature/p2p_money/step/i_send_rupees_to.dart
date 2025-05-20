import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I send {500} rupees to {8477832908}
Future<void> iSendRupeesTo(
  WidgetTester tester,
  String amount,
  String sendTo,
) async {
  final amountField = find.byType(TextFormField).at(0);
  final sendToField = find.byType(TextFormField).at(1);
  await tester.enterText(amountField, amount);
  await tester.pump();
  await tester.enterText(sendToField, sendTo);
  await tester.pumpAndSettle();
}
