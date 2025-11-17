import 'package:auto_route/auto_route.dart';
import 'package:fin_uslugi/core/utils/ui_util.dart';
import 'package:fin_uslugi/core/widgets/app_text_field_with_slider.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/credit_card_search_bloc.dart';
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
class CreditCardsFiltersScreen extends StatefulWidget {
  const CreditCardsFiltersScreen({super.key});

  @override
  State<CreditCardsFiltersScreen> createState() =>
      _CreditCardsFiltersScreenState();
}

class _CreditCardsFiltersScreenState extends State<CreditCardsFiltersScreen> {
  final _sumController = TextEditingController(text: '1000');
  final _focus = FocusNode();

  final List<String> _termsLabels =
      UiUtil.benefits.map((item) => item['label'] as String).toList();
  final List<String> _termsValues =
      UiUtil.benefits.map((item) => item['value'] as String).toList();
  /* List<String> bankNames =
      GetIt.I<BanksCubit>().banks.map((item) => item.bankName).toList(); */

  final _controller = _DepositController();
  final _creditCardSearchBloc = GetIt.I<CreditCardSearchBloc>();
  final _filtersBloc = GetIt.I<FiltersBloc>();
  final _prefs = GetIt.I<SharedPreferences>();
/*   final _banksCubit = GetIt.I<BanksCubit>(); */

  @override
  void initState() {
    fillFilters();
    super.initState();
  }

  resetFilters() {
    _sumController.text = '1000';
    _controller.changeTerm([]);
    _controller.changeBank([]);
  }

  fillFilters() {
    var queryList = _prefs.getStringList('creditCardsSettings') ?? [];
    if (queryList.isEmpty) return;
    for (var i = 0; i < queryList.length; i++) {
      if (queryList[i].isEmpty) continue;
      if (i == 0) {
        _sumController.text = queryList[i];
      } else if (i == 1) {
        namesSearch(queryList[i].split(','), UiUtil.benefits);
      } else {
        idsSearch(queryList[i].split(','));
      }
    }
  }

  namesSearch(List<String> idsnamesSearchString,
      List<Map<String, dynamic>> initMassive) {
    _controller.changeTerm(initMassive
        .asMap()
        .entries
        .where((entry) => idsnamesSearchString.contains(entry.value['value']))
        .map((entry) => entry.key)
        .toList());
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
            await _prefs.setStringList('creditCardsSettings', []);
            resetFilters();
            _filtersBloc.add(ChangeFilters());
            _creditCardSearchBloc.add(CreditCardSearchBlocSearchEvent(page: 1));
          }),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppTextFieldWithSlider(
                controller: _sumController,
                focusNode: _focus,
                title: "Кредитный лимит до, ₽:",
                inputFormatter: [LongNumberTextFormatter()],
                minValue: 1000,
                maxValue: 1500000,
                maxValueSuffix: null,
                minValueSuffix: null,
                divisions: 1000,
                maxLength: 11,
                borderRadius: 12,
              ),
              SizedBox(height: 12.h),
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
            await _prefs.setStringList('creditCardsSettings', [
              _sumController.text.replaceAll(' ', '') == '1000'
                  ? ''
                  : _sumController.text,
              _controller.term.map((index) => _termsValues[index]).join(","),
              /*  _controller.bank
                  .map((index) => _banksCubit.banks[index].id)
                  .join(",") */
            ]);
            _creditCardSearchBloc.add(CreditCardSearchBlocSearchEvent(page: 1));

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

  List<int> get term => _selectedTerm;

  List<int> get bank => _selectedBank;

  void changeTerm(List<int> value) {
    _selectedTerm = value;
    notifyListeners();
  }

  void changeBank(List<int> value) {
    _selectedBank = value;
    notifyListeners();
  }
}
