part of 'remote_mortgage_bloc.dart';

@immutable
abstract class RemoteMortgageEvent {}

class GetInitialMortgages extends RemoteMortgageEvent {
  final int page;

  GetInitialMortgages({required this.page});
}

class SearchMortgages extends RemoteMortgageEvent {
  final String searchText;
  final int page;
  SearchMortgages({required this.searchText, required this.page});
}
