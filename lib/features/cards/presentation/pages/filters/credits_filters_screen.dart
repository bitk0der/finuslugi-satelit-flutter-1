import 'package:auto_route/auto_route.dart';
import 'package:fin_uslugi/core/utils/ui_util.dart';
import 'package:fin_uslugi/core/widgets/app_button.dart';
import 'package:fin_uslugi/core/widgets/app_text_field_with_slider.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/credit_search_bloc.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/filters_bloc.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class CreditsFiltersScreen extends StatefulWidget {
  final String? cacheString;
  final VoidCallback? onSave;
  const CreditsFiltersScreen({super.key, this.cacheString, this.onSave});

  @override
  State<CreditsFiltersScreen> createState() => CreditsFiltersScreenState();
}

class CreditsFiltersScreenState extends State<CreditsFiltersScreen> {
  final _sumController = TextEditingController(text: '1000');
  final _sumController2 = TextEditingController(text: '4');
  final _focus = FocusNode();
  final _controller = _DepositController();
  final _filtersBloc = GetIt.I<FiltersBloc>();
  final _prefs = GetIt.I<SharedPreferences>();
/*  */
  final _creditsBloc = GetIt.I<CreditSearchBloc>();
  @override
  void initState() {
    fillFilters();
    super.initState();
  }

  fillFilters() {
    var queryList =
        _prefs.getStringList(widget.cacheString ?? 'creditsSettings') ?? [];
    if (queryList.isEmpty) return;
    for (var i = 0; i < queryList.length; i++) {
      if (queryList[i].isEmpty) continue;
      if (i == 0) {
        _sumController.text = queryList[i];
      } else if (i == 1) {
        _sumController2.text = queryList[i];
      } else {
        idsSearch(queryList[i].split(','));
      }
    }
  }

  idsSearch(List<String> idsString) {
/*     _controller.changeBank(_banksCubit.banks
        .asMap()
        .entries
        .where((entry) => idsString.contains(entry.value.id.toString()))
        .map((entry) => entry.key)
        .toList()); */
  }

  resetFilters() {
    _sumController.text = '1000';
    _sumController2.text = '7';
    _controller.changeBank([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getFavourites(
          title: 'Фильтр',
          context: context,
          onClearTap: () async {
            await _prefs
                .setStringList(widget.cacheString ?? 'creditsSettings', []);
            resetFilters();
            _filtersBloc.add(ChangeFilters());
            _creditsBloc.add(CreditSearchBlocSearchEvent(page: 1));
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
                title: "Сумма кредита до, ₽",
                inputFormatter: [LongNumberTextFormatter()],
                minValue: 1000,
                maxValue: 50000000,
                maxValueSuffix: null,
                minValueSuffix: null,
                divisions: 1000,
                maxLength: 11,
                borderRadius: 12,
              ),
              SizedBox(height: 12.h),
              AppTextFieldWithSlider(
                controller: _sumController2,
                focusNode: _focus,
                title: "Срок до, месяцев",
                inputFormatter: [LongNumberTextFormatter()],
                minValue: 1,
                maxValue: 60,
                maxValueSuffix: null,
                minValueSuffix: null,
                divisions: 1000,
                maxLength: 11,
                borderRadius: 12,
              ),
              SizedBox(height: 12.h),
              /*   AnimatedBuilder(
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
            await _prefs
                .setStringList(widget.cacheString ?? 'creditsSettings', [
              _sumController.text.replaceAll(' ', '') == '1000'
                  ? ''
                  : _sumController.text,
              _sumController2.text.replaceAll(' ', '') == '7'
                  ? ''
                  : _sumController2.text,
              /*  _controller.bank
                  .map((index) => _banksCubit.banks[index].id)
                  .join(",") */
            ]);
            if (widget.onSave == null) {
              _creditsBloc.add(CreditSearchBlocSearchEvent(page: 1));
            } else {
              widget.onSave!();
            }

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
