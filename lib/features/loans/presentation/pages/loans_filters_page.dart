import 'package:auto_route/auto_route.dart';
import 'package:fin_uslugi/features/loans/presentation/theme/calculator_colors.dart';
import 'package:fin_uslugi/features/loans/presentation/widgets/calculator_app_bar.dart';
import 'package:fin_uslugi/features/loans/presentation/widgets/sum_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/theme/app_fonts.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/credit_search_bloc.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class LoansFiltersPage extends StatefulWidget {
  const LoansFiltersPage({super.key});

  @override
  State<LoansFiltersPage> createState() => _LoansFiltersPageState();
}

class _LoansFiltersPageState extends State<LoansFiltersPage> {
  final _sumController = LoanController();
  final _termController = LoanController();
  final _sharedPreferences = GetIt.I<SharedPreferences>();
  late CreditSearchBloc creditSearchBloc;
  @override
  void initState() {
    List<String> filters =
        _sharedPreferences.getStringList('loanSettings') ?? [];
    if (filters.isEmpty) {
      reset();
    } else {
      _sumController.set(double.tryParse(filters[0]) ?? 0.0);
    }

    creditSearchBloc = GetIt.I<CreditSearchBloc>();
    super.initState();
  }

  reset() {
    _sumController.set(50000);
    _termController.set(0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: CalculatorColors.gradient,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: CalculatorAppBar(
              consultantName: 'Фильтры',
              additionalButton: InkWell(
                  onTap: () async {
                    reset();
                    await _sharedPreferences.setStringList('loanSettings', []);
                    setState(() {});
                  },
                  child: Text('Сбросить',
                      style: TextStyles.h2
                          .copyWith(color: Colors.white60, fontSize: 17.sp))),
            ),
            body: Column(
              children: [
                SumWidget(_sumController, title: 'Сумма займа, до, ₽:'),
                /* TermWidget(_termController, title: 'Срок, до:'), */
                const Spacer(),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                  child: CustomButton(
                    height: 44.h,
                    color: ColorStyles.green,
                    borderRadius: 10,
                    /*    shadow: [
                      BoxShadow(
                          color: ColorStyles.green.withValues(alpha:0.4),
                          blurRadius: 20)
                    ], */
                    titleColor: Colors.black,
                    title: "Применить",
                    onTap: () async {
                      final prefs = GetIt.I<SharedPreferences>();
                      await prefs.setStringList(
                          'loanSettings', [_sumController.get().toString()]);
                      creditSearchBloc.add(
                        CreditSearchBlocSearchEvent(page: 1, query: ''),
                      );

                      if (mounted) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
              ],
            )));
  }
}

class LoanController extends ChangeNotifier {
  double _value = 0;

  double get() => _value;

  void set(double value) {
    _value = value;
    notifyListeners();
  }
}
