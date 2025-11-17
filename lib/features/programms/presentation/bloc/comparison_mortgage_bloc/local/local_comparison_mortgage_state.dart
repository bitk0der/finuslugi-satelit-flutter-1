part of 'local_comparison_mortgage_bloc.dart';

@immutable
abstract class LocalMortgageComparisonState {}

class LocalMortgageComparisonBlocStateInitial
    extends LocalMortgageComparisonState {}

class MortgageSuccessfullyAddedToComparison
    extends LocalMortgageComparisonState {}

class MortgageSuccessfullyDeletedFromComparison
    extends LocalMortgageComparisonState {}

class LocalComparisonLoading extends LocalMortgageComparisonState {}

class LocalComparisonError extends LocalMortgageComparisonState {}

class GetFavouritesMortgagesSuccessfull extends LocalMortgageComparisonState {
  final List<Product> favouritesMortgages;

  GetFavouritesMortgagesSuccessfull({required this.favouritesMortgages});
}

class AllProductsSucessfullyDeleted extends LocalMortgageComparisonState {}
