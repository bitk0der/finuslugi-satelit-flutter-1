import 'package:fin_uslugi/features/coupons/data/models/coupon_model.dart';
import 'package:fin_uslugi/features/coupons/data/models/retailer_model.dart';
import 'package:fin_uslugi/features/coupons/presentation/pages/favourites/data/models/coupon_favourite_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce_flutter/adapters.dart';
part 'local_coupons_event.dart';
part 'local_coupons_state.dart';

class LocalCouponsBloc extends Bloc<LocalCouponsEvent, LocalCouponsState> {
  LocalCouponsBloc() : super(LocalMortgageBlocStateInitial()) {
    on<AddCouponToFavourite>(_onAddCouponToFavourite);
    on<DeleteCouponFromFavourite>(_onDeleteCouponFromFavourite);
    on<AddRatailerToFavourite>(_onAddRetailerToFavourite);
    on<DeleteRetailerFromFavourite>(_onDeleteRetailerFromFavourite);
    on<DeleteAllFromFavourite>(_onDeleteAllFromFavourite);
    on<GetFavouritesCoupons>(_onGetFavouritesCoupons);
    on<GetFavouritesRetailers>(_onGetFavouritesRetailers);
  }

  _onGetFavouritesCoupons(GetFavouritesCoupons event, emit) async {
    try {
      final incomesBox = await Hive.openBox<CouponFavouriteModel>('coupons');

      emit(
          GetFavouritesCouponsSuccessfull(coupons: incomesBox.values.toList()));
    } catch (e) {
      emit(LocalError());
    }
  }

  _onGetFavouritesRetailers(GetFavouritesRetailers event, emit) async {
    try {
      final incomesBox = await Hive.openBox<RetailerModel>('retailers');
      emit(GetFavouritesRetailersSuccessfull(
          retailers: incomesBox.values.toList()));
    } catch (e) {
      emit(LocalError());
    }
  }

  _onAddCouponToFavourite(AddCouponToFavourite event, emit) async {
    try {
      final incomesBox = await Hive.openBox<CouponFavouriteModel>('coupons');
      await incomesBox.add(event.coupon);
      addOrRemoveFromCache(false, event.coupon.coupon.uuid, true);
      emit(SuccessfullyAddedCouponToFavourite(
          couponFavouriteModel: event.coupon));
    } catch (e) {
      emit(LocalError());
    }
  }

  _onDeleteCouponFromFavourite(DeleteCouponFromFavourite event, emit) async {
    try {
      final incomesBox = await Hive.openBox<CouponFavouriteModel>('coupons');
      var key = incomesBox
          .toMap()
          .entries
          .firstWhere((element) =>
              element.value.coupon.uuid == event.coupon.coupon.uuid)
          .key;
      await incomesBox.delete(key);
      addOrRemoveFromCache(true, event.coupon.coupon.uuid, true);
      emit(SuccessfullyDeletedFromFavourite());
    } catch (e) {
      emit(LocalError());
    }
  }

  _onAddRetailerToFavourite(AddRatailerToFavourite event, emit) async {
    try {
      final incomesBox = await Hive.openBox<RetailerModel>('retailers');
      await incomesBox.add(event.retailer);
      addOrRemoveFromCache(false, event.retailer.uuid, false);
      emit(SuccessfullyAddedToFavourite());
    } catch (e) {
      emit(LocalError());
    }
  }

  _onDeleteRetailerFromFavourite(
      DeleteRetailerFromFavourite event, emit) async {
    try {
      final incomesBox = await Hive.openBox<RetailerModel>('retailers');
      var key = incomesBox
          .toMap()
          .entries
          .firstWhere((element) => element.value.uuid == event.retailer.uuid)
          .key;
      await incomesBox.delete(key);
      addOrRemoveFromCache(true, event.retailer.uuid, false);
      emit(SuccessfullyDeletedFromFavourite());
    } catch (e) {
      emit(LocalError());
    }
  }

  addOrRemoveFromCache(bool remove, String id, bool isCoupon) async {
    /*   String ids = isCoupon ? 'coupons' : 'retailers';

    List mortgagesIDS = GetStorage().read(ids) ?? [];
    if (remove) {
      mortgagesIDS.remove(id);
    } else {
      mortgagesIDS.add(id);
    }
    await GetStorage().remove(ids);
    await GetStorage().write(ids, mortgagesIDS); */
  }

  _onDeleteAllFromFavourite(DeleteAllFromFavourite event, emit) async {
    /*  try {
      final couponsBox = await Hive.openBox<CouponModel>('coupons');
      final retailerBox = await Hive.openBox<RetailerModel>('retailers');
      await couponsBox.clear();
      await retailerBox.clear();
      await GetStorage().erase();
      emit(SuccessfullyDeletedAllFromFavourite());
    } catch (e) {
      emit(LocalError());
    } */
  }
}
