import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'local_mortgage_event.dart';
part 'local_mortgage_state.dart';

@singleton
class LocalMortgageBloc extends Bloc<LocalMortgageEvent, LocalMortgageState> {
  LocalMortgageBloc() : super(LocalMortgageBlocStateInitial()) {
    on<AddMortgageToFavourite>(_onAddMortgageToFavourite);
    on<GetFavouritesMortgages>(_onGetFavouriteMortgages);
    on<DeleteAllProducts>(_onDeleteAllProducts);
  }

  Future<void> _onAddMortgageToFavourite(
      AddMortgageToFavourite event, emit) async {
    try {
      final incomesBox = await Hive.openBox<Product>('productItemModels');
      if (!checkId(incomesBox, event.productItemModel.id)) {
        await incomesBox.add(event.productItemModel);
        addOrRemoveFromCache(false, event.productItemModel.id.toString());
      } else {
        var key = incomesBox
            .toMap()
            .entries
            .firstWhere(
                (element) => element.value.id == event.productItemModel.id)
            .key;
        await incomesBox.delete(key);
        addOrRemoveFromCache(true, event.productItemModel.id.toString());
      }

      emit(MortgageSuccessfullyAddedToFavourite());
    } catch (e) {
      emit(LocalError());
    }
  }

  bool checkId(Box<Product> incomesBox, String id) {
    for (var elem in incomesBox.values) {
      if (elem.id == id) return true;
    }
    return false;
  }

  Future<void> addOrRemoveFromCache(bool remove, String id) async {
    List<String> mortgagesIDS =
        GetIt.I<SharedPreferences>().getStringList('mortgagesIDS') ?? [];
    if (remove) {
      mortgagesIDS.remove(id);
    } else {
      mortgagesIDS.add(id);
    }

    await GetIt.I<SharedPreferences>()
        .setStringList('mortgagesIDS', mortgagesIDS);
  }

  Future<void> _onGetFavouriteMortgages(
      GetFavouritesMortgages event, emit) async {
    emit(LocalLoading());
    late Box<Product> incomesBox;
    if (Hive.isBoxOpen('productItemModels')) {
      incomesBox = Hive.box<Product>('productItemModels');
    } else {
      incomesBox = await Hive.openBox<Product>('productItemModels');
    }

    emit(GetFavouritesLocalMortgagesSuccessfull(
      favouritesMortgages: incomesBox.values.toList(),
    ));
  }

  Future<void> _onDeleteAllProducts(DeleteAllProducts event, emit) async {
    emit(LocalLoading());
    await GetIt.I<SharedPreferences>().setStringList('mortgagesIDS', []);
    await Hive.box<Product>('productItemModels').clear();
    emit(AllProductsRemovedFromFavourites());
  }
}
