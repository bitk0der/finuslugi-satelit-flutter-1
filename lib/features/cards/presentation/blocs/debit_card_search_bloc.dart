import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/response.dart';

import 'package:fin_uslugi/features/cards/data/repositories/credit_search_repository.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/profile_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class DebitCardSearchBloc
    extends Bloc<DebitCardSearchBlocEvent, DebitCardSearchBlocState> {
  DebitCardSearchBloc({
    required this.profileBloc,
    required this.repository,
  }) : super(DebitCardSearchBlocInitialState()) {
    add(DebitCardSearchBlocSearchEvent(page: 1));
  }

  final ProfileBloc profileBloc;
  final CreditSearchRepository repository;

  Response _response = Response(products: [], page: 1, totalPages: 1, total: 0);

  @override
  Stream<DebitCardSearchBlocState> mapEventToState(
      DebitCardSearchBlocEvent event) async* {
    if (event is DebitCardSearchBlocSearchEvent) {
      if (event.page == 1) yield DebitCardSearchBlocLoadingState();

      try {
        String queryStringFromList = '';
        List<String> params = ['benefits', 'feature', 'parent'];
        List<String> queryList =
            GetIt.I<SharedPreferences>().getStringList('debitCardsSettings') ??
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

        _response = await repository.searchDebitCard(
            page: event.page, query: event.query ?? queryStringFromList);
        if (event.isForBank) {
          yield DebitCardForBankSearchBlocReadyState(_response);
        } else {
          yield DebitCardSearchBlocReadyState(_response);
        }
      } catch (e) {
        print("Credit search error: $e");
        yield DebitCardSearchBlocErrorState();
      }
    }
  }
}

abstract class DebitCardSearchBlocEvent {}

class DebitCardSearchBlocSearchEvent extends DebitCardSearchBlocEvent {
  final int page;
  final String? query;
  final bool isForBank;
  DebitCardSearchBlocSearchEvent(
      {required this.page, this.query, this.isForBank = false});
}

class DebitCardSearchBlocNextPageEvent extends DebitCardSearchBlocEvent {}

abstract class DebitCardSearchBlocState {}

class DebitCardSearchBlocInitialState extends DebitCardSearchBlocState {}

class DebitCardSearchBlocLoadingState extends DebitCardSearchBlocState {}

class DebitCardSearchBlocPageLoadingState extends DebitCardSearchBlocState {}

class DebitCardSearchBlocReadyState extends DebitCardSearchBlocState {
  final Response response;

  DebitCardSearchBlocReadyState(this.response);
}

class DebitCardForBankSearchBlocReadyState extends DebitCardSearchBlocState {
  final Response response;

  DebitCardForBankSearchBlocReadyState(this.response);
}

class DebitCardSearchBlocErrorState extends DebitCardSearchBlocState {}
