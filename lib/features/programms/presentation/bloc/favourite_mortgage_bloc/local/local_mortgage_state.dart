part of 'local_mortgage_bloc.dart';

@immutable
abstract class LocalMortgageState {}

class LocalMortgageBlocStateInitial extends LocalMortgageState {}

class MortgageSuccessfullyAddedToFavourite extends LocalMortgageState {}

class MortgageSuccessfullyDeletedFromFavourite extends LocalMortgageState {}

class LocalLoading extends LocalMortgageState {}

class LocalError extends LocalMortgageState {}

class AllProductsRemovedFromFavourites extends LocalMortgageState {}

class GetFavouritesLocalMortgagesSuccessfull extends LocalMortgageState {
  final List<Product> favouritesMortgages;

  GetFavouritesLocalMortgagesSuccessfull({required this.favouritesMortgages});
}
