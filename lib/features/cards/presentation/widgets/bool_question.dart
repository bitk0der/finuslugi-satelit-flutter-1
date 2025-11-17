import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoolQuestion extends StatefulWidget {
  final String title;
  final String trueAnswer;
  final String falseAnswer;
  final Function(bool) answer;
  final bool isRow;

  const BoolQuestion({
    super.key,
    this.isRow = true,
    required this.title,
    required this.trueAnswer,
    required this.falseAnswer,
    required this.answer,
  });

  @override
  State<BoolQuestion> createState() => _BoolQuestionState();
}

class _BoolQuestionState extends State<BoolQuestion> {
  bool answer = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: Text(
            widget.title,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: ColorStyles.primaryFontColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        widget.isRow
            ? Row(
                children: [
                  Expanded(
                    child: _SelectButton(
                      answer == true,
                      text: widget.trueAnswer,
                      onTap: () {
                        setState(() => answer = true);
                        widget.answer(answer);
                      },
                    ),
                  ),
                  Expanded(
                    child: _SelectButton(
                      answer == false,
                      text: widget.falseAnswer,
                      onTap: () {
                        setState(() => answer = false);
                        widget.answer(answer);
                      },
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  _SelectButton(
                    answer == true,
                    text: widget.trueAnswer,
                    onTap: () {
                      setState(() => answer = true);
                      widget.answer(answer);
                    },
                  ),
                  SizedBox(height: 4.h),
                  _SelectButton(
                    answer == false,
                    text: widget.falseAnswer,
                    onTap: () {
                      setState(() => answer = false);
                      widget.answer(answer);
                    },
                  ),
                ],
              ),
      ],
    );
  }
}

class _SelectButton extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTap;
  final String text;

  const _SelectButton(
    this.isActive, {
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Row(
        children: [
          SizedBox(
            width: 60.w,
            height: 46.h,
            child: Center(
              child: Container(
                width: 24.r,
                height: 24.r,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: isActive
                        ? ColorStyles.blueButtonColor
                        : Colors.black.withOpacity(0.8),
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: isActive
                    ? Center(
                        child: Container(
                          width: 12.r,
                          height: 12.r,
                          decoration: BoxDecoration(
                            color: ColorStyles.blueButtonColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: Text(
                text,
                style: TextStyle(
                  color: ColorStyles.primaryTextColor,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
