import 'package:dio/dio.dart';
import 'package:fintech_p2p_money/feature/transaction_history/data/data_source/transaction_history_local_source.dart';
import 'package:fintech_p2p_money/feature/transaction_history/data/data_source/transaction_history_remote_data_source.dart';
import 'package:fintech_p2p_money/feature/transaction_history/domain/entities/transaction_history_entity.dart';
import 'package:fintech_p2p_money/feature/transaction_history/presentation/page/transaction_history_page.dart';
import 'package:fintech_p2p_money/inject_dependency.dart';
import 'package:fintech_p2p_money/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../setup_test_di.dart';
import '../../setup_test_di.mocks.dart';

/// Usage: The app is running and Fetch API called
Future<void> theAppIsRunningAndFetchApiCalled(WidgetTester tester) async {
  await setupTestDI();
  final mockDio = getIt<Dio>() as MockDio;
  final list = [
    ...List.generate(10, (index) => "Sent $index"),
    ...List.generate(10, (index) => "Received $index"),
  ];
  when(
    mockDio.get(
      TRANSACTIONS_HISTORY_URL,
      queryParameters: anyNamed("queryParameters"),
    ),
  ).thenAnswer((_) async {
    await Future.delayed(Duration(seconds: 2));
    return Response(
      requestOptions: RequestOptions(),
      data: {"transactions": list},
    );
  });
  final mockPrefs = getIt<SharedPreferences>() as MockSharedPreferences;
  when(
    mockPrefs.getString(TRANSACTION_FILTER_PREFS),
  ).thenReturn(TransactionFilter.all.name);
  await tester.pumpWidget(MainApp(testWidget: TransactionHistoryPage()));
}
