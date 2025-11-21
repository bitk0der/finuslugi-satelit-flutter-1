import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'local_comparison_mortgage_event.dart';
part 'local_comparison_mortgage_state.dart';

class LocalComparisonMortgageBloc
    extends Bloc<LocalMortgageComparisonEvent, LocalMortgageComparisonState> {
  LocalComparisonMortgageBloc()
      : super(LocalMortgageComparisonBlocStateInitial()) {
    on<AddMortgageToComparison>(_onAddMortgageToComparison);
    on<GetComparisonMortgages>(_onGetComparisonMortgages);
    on<DeleteMortgageFromComparison>(_onDeleteMortgageFromComparison);
    on<AllProductsDelete>(_onDeleteAllProductsFromComparison);
  }
  final prefs = GetIt.I<SharedPreferences>();
  _onAddMortgageToComparison(AddMortgageToComparison event, emit) async {
    try {
      final comparisonMortgages =
          await Hive.openBox<Product>('comparisonMortgages');
      if (!checkId(comparisonMortgages, event.productItemModel.id)) {
        await comparisonMortgages.add(event.productItemModel);
        addOrRemoveFromCache(false, event.productItemModel.id.toString());
      } else {
        var key = comparisonMortgages
            .toMap()
            .entries
            .firstWhere(
                (element) => element.value.id == event.productItemModel.id)
            .key;
        await comparisonMortgages.delete(key);
        addOrRemoveFromCache(true, event.productItemModel.id.toString());
      }
      emit(MortgageSuccessfullyDeletedFromComparison());
    } catch (e) {
      emit(LocalComparisonError());
    }
  }

  bool checkId(Box<Product> incomesBox, String id) {
    for (var elem in incomesBox.values) {
      if (elem.id == id) return true;
    }
    return false;
  }

  _onDeleteMortgageFromComparison(
      DeleteMortgageFromComparison event, emit) async {
    try {
      final comparisonMortgages =
          await Hive.openBox<Product>('comparisonMortgages');
      var key = comparisonMortgages
          .toMap()
          .entries
          .firstWhere(
              (element) => element.value.id == event.productItemModel.id)
          .key;
      await comparisonMortgages.delete(key);
      addOrRemoveFromCache(true, event.productItemModel.id.toString());
      emit(MortgageSuccessfullyDeletedFromComparison());
    } catch (e) {
      emit(LocalComparisonError());
    }
  }

  addOrRemoveFromCache(bool remove, String id) async {
    List<String> comparisonIDS = prefs.getStringList('comparisonIDS') ?? [];
    if (remove) {
      comparisonIDS.remove(id);
    } else {
      comparisonIDS.add(id);
    }

    await prefs.setStringList('comparisonIDS', comparisonIDS);
  }

  _onGetComparisonMortgages(GetComparisonMortgages event, emit) async {
    emit(LocalComparisonLoading());
    final comparisonMortgages =
        await Hive.openBox<Product>('comparisonMortgages');
    emit(GetFavouritesMortgagesSuccessfull(
      favouritesMortgages: comparisonMortgages.values.toList(),
    ));
  }

  _onDeleteAllProductsFromComparison(AllProductsDelete event, emit) async {
    emit(LocalComparisonLoading());
    await GetIt.I<SharedPreferences>().setStringList('comparisonIDS', []);
    await Hive.box<Product>('comparisonMortgages').clear();
    emit(AllProductsSucessfullyDeleted());
  }
}
