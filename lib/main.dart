import 'package:fintech_p2p_money/feature/p2p_money/presentation/bloc/p2p_money_bloc.dart';
import 'package:fintech_p2p_money/feature/p2p_money/presentation/page/p2p_money_page.dart';
import 'package:fintech_p2p_money/inject_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  await configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<P2pMoneyBloc>(),
      child: const MaterialApp(home: P2pMoneyPage()),
    );
  }
}
