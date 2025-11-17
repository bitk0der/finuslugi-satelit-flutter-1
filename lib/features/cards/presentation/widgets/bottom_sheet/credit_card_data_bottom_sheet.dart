import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/calculator_card_text_field.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreditCardDataBottomSheet extends StatefulWidget {
  final VoidCallback? onTap;

  const CreditCardDataBottomSheet({
    super.key,
    this.onTap,
  });

  @override
  State<CreditCardDataBottomSheet> createState() =>
      _CreditCardDataBottomSheetState();
}

class _CreditCardDataBottomSheetState extends State<CreditCardDataBottomSheet> {
  final _sumController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///сумма
        CalculatorCardTextField(
          controller: _sumController,
          title: "Сумма кредита, руб.",
          minValue: 1000,
          maxValue: 1000000,
          backgroundColor: Colors.black.withOpacity(0.05),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            '1000₽ — 1 000 000₽',
            style: TextStyle(
              color: Colors.black.withOpacity(0.3),
              fontSize: 17.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 40.h),
        if (widget.onTap != null)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: CustomButton(
              onTap: () {
                /* int _credit = int.parse(_sumController.text.replaceAll(' ', '')); */

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
