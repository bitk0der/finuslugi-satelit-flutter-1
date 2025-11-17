part of 'local_mortgage_bloc.dart';

@immutable
abstract class LocalMortgageEvent {}

class AddMortgageToFavourite extends LocalMortgageEvent {
  final Product productItemModel;
  AddMortgageToFavourite({required this.productItemModel});
}

class DeleteMortgageFromFavourite extends LocalMortgageEvent {
  final Product productItemModel;
  DeleteMortgageFromFavourite({required this.productItemModel});
}

class GetFavouritesMortgages extends LocalMortgageEvent {}

class DeleteAllProducts extends LocalMortgageEvent {}
