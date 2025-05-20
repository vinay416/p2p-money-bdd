import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';


/// Usage: I scroll to end of list
Future<void> iScrollToEndOfList(WidgetTester tester) async {
  final scrollable = find.byType(SingleChildScrollView);
  expect(scrollable, findsOne);

  // final mockDio = getIt<Dio>() as MockDio;
  // reset(mockDio);
  // final list = [
  //   ...List.generate(10, (index) => "Sent $index"),
  //   ...List.generate(10, (index) => "Received $index"),
  // ];
  // when(
  //   mockDio.get(
  //     TRANSACTIONS_HISTORY_URL,
  //     queryParameters: anyNamed("queryParameters"),
  //   ),
  // ).thenAnswer((_) async {
  //   await Future.delayed(Duration(seconds: 5));
  //   return Response(
  //     requestOptions: RequestOptions(),
  //     data: {"transactions": list},
  //   );
  // });

  // Perform drag
  await tester.drag(scrollable, const Offset(0, -1000)); // Scroll down
}
