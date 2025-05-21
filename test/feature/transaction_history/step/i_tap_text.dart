import 'package:fintech_p2p_money/feature/transaction_history/data/data_source/transaction_history_local_source.dart';
import 'package:fintech_p2p_money/inject_dependency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../setup_test_di.mocks.dart';

/// Example: When I tap {'some'} text
Future<void> iTapText(WidgetTester tester, String text) async {
  final mockPrefs = getIt<SharedPreferences>() as MockSharedPreferences;
  when(
    mockPrefs.setString(TRANSACTION_FILTER_PREFS, text),
  ).thenAnswer((_) async => true);

  await tester.ensureVisible(find.text(text));
  await tester.pump();
  await tester.tap(find.text(text));
  await tester.pump();
}
