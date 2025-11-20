import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/utils/ui_util.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/credit.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/profile_bloc.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/calculator_text_field.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class CreditDataBottomSheet extends StatefulWidget {
  final VoidCallback? onTap;

  const CreditDataBottomSheet({
    super.key,
    this.onTap,
  });

  @override
  State<CreditDataBottomSheet> createState() => _CreditDataBottomSheetState();
}

class _CreditDataBottomSheetState extends State<CreditDataBottomSheet> {
  final _sumController = TextEditingController();
  final _termController = TextEditingController();

  final _profileBloc = GetIt.I<ProfileBloc>();

  @override
  void initState() {
    _sumController.text = (_profileBloc.user.credit.sum ?? 0).toString();
    _termController.text = _profileBloc.user.credit.term != null
        ? (_profileBloc.user.credit.term!).toString()
        : '1';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///сумма
        CalculatorTextField(
          controller: _sumController,
          backgroundColor: Colors.black.withValues(alpha: 0.05),
          title: "Сумма кредита, руб.",
          minValue: 0,
          maxValue: 30000000,
          showRange: false,
          borderColor: Colors.black.withValues(alpha: 0.05),
          borderRadius: 8,
          inputFormatter: [LongNumberTextFormatter()],
          maxLength: 10,
        ),
        Text(
          '0₽ — 30 000 000₽',
          style: TextStyle(
            color: Colors.black.withValues(alpha: 0.3),
            fontSize: 17.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 30.h),

        ///срок
        CalculatorTextField(
          controller: _termController,
          backgroundColor: Colors.black.withValues(alpha: 0.05),
          title: "Срок кредита, лет",
          minValue: 1,
          maxValue: 30,
          minValueSuffix: " год",
          maxValueSuffix: " лет",
          suffixText: "лет",
          maxLength: 2,
          borderRadius: 8,
          borderColor: Colors.black.withValues(alpha: 0.05),
          showRange: false,
        ),
        Text(
          '1 год — 30 лет',
          style: TextStyle(
            color: Colors.black.withValues(alpha: 0.3),
            fontSize: 17.sp,
            fontWeight: FontWeight.w400,
          ),
        ),

        if (widget.onTap != null)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: CustomButton(
              onTap: () {
                int credit = int.parse(_sumController.text.replaceAll(' ', ''));
                int term = int.parse(_termController.text);

                _profileBloc.add(
                  ProfileBlocSaveAndCacheEvent(
                    _profileBloc.user
                        .copyWith(credit: Credit(sum: credit, term: term)),
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
}
