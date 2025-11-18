import 'package:fin_uslugi/core/network/api_service.dart';
import 'package:fin_uslugi/core/network/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fin_uslugi/features/coupons/data/models/config_model.dart';
import 'package:fin_uslugi/features/coupons/data/models/coupon_item_model.dart';
import 'package:fin_uslugi/features/coupons/data/models/coupon_model.dart';
part 'remote_coupons_event.dart';
part 'remote_coupons_state.dart';

class RemoteCouponsBloc extends Bloc<RemoteCouponsEvent, RemoteCouponsState> {
  RemoteCouponsBloc() : super(RemoteCouponsBlocStateInitial()) {
    on<SearchCoupons>(_onSearchCoupons);
    on<GetConfig>(_onGetConfig);
    on<GetAllMarketCoupons>(_onGetAllMarketCoupons);
  }

  Future<void> _onSearchCoupons(SearchCoupons event, emit) async {
    emit(Loading());
    try {
      List<CouponModel> coupons = [];
      var response = await ApiService().sendGet(
          Routes.searchCoupons(
              event.searchText, event.nextPage, event.category),
          {},
          isUrlEncoded: true);
      if (response != '') {
        coupons = List.generate(response['offers'].length,
            (index) => CouponModel.fromJson(response['offers'][index]));
      }
      emit(GetCouponsSuccessfull(
          coupons: coupons,
          nextPageKey: response['nextPage'],
          searchString: event.searchText));
    } catch (e) {
      emit(Failed());
    }
  }

  Future<void> _onGetConfig(GetConfig event, emit) async {
    emit(Loading());
    try {
      List<ConfigModel> configModels = [];
      var response = await ApiService()
          .sendGet(Routes.getConfig(), {}, isUrlEncoded: true);

      configModels = List.generate(
          response.length, (index) => ConfigModel.fromJson(response[index]));

      emit(GetConfigSuccessfull(configModel: configModels));
    } catch (e) {
      emit(Failed());
    }
  }

  Future<void> _onGetAllMarketCoupons(GetAllMarketCoupons event, emit) async {
    emit(Loading());
    try {
      List<CouponItem> couponItems = [];
      var response = await ApiService().sendGet(
          Routes.getMarketCoupons(event.website), {},
          isUrlEncoded: true);

      couponItems = List.generate(response['coupons'].length,
          (index) => CouponItem.fromJson(response['coupons'][index]));

      emit(GetAllMarketCouponsSuccessfull(couponItems: couponItems));
    } catch (e) {
      emit(Failed());
    }
  }
}
