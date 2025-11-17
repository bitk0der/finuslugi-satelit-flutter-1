import 'package:auto_route/auto_route.dart';
import 'package:fin_uslugi/core/utils/ui_util.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/debit_card_search_bloc.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/filters_bloc.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/filters/widgets/income_bottom_sheet.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/filters/widgets/income_select_item_body.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/filters/widgets/income_selected_button.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/custom_app_bar.dart';
import 'package:fin_uslugi/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class DebitCardsFiltersScreen extends StatefulWidget {
  const DebitCardsFiltersScreen({super.key});

  @override
  State<DebitCardsFiltersScreen> createState() =>
      DebitCardsFiltersScreenState();
}

class DebitCardsFiltersScreenState extends State<DebitCardsFiltersScreen> {
  final List<String> _featuresLabels =
      UiUtil.features.map((item) => item['label'] as String).toList();
  final List<String> _termsLabels =
      UiUtil.benefits.map((item) => item['label'] as String).toList();

  final List<String> _featuresValues =
      UiUtil.features.map((item) => item['value'] as String).toList();
  final List<String> _termsValues =
      UiUtil.benefits.map((item) => item['value'] as String).toList();

  final _controller = _DepositController();

  final _debitCardSearchBloc = GetIt.I<DebitCardSearchBloc>();
  final _filtersBloc = GetIt.I<FiltersBloc>();
  final _prefs = GetIt.I<SharedPreferences>();

  @override
  void initState() {
    fillFilters();
    super.initState();
  }

  resetFilters() {
    _controller.changeTerm([]);
    _controller.changeFeatures([]);
    _controller.changeBank([]);
  }

  fillFilters() {
    var queryList = _prefs.getStringList('debitCardsSettings') ?? [];
    if (queryList.isEmpty) return;
    for (var i = 0; i < queryList.length; i++) {
      if (queryList[i].isEmpty) continue;
      if (i == 0) {
        namesSearch(queryList[i].split(','), UiUtil.benefits);
      } else if (i == 1) {
        namesSearch(queryList[i].split(','), UiUtil.features, false);
      } else {
        idsSearch(queryList[i].split(','));
      }
    }
  }

  namesSearch(
      List<String> idsnamesSearchString, List<Map<String, dynamic>> initMassive,
      [bool first = true]) {
    var list = initMassive
        .asMap()
        .entries
        .where((entry) => idsnamesSearchString.contains(entry.value['value']))
        .map((entry) => entry.key)
        .toList();
    if (first) {
      _controller.changeTerm(list);
    } else {
      _controller.changeFeatures(list);
    }
  }

  idsSearch(List<String> idsString) {
    /*  _controller.changeBank(_banksCubit.banks
        .asMap()
        .entries
        .where((entry) => idsString.contains(entry.value.id.toString()))
        .map((entry) => entry.key)
        .toList()); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getFavourites(
          title: 'Фильтр',
          context: context,
          onClearTap: () async {
            await _prefs.setStringList('debitCardsSettings', []);
            resetFilters();
            _filtersBloc.add(ChangeFilters());
            _debitCardSearchBloc.add(DebitCardSearchBlocSearchEvent(page: 1));
          }),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (_, __) {
                  return IncomeSelectedButton(
                    _controller.term
                        .map((index) => _termsLabels[index])
                        .join(", "),
                    title: 'Бонусы',
                    onTap: () => IncomeBottomSheet.show(
                      title: 'Бонусы',
                      context: context,
                      bodyBuilder: (context) => IncomeSelectItemBody(
                        itemsList: _termsLabels,
                        onChange: (value) => _controller.changeTerm(value),
                        selectedItem: _controller.term,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 12.h),
              AnimatedBuilder(
                animation: _controller,
                builder: (_, __) {
                  return IncomeSelectedButton(
                    _controller.features
                        .map((index) => _featuresLabels[index])
                        .join(", "),
                    title: 'Особенности',
                    onTap: () => IncomeBottomSheet.show(
                      title: 'Особенности',
                      context: context,
                      bodyBuilder: (context) => IncomeSelectItemBody(
                        itemsList: _featuresLabels,
                        onChange: (value) => _controller.changeFeatures(value),
                        selectedItem: _controller.features,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 12.h),
              /*    AnimatedBuilder(
                animation: _controller,
                builder: (_, __) {
                  return IncomeSelectedButtonBank(
                    _controller.bank
                        .map((index) =>
                            GetIt.I<BanksCubit>().banks[index].bankName)
                        .toList(),
                    title: 'Отображать банки:',
                    onTap: () => IncomeBottomSheet.show(
                      title: 'Отображать банки:',
                      context: context,
                      bodyBuilder: (context) => IncomeSelectItemBody(
                        itemsList: bankNames,
                        onChange: (value) => _controller.changeBank(value),
                        selectedItem: _controller.bank,
                      ),
                    ),
                  );
                },
              ), */
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: AppButton(
          onTap: () async {
            await _prefs.setStringList('debitCardsSettings', [
              _controller.term.map((index) => _termsValues[index]).join(","),
              _controller.features
                  .map((index) => _featuresValues[index])
                  .join(","),
              /* _controller.bank
                  .map((index) => _banksCubit.banks[index].id)
                  .join(",") */
            ]);
            _debitCardSearchBloc.add(DebitCardSearchBlocSearchEvent(page: 1));
            _filtersBloc.add(ChangeFilters());
            if (mounted) {
              Navigator.pop(context);
            }
          },
          title: 'Применить',
        ),
      ),
    );
  }
}

class _DepositController extends ChangeNotifier {
  List<int> _selectedTerm = [];
  List<int> _selectedBank = [];
  List<int> _selectedFeatures = [];

  List<int> get term => _selectedTerm;

  List<int> get bank => _selectedBank;

  List<int> get features => _selectedFeatures;

  void changeFeatures(List<int> value) {
    _selectedFeatures = value;
    notifyListeners();
  }

  void changeTerm(List<int> value) {
    _selectedTerm = value;
    notifyListeners();
  }

  void changeBank(List<int> value) {
    _selectedBank = value;
    notifyListeners();
  }
}
