import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/response.dart';
import 'package:fin_uslugi/features/cards/data/repositories/credit_search_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class InvestmentSearchBloc
    extends Bloc<InvestmentSearchBlocEvent, InvestmentSearchBlocState> {
  final CreditSearchRepository repository;

  Response _response = Response(products: [], page: 1, totalPages: 1, total: 0);
  int _page = 1;

  InvestmentSearchBloc({
    required this.repository,
  }) : super(InvestmentSearchBlocInitialState()) {
    on<InvestmentSearchBlocSearchEvent>(_onSearchEvent);
    add(InvestmentSearchBlocSearchEvent(page: 1, query: ''));
  }

  Future<void> _onSearchEvent(
    InvestmentSearchBlocSearchEvent event,
    Emitter<InvestmentSearchBlocState> emit,
  ) async {
    if (event.page == 1) emit(InvestmentSearchBlocLoadingState());

    _page = 1; // reset page

    try {
      String queryStringFromList = '';
      List<String> params = ['sum', 'rate', 'parent'];
      List<String> queryList =
          GetIt.I<SharedPreferences>().getStringList('investmentSettings') ??
              [];

      if (queryList.isNotEmpty) {
        for (var i = 0; i < queryList.length; i++) {
          if (queryList[i].isNotEmpty) {
            queryStringFromList +=
                '&${params[i]}=${queryList[i].replaceAll(' ', '')}';
          }
        }
      }

      _response = await repository.searchInvestements(
        page: _page,
        query: event.query ?? queryStringFromList,
      );

      if (event.isForBank) {
        emit(InvestmentSearchForBankBlocReadyState(_response));
      } else {
        emit(InvestmentSearchBlocReadyState(_response));
      }
    } catch (e) {
      print("Investment search error: $e");
      emit(InvestmentSearchBlocErrorState());
    }
  }
}

abstract class InvestmentSearchBlocEvent {}

class InvestmentSearchBlocSearchEvent extends InvestmentSearchBlocEvent {
  final int page;
  final String? query;
  final bool isForBank;
  InvestmentSearchBlocSearchEvent(
      {required this.page, this.query, this.isForBank = false});
}

class InvestmentSearchBlocNextPageEvent extends InvestmentSearchBlocEvent {}

abstract class InvestmentSearchBlocState {}

class InvestmentSearchBlocInitialState extends InvestmentSearchBlocState {}

class InvestmentSearchBlocLoadingState extends InvestmentSearchBlocState {}

class InvestmentSearchBlocPageLoadingState extends InvestmentSearchBlocState {}

class InvestmentSearchForBankBlocReadyState extends InvestmentSearchBlocState {
  final Response response;

  InvestmentSearchForBankBlocReadyState(this.response);
}

class InvestmentSearchBlocReadyState extends InvestmentSearchBlocState {
  final Response response;

  InvestmentSearchBlocReadyState(this.response);
}

class InvestmentSearchBlocErrorState extends InvestmentSearchBlocState {}
