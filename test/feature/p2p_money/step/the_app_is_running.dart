import 'package:flutter_test/flutter_test.dart';
import 'package:fintech_p2p_money/main.dart';

import '../setup_test_di.dart';

Future<void> theAppIsRunning(WidgetTester tester) async {
  await setupTestDI();
  await tester.pumpWidget(MainApp());
}
