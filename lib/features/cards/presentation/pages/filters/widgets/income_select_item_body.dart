import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncomeSelectItemBody extends StatefulWidget {
  final List<String> itemsList;
  final Function(List<int>) onChange;
  final List<int> selectedItem;

  const IncomeSelectItemBody({
    Key? key,
    required this.itemsList,
    required this.onChange,
    required this.selectedItem,
  }) : super(key: key);

  @override
  State<IncomeSelectItemBody> createState() => _IncomeSelectItemBodyState();
}

class _IncomeSelectItemBodyState extends State<IncomeSelectItemBody> {
  List<int> selectedItems = [];

  @override
  void initState() {
    selectedItems.addAll(widget.selectedItem);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        ...List.generate(
          widget.itemsList.length,
          (index) => _SelectButton(
            title: widget.itemsList[index],
            isSelected: selectedItems.contains(index),
            onTap: () {
              widget.onChange(selectedItems);
              if (!selectedItems.contains(index)) {
                selectedItems.add(index);
              } else {
                selectedItems.removeWhere((e) => e == index);
              }

              setState(() {});
            },
          ),
        ),
        SizedBox(height: 30.h),
        AppButton(
          title: 'Применить',
          titleColor: Colors.black,
          backgroundColor: ColorStyles.yellowLight,
          onTap: () => Navigator.pop(context),
        ),
      ],
    );
  }
}

class _SelectButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _SelectButton({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 56.h,
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: isSelected
            ? Border.all(color: ColorStyles.activeNavBarItemColor)
            : null,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: Offset(0, 0))
        ],
      ),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              width: 24.r,
              height: 24.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: isSelected
                      ? ColorStyles.secondaryBlue
                      : ColorStyles.inactiveNavBarItemColor,
                ),
                color: Colors.transparent,
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10.r,
                        height: 10.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: ColorStyles.secondaryBlue,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
