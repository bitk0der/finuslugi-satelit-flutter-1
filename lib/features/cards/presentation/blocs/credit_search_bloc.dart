import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/response.dart';

import 'package:fin_uslugi/features/cards/data/repositories/credit_search_repository.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/profile_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class CreditSearchBloc
    extends Bloc<CreditSearchBlocEvent, CreditSearchBlocState> {
  CreditSearchBloc({
    required this.profileBloc,
    required this.repository,
  }) : super(CreditSearchBlocInitialState()) {
    add(CreditSearchBlocSearchEvent(page: 1));
  }

  final ProfileBloc profileBloc;
  final CreditSearchRepository repository;

  late Response _response;

  @override
  Stream<CreditSearchBlocState> mapEventToState(
      CreditSearchBlocEvent event) async* {
    if (event is CreditSearchBlocSearchEvent) {
      if (event.page == 1) yield CreditSearchBlocLoadingState();

      try {
        String queryStringFromList = '';
        List<String> params = ['sum', 'rate', 'parent'];
        List<String> queryList =
            GetIt.I<SharedPreferences>().getStringList('creditsSettings') ?? [];
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
        _response = await repository.searchCredit(
            page: event.page, query: event.query ?? queryStringFromList);
        if (event.isForBank) {
          yield CreditSearchForBankBlocReadyState(_response);
        } else {
          yield CreditSearchBlocReadyState(_response);
        }
      } catch (e) {
        print("Credit search error: $e");
        yield CreditSearchBlocErrorState();
      }
    }
  }
}

abstract class CreditSearchBlocEvent {}

class CreditSearchBlocSearchEvent extends CreditSearchBlocEvent {
  final int page;
  final String? query;
  final bool isForBank;
  CreditSearchBlocSearchEvent(
      {required this.page, this.query, this.isForBank = false});
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
