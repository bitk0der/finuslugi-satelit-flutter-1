// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:fin_uslugi/core/di/service_locator.dart' as _i751;
import 'package:fin_uslugi/core/network/api_client.dart' as _i623;
import 'package:fin_uslugi/core/network/api_util.dart' as _i597;
import 'package:fin_uslugi/core/network/service/rest_service.dart' as _i1048;
import 'package:fin_uslugi/core/utils/storage_util.dart' as _i124;
import 'package:fin_uslugi/features/cards/data/repositories/credit_search_repository.dart'
    as _i3;
import 'package:fin_uslugi/features/cards/data/repositories/storage_repository.dart'
    as _i102;
import 'package:fin_uslugi/features/cards/domain/repositories/credit_search_data_repository.dart'
    as _i779;
import 'package:fin_uslugi/features/cards/domain/repositories/storage_data_repository.dart'
    as _i348;
import 'package:fin_uslugi/features/cards/presentation/blocs/credit_card_search_bloc.dart'
    as _i307;
import 'package:fin_uslugi/features/cards/presentation/blocs/credit_search_bloc.dart'
    as _i930;
import 'package:fin_uslugi/features/cards/presentation/blocs/debit_card_search_bloc.dart'
    as _i147;
import 'package:fin_uslugi/features/cards/presentation/blocs/filters_bloc.dart'
    as _i649;
import 'package:fin_uslugi/features/cards/presentation/blocs/investment_search_bloc.dart'
    as _i932;
import 'package:fin_uslugi/features/cards/presentation/blocs/mortgage_search_bloc.dart'
    as _i32;
import 'package:fin_uslugi/features/cards/presentation/blocs/profile_bloc.dart'
    as _i1010;
import 'package:fin_uslugi/features/coupons/presentation/bloc/coupons_bloc/remote/remote_coupons_bloc.dart'
    as _i408;
import 'package:fin_uslugi/features/loans/data/repositories/credit_search_repository.dart'
    as _i796;
import 'package:fin_uslugi/features/loans/domain/repositories/credit_search_data_repository.dart'
    as _i106;
import 'package:fin_uslugi/features/loans/presentation/blocs/credit_search_bloc.dart'
    as _i214;
import 'package:fin_uslugi/features/local_notifications/presentation/bloc/notification_bloc.dart'
    as _i747;
import 'package:fin_uslugi/features/programms/presentation/bloc/favourite_mortgage_bloc/local/local_mortgage_bloc.dart'
    as _i282;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final loggerModule = _$LoggerModule();
    final dioModule = _$DioModule();
    gh.factory<_i1048.RestService>(() => _i1048.RestService());
    gh.factory<_i124.StorageUtil>(() => _i124.StorageUtil());
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.sp,
      preResolve: true,
    );
    gh.singleton<_i974.Logger>(() => loggerModule.logger());
    gh.singleton<_i649.FiltersBloc>(() => _i649.FiltersBloc());
    gh.singleton<_i408.RemoteCouponsBloc>(() => _i408.RemoteCouponsBloc());
    gh.singleton<_i282.LocalMortgageBloc>(() => _i282.LocalMortgageBloc());
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.factory<_i102.StorageRepository>(
        () => _i348.StorageDataRepository(gh<_i124.StorageUtil>()));
    gh.factory<_i597.ApiUtil>(() => _i597.ApiUtil(gh<_i1048.RestService>()));
    gh.factory<_i623.ApiClient>(() => _i623.ApiClient(gh<_i361.Dio>()));
    gh.singleton<_i747.LocalNotificationBloc>(() => _i747.LocalNotificationBloc(
          gh<_i623.ApiClient>(),
          gh<_i460.SharedPreferences>(),
        ));
    gh.factory<_i796.CreditSearchRepository>(
        () => _i106.SearchDataRepository(gh<_i623.ApiClient>()));
    gh.singleton<_i214.CreditSearchBloc>(() =>
        _i214.CreditSearchBloc(repository: gh<_i796.CreditSearchRepository>()));
    gh.singleton<_i1010.ProfileBloc>(() =>
        _i1010.ProfileBloc(storageRepository: gh<_i102.StorageRepository>()));
    gh.factory<_i3.CreditSearchRepository>(
        () => _i779.SearchDataRepository(gh<_i597.ApiUtil>()));
    gh.factory<_i930.CreditSearchBloc>(() => _i930.CreditSearchBloc(
          profileBloc: gh<_i1010.ProfileBloc>(),
          repository: gh<_i3.CreditSearchRepository>(),
        ));
    gh.factory<_i147.DebitCardSearchBloc>(() => _i147.DebitCardSearchBloc(
          profileBloc: gh<_i1010.ProfileBloc>(),
          repository: gh<_i3.CreditSearchRepository>(),
        ));
    gh.singleton<_i307.CreditCardSearchBloc>(() => _i307.CreditCardSearchBloc(
          profileBloc: gh<_i1010.ProfileBloc>(),
          repository: gh<_i3.CreditSearchRepository>(),
        ));
    gh.singleton<_i932.InvestmentSearchBloc>(() => _i932.InvestmentSearchBloc(
        repository: gh<_i3.CreditSearchRepository>()));
    gh.singleton<_i32.MortgageSearchBloc>(() =>
        _i32.MortgageSearchBloc(repository: gh<_i3.CreditSearchRepository>()));
    return this;
  }
}

class _$SharedPreferencesModule extends _i751.SharedPreferencesModule {}

class _$LoggerModule extends _i751.LoggerModule {}

class _$DioModule extends _i751.DioModule {}
