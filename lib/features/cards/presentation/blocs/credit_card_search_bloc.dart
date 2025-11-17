import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/response.dart';

import 'package:fin_uslugi/features/cards/data/repositories/credit_search_repository.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/profile_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreditCardSearchBloc
    extends Bloc<CreditCardSearchBlocEvent, CreditCardSearchBlocState> {
  CreditCardSearchBloc({
    required this.profileBloc,
    required this.repository,
  }) : super(CreditCardSearchBlocInitialState()) {
    add(CreditCardSearchBlocSearchEvent(page: 1));
  }

  final ProfileBloc profileBloc;
  final CreditSearchRepository repository;

  Response _response = Response(products: [], page: 1, totalPages: 1, total: 0);

  @override
  Stream<CreditCardSearchBlocState> mapEventToState(
      CreditCardSearchBlocEvent event) async* {
    if (event is CreditCardSearchBlocSearchEvent) {
      if (event.page == 1) yield CreditCardSearchBlocLoadingState();
      try {
        String queryStringFromList = '';
        List<String> params = ['sum', 'benefits', 'parent'];
        List<String> queryList =
            GetIt.I<SharedPreferences>().getStringList('creditCardsSettings') ??
                [];
        if (queryList.isEmpty) {
          queryStringFromList = '';
        } else {
          for (var i = 0; i < queryList.length; i++) {
            if (queryList[i].isNotEmpty) {
              queryStringFromList +=
                  '&${params[i]}=${queryList[i].replaceAll(' ', '')}';
            }
          }
        }

        _response = await repository.searchCreditCard(
            page: event.page, query: event.query ?? queryStringFromList);
        if (event.isForBank) {
          yield CreditCardForBankSearchBlocReadyState(_response);
        } else {
          yield CreditCardSearchBlocReadyState(_response);
        }
      } catch (e) {
        print("Credit search error: $e");
        yield CreditCardSearchBlocErrorState();
      }
    }
  }
}

abstract class CreditCardSearchBlocEvent {}

class CreditCardSearchBlocSearchEvent extends CreditCardSearchBlocEvent {
  final int page;
  final String? query;
  final bool isForBank;
  CreditCardSearchBlocSearchEvent(
      {required this.page, this.query, this.isForBank = false});
}

class CreditCardBankSearchBlocSearchEvent extends CreditCardSearchBlocEvent {
  final int page;
  final String? query;
  CreditCardBankSearchBlocSearchEvent({required this.page, this.query});
}

class CreditCardSearchBlocNextPageEvent extends CreditCardSearchBlocEvent {}

abstract class CreditCardSearchBlocState {}

class CreditCardSearchBlocInitialState extends CreditCardSearchBlocState {}

class CreditCardSearchBlocLoadingState extends CreditCardSearchBlocState {}

class CreditCardSearchBlocPageLoadingState extends CreditCardSearchBlocState {}

class CreditCardSearchBlocReadyState extends CreditCardSearchBlocState {
  final Response response;

  CreditCardSearchBlocReadyState(this.response);
}

class CreditCardForBankSearchBlocReadyState extends CreditCardSearchBlocState {
  final Response response;

  CreditCardForBankSearchBlocReadyState(this.response);
}

class CreditCardSearchBlocErrorState extends CreditCardSearchBlocState {}
