// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/register_module.dart' as _i537;
import 'feature/p2p_money/data/data_source/p2p_money_remote_source.dart'
    as _i311;
import 'feature/p2p_money/data/repository/p2p_money_repository_impl.dart'
    as _i937;
import 'feature/p2p_money/domain/repository/p2p_money_repository.dart' as _i839;
import 'feature/p2p_money/domain/usecases/transfer_money_usecase.dart' as _i643;
import 'feature/p2p_money/presentation/bloc/p2p_money_bloc.dart' as _i148;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i361.Dio>(() => registerModule.prefs);
    gh.lazySingleton<_i311.P2pMoneyRemoteSource>(
      () => _i311.P2pMoneyRemoteSourceImpl(client: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i839.P2pMoneyRepository>(
      () => _i937.P2pMoneyRepositoryImpl(
        p2pMoneyRemoteSource: gh<_i311.P2pMoneyRemoteSource>(),
      ),
    );
    gh.lazySingleton<_i643.TransferMoneyUsecase>(
      () => _i643.TransferMoneyUsecase(
        p2pMoneyRepository: gh<_i839.P2pMoneyRepository>(),
      ),
    );
    gh.factory<_i148.P2pMoneyBloc>(
      () => _i148.P2pMoneyBloc(
        transferMoneyUsecase: gh<_i643.TransferMoneyUsecase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i537.RegisterModule {}
