import 'package:fintech_p2p_money/feature/p2p_money/presentation/bloc/p2p_money_bloc.dart';
import 'package:fintech_p2p_money/feature/p2p_money/presentation/page/p2p_money_page.dart';
import 'package:fintech_p2p_money/feature/transaction_history/presentation/bloc/transaction_history_bloc.dart';
import 'package:fintech_p2p_money/inject_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, this.testWidget});
  final Widget? testWidget;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<P2pMoneyBloc>()),
        BlocProvider(create: (context) => getIt<TransactionHistoryBloc>()),
      ],
      child: MaterialApp(home: testWidget ?? P2pMoneyPage()),
    );
  }
}
