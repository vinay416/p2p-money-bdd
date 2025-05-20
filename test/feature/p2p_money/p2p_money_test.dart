// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_running.dart';
import './step/i_send_rupees_to.dart';
import './step/i_have_sufficient_balance.dart';
import './step/i_tap_text.dart';
import './step/i_see_text.dart';
import './step/i_have_insufficient_balance.dart';
import './step/be_server_throws_error.dart';

void main() {
  group('''P2P money transfer using phone no.''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunning(tester);
    }

    testWidgets('''The money transfered successfully''', (tester) async {
      await bddSetUp(tester);
      await iSendRupeesTo(tester, "500", "8477832908");
      await iHaveSufficientBalance(tester);
      await iTapText(tester, "Send");
      await iSeeText(tester, "Money Sent");
    });
    testWidgets('''The money transfered failed''', (tester) async {
      await bddSetUp(tester);
      await iSendRupeesTo(tester, "500", "8477832908");
      await iHaveInsufficientBalance(tester);
      await iTapText(tester, "Send");
      await iSeeText(tester, "Insufficient Balance");
    });
    testWidgets('''The money server issue''', (tester) async {
      await bddSetUp(tester);
      await iSendRupeesTo(tester, "500", "8477832908");
      await beServerThrowsError(tester);
      await iTapText(tester, "Send");
      await iSeeText(tester, "Something went wrong");
    });
  });
}
