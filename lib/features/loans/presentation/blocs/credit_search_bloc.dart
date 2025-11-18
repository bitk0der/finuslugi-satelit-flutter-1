import 'package:fin_uslugi/features/loans/data/models/credit/search_responses/response.dart';
import 'package:fin_uslugi/features/loans/data/repositories/credit_search_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:fin_uslugi/core/utils/check_connectivity.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class CreditSearchBloc
    extends Bloc<CreditSearchBlocEvent, CreditSearchBlocState> {
  final CreditSearchRepository repository;
  CreditSearchBloc({required this.repository})
      : super(CreditSearchBlocInitialState()) {
    on<CreditSearchBlocSearchEvent>((event, emit) async {
      if (event.page == 1) emit(CreditSearchBlocLoadingState());

      try {
        if (!await checkConnectivity()) {
          emit(CreditSearchBlocErrorConnectionState());
          return;
        }

        String queryStringFromList = '';
        List<String> params = ['sum'];
        List<String> queryList =
            GetIt.I<SharedPreferences>().getStringList('loanSettings') ?? [];
        if (queryList.isEmpty) {
          queryStringFromList = '';
        } else {
          for (var i = 0; i < queryList.length; i++) {
            if (queryList[i].isNotEmpty) {
              queryStringFromList +=
                  '&${params[i]}=${queryList[i].replaceAll(' ', '').split('.')[0]}';
            }
          }
        }
        var response = await repository.searchCredit(
            page: event.page,
            query: queryStringFromList,
            searchString: event.query ?? '');
        emit(CreditSearchBlocReadyState(response));
      } catch (e) {
        print("Credit search error: $e");
        emit(CreditSearchBlocErrorState());
      }
    });
  }
}

abstract class CreditSearchBlocEvent {}

class CreditSearchBlocSearchEvent extends CreditSearchBlocEvent {
  final int page;
  final String? query;
  CreditSearchBlocSearchEvent({required this.page, this.query});
}

class CreditSearchBlocNextPageEvent extends CreditSearchBlocEvent {}

abstract class CreditSearchBlocState {}

class CreditSearchBlocInitialState extends CreditSearchBlocState {}

class CreditSearchBlocLoadingState extends CreditSearchBlocState {}

class CreditSearchBlocPageLoadingState extends CreditSearchBlocState {}

class CreditSearchBlocReadyState extends CreditSearchBlocState {
  final Response response;

  CreditSearchBlocReadyState(this.response);
}

class CreditSearchForBankBlocReadyState extends CreditSearchBlocState {
  final Response response;

  CreditSearchForBankBlocReadyState(this.response);
}

class CreditSearchBlocErrorState extends CreditSearchBlocState {}

class CreditSearchBlocErrorConnectionState extends CreditSearchBlocState {}
