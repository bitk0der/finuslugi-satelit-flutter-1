import 'package:fin_uslugi/core/network/api_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fin_uslugi/features/programms/data/models/product_model.dart';
part 'remote_mortgage_event.dart';
part 'remote_mortgage_state.dart';

class RemoteMortgageBloc
    extends Bloc<RemoteMortgageEvent, RemoteMortgageState> {
  final ApiUtil apiUtil;

  RemoteMortgageBloc(this.apiUtil) : super(RemoteCouponsBlocStateInitial()) {
/*     on<GetInitialMortgages>(_onGetInitialMortgages);
    on<SearchMortgages>(_onSearchMortgages); */
  }
/*   _onGetInitialMortgages(GetInitialMortgages event, emit) async {
    event.page == 1 ? emit(Loading()) : null;
    try {
      var productModel = await apiUtil.getInitialMortgages('', event.page);
      if (productModel != null) {
        emit(GetInitialCouponsSuccessfull(productModel: productModel));
      } else {
        emit(Failed());
      }
    } catch (e) {
      emit(Failed());
    }
  }

  _onSearchMortgages(SearchMortgages event, emit) async {
    event.page == 1 ? emit(Loading()) : null;
    try {
      var response = await apiUtil.getInitialMortgages(event.searchText, event.page);

      emit(
          GetSearchedMortgagesSuccessfull(productModel: response!, searchString: event.searchText));
    } catch (e) {
      emit(Failed());
    }
  } */
}
