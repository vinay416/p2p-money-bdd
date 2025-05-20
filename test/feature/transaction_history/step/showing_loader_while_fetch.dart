import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: Showing loader while fetch
Future<void> showingLoaderWhileFetch(WidgetTester tester) async {
  await tester.pump();
  expect(find.byType(CircularProgressIndicator), findsOneWidget);
  await tester.pumpAndSettle(Duration(seconds: 2));
}
