import 'package:dio/dio.dart';
import 'package:fintech_p2p_money/feature/p2p_money/data/data_source/p2p_money_remote_source.dart';
import 'package:fintech_p2p_money/feature/p2p_money/data/repository/p2p_money_repository_impl.dart';
import 'package:fintech_p2p_money/feature/p2p_money/domain/repository/p2p_money_repository.dart';
import 'package:fintech_p2p_money/feature/p2p_money/domain/usecases/transfer_money_usecase.dart';
import 'package:fintech_p2p_money/feature/p2p_money/presentation/bloc/p2p_money_bloc.dart';
import 'package:fintech_p2p_money/inject_dependency.dart';
import 'package:mockito/annotations.dart';

import 'setup_test_di.mocks.dart';

@GenerateMocks([Dio])

Future<void> setupTestDI() async {
  await getIt.reset();
  getIt.registerFactory<P2pMoneyBloc>(
    () => P2pMoneyBloc(transferMoneyUsecase: getIt()),
  );
  getIt.registerLazySingleton<TransferMoneyUsecase>(
    () => TransferMoneyUsecase(p2pMoneyRepository: getIt()),
  );
  getIt.registerLazySingleton<P2pMoneyRepository>(
    () => P2pMoneyRepositoryImpl(p2pMoneyRemoteSource: getIt()),
  );
  getIt.registerLazySingleton<P2pMoneyRemoteSource>(
    () => P2pMoneyRemoteSourceImpl(client: getIt()),
  );
  getIt.registerLazySingleton<Dio>(() => MockDio());
}
