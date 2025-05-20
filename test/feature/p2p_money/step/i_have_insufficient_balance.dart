import 'package:dio/dio.dart';
import 'package:fintech_p2p_money/feature/p2p_money/data/data_source/p2p_money_remote_source.dart';
import 'package:fintech_p2p_money/inject_dependency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../setup_test_di.mocks.dart';

/// Usage: I have insufficient balance
Future<void> iHaveInsufficientBalance(WidgetTester tester) async {
  final mockDio = getIt<Dio>() as MockDio;
  when(
    mockDio.post(
      P2P_TRANSFER_URL,
      queryParameters: anyNamed("queryParameters"),
    ),
  ).thenAnswer(
    (_) async => Response(
      requestOptions: RequestOptions(),
      data: {"status": false, "msg": "Insufficient Balance"},
    ),
  );
}
