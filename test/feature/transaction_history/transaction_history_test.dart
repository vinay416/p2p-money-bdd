// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_running_and_fetch_api_called.dart';
import './step/showing_loader_while_fetch.dart';
import './step/i_see_list_of_transactions.dart';
import './step/showing_list_of_transactions.dart';
import './step/i_scroll_to_end_of_list.dart';
import './step/i_see_more_transactions.dart';
import './step/i_tap_text.dart';

void main() {
  group('''Transaction history''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunningAndFetchApiCalled(tester);
    }

    testWidgets('''Fetch Transaction history (Default All)''', (tester) async {
      await bddSetUp(tester);
      await showingLoaderWhileFetch(tester);
      await iSeeListOfTransactions(tester, "Sent/Received");
    });
    testWidgets('''Paginate Transaction history (Default All)''',
        (tester) async {
      await bddSetUp(tester);
      await showingListOfTransactions(tester);
      await iScrollToEndOfList(tester);
      await showingLoaderWhileFetch(tester);
      await iSeeMoreTransactions(tester);
    });
    testWidgets('''Changed the Filter to Sent''', (tester) async {
      await bddSetUp(tester);
      await showingListOfTransactions(tester);
      await iTapText(tester, "Filter");
      await iTapText(tester, "Sent");
      await iSeeListOfTransactions(tester, "Sent");
    });
    testWidgets('''Changed the Filter to Received''', (tester) async {
      await bddSetUp(tester);
      await showingListOfTransactions(tester);
      await iTapText(tester, "Filter");
      await iTapText(tester, "Received");
      await iSeeListOfTransactions(tester, "Received");
    });
    testWidgets('''Changed the Filter to All''', (tester) async {
      await bddSetUp(tester);
      await showingListOfTransactions(tester);
      await iTapText(tester, "Filter");
      await iTapText(tester, "All");
      await iSeeListOfTransactions(tester, "Sent/Received");
    });
  });
}
