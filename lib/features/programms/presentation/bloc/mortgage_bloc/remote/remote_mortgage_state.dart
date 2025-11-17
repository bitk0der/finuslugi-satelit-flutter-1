part of 'remote_mortgage_bloc.dart';

@immutable
abstract class RemoteMortgageState {}

class RemoteCouponsBlocStateInitial extends RemoteMortgageState {}

class Loading extends RemoteMortgageState {}

class Failed extends RemoteMortgageState {}

class GetInitialCouponsSuccessfull extends RemoteMortgageState {
  final ProductModel productModel;

  GetInitialCouponsSuccessfull({required this.productModel});
}

class GetSearchedMortgagesSuccessfull extends RemoteMortgageState {
  final ProductModel productModel;
  final String searchString;
  GetSearchedMortgagesSuccessfull({required this.productModel, required this.searchString});
}
