import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/debit_card.dart';
import 'package:fin_uslugi/features/cards/data/strings.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/profile_bloc.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/calculator_debit_card_text_field.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:group_button/group_button.dart';

class DebitCardDataBottomSheet extends StatefulWidget {
  final VoidCallback? onTap;

  const DebitCardDataBottomSheet({super.key, this.onTap});

  @override
  State<DebitCardDataBottomSheet> createState() =>
      _DebitCardDataBottomSheetState();
}

class _DebitCardDataBottomSheetState extends State<DebitCardDataBottomSheet> {
  List<String> _selected = [];
  final _spendingController = TextEditingController();
  final _balanceController = TextEditingController();

  final _profileBloc = GetIt.I<ProfileBloc>();

  @override
  void initState() {
    _spendingController.text = _profileBloc.user.debitCard.spending.toString();
    _balanceController.text = _profileBloc.user.debitCard.balance.toString();
    _selected = _profileBloc.user.debitCard.cashbackCategories!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _showCashbackWidget(),
        Text(
          'Среднемесячный остаток на счету, руб.',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 5.h),
        CalculatorDebitCardTextField(
          title: 'Введите остаток по счету',
          controller: _balanceController,
          backgroundColor: Colors.black.withValues(alpha: 0.05),
        ),
        SizedBox(height: 15.h),
        Text(
          'Месячная сумма трат на покупки, ₽',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 6.h),
        CalculatorDebitCardTextField(
          title: 'Введите сумму',
          controller: _spendingController,
          backgroundColor: Colors.black.withValues(alpha: 0.05),
        ),
        if (widget.onTap != null)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: CustomButton(
              onTap: () {
                int spending =
                    int.parse(_spendingController.text.replaceAll(' ', ''));
                int balance =
                    int.parse(_balanceController.text.replaceAll(' ', ''));
                _profileBloc.add(
                  ProfileBlocSaveAndCacheEvent(
                    _profileBloc.user.copyWith(
                      debitCard: DebitCard(
                        spending: spending,
                        balance: balance,
                        cashbackCategories: _selected,
                      ),
                    ),
                  ),
                );
                widget.onTap!();
              },
              color: ColorStyles.yellowColor,
              titleColor: Colors.black,
              title: 'Оформить заявку',
              borderRadius: 100,
            ),
          ),
      ],
    );
  }

  Widget _showCashbackWidget() {
    List<int> initialSelected = [];
    for (var element in _selected) {
      initialSelected.add(Strings.cashbackCategoriesList.indexOf(element));
    }
    final controller = GroupButtonController(selectedIndexes: initialSelected);

    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: GroupButton(
        controller: controller,
        isRadio: false,
        onSelected: (value, index, isSelected) {
          if (isSelected) {
            _selected.add(Strings.cashbackCategoriesList[index]);
          } else {
            _selected.remove(Strings.cashbackCategoriesList[index]);
          }
        },
        buttons: Strings.cashbackCategoriesList,
        buttonBuilder: (isSelected, value, context) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: isSelected
                  ? ColorStyles.orangeColor
                  : Colors.black.withValues(alpha: 0.3),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                value.toString(),
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
