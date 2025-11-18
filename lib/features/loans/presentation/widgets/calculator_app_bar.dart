import 'package:auto_route/auto_route.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/theme/app_fonts.dart';
import 'package:fin_uslugi/features/loans/presentation/widgets/button_rounded.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculatorAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String consultantName;
  final TextStyle? style;
  final bool isNeedBackButton;
  final double height;
  final Widget? additionalButton;

  const CalculatorAppBar({
    super.key,
    required this.consultantName,
    this.height = 85,
    this.style,
    this.additionalButton,
    this.isNeedBackButton = true,
  });

  @override
  Size get preferredSize => Size.fromHeight(height.h);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: ColorStyles.violetColor,
          border: Border(
              bottom: BorderSide(
            color: Colors.white10,
          ))),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (isNeedBackButton) ...[
                    InkWell(
                      onTap: () => context.maybePop(),
                      child: ButtonRounded(
                          quarterTurns: 2,
                          color: Colors.white,
                          icon: Assets.icons.arrowRight),
                    ),
                    SizedBox(width: 13.w)
                  ],
                  Text(consultantName, style: style ?? TextStyles.h2),
                ],
              ),
              if (additionalButton != null) additionalButton!
            ],
          ),
        ),
      ),
    );
  }
}
