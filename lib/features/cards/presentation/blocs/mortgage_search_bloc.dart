import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/response.dart';
import 'package:fin_uslugi/features/cards/data/repositories/credit_search_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class MortgageSearchBloc
    extends Bloc<MortgageSearchBlocEvent, MortgageSearchBlocState> {
  final CreditSearchRepository repository;

  Response _response = Response(products: [], page: 1, totalPages: 1, total: 0);
  int _page = 1;

  MortgageSearchBloc({
    required this.repository,
  }) : super(MortgageSearchBlocInitialState()) {
    on<MortgageSearchBlocSearchEvent>(_onSearchEvent);
    add(MortgageSearchBlocSearchEvent(page: 1, query: ''));
  }

  Future<void> _onSearchEvent(
    MortgageSearchBlocSearchEvent event,
    Emitter<MortgageSearchBlocState> emit,
  ) async {
    if (event.page == 1) emit(MortgageSearchBlocLoadingState());

    _page = 1;

    try {
      String queryStringFromList = '';
      List<String> params = ['sum', 'rate', 'parent'];
      List<String> queryList =
          GetIt.I<SharedPreferences>().getStringList('mortgagesSettings') ?? [];

      if (queryList.isNotEmpty) {
        for (var i = 0; i < queryList.length; i++) {
          if (queryList[i].isNotEmpty) {
            queryStringFromList +=
                '&${params[i]}=${queryList[i].replaceAll(' ', '')}';
          }
        }
      }

      _response = await repository.searchMortgages(
        page: _page,
        query: event.query ?? queryStringFromList,
      );

      if (event.isForBank) {
        emit(MortgageSearchForBankBlocReadyState(_response));
      } else {
        emit(MortgageSearchBlocReadyState(_response));
      }
    } catch (e) {
      print("Mortgage search error: $e");
      emit(MortgageSearchBlocErrorState());
    }
  }
}

abstract class MortgageSearchBlocEvent {}

class MortgageSearchBlocSearchEvent extends MortgageSearchBlocEvent {
  final int page;
  final String? query;
  final bool isForBank;
  MortgageSearchBlocSearchEvent(
      {required this.page, this.query, this.isForBank = false});
}

class MortgageSearchBlocNextPageEvent extends MortgageSearchBlocEvent {}

abstract class MortgageSearchBlocState {}

class MortgageSearchBlocInitialState extends MortgageSearchBlocState {}

class MortgageSearchBlocLoadingState extends MortgageSearchBlocState {}

class MortgageSearchBlocPageLoadingState extends MortgageSearchBlocState {}

class MortgageSearchForBankBlocReadyState extends MortgageSearchBlocState {
  final Response response;

  MortgageSearchForBankBlocReadyState(this.response);
}

class MortgageSearchBlocReadyState extends MortgageSearchBlocState {
  final Response response;

  MortgageSearchBlocReadyState(this.response);
}

class MortgageSearchBlocErrorState extends MortgageSearchBlocState {}
