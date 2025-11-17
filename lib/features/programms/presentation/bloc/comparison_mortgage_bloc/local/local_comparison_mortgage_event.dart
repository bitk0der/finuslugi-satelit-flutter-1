part of 'local_comparison_mortgage_bloc.dart';

@immutable
abstract class LocalMortgageComparisonEvent {}

class AddMortgageToComparison extends LocalMortgageComparisonEvent {
  final Product productItemModel;
  AddMortgageToComparison({required this.productItemModel});
}

class DeleteMortgageFromComparison extends LocalMortgageComparisonEvent {
  final Product productItemModel;
  DeleteMortgageFromComparison({required this.productItemModel});
}

class AllProductsDelete extends LocalMortgageComparisonEvent {}

class GetComparisonMortgages extends LocalMortgageComparisonEvent {}
