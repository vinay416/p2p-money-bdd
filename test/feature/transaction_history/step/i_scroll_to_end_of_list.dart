import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';


/// Usage: I scroll to end of list
Future<void> iScrollToEndOfList(WidgetTester tester) async {
  final scrollable = find.byType(SingleChildScrollView);
  expect(scrollable, findsOne);
  // Perform drag
  await tester.drag(scrollable, const Offset(0, -1000)); // Scroll down
}
