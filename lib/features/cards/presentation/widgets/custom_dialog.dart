import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class CustomDialog {
  static showCustomDialog(
    BuildContext context, {
    String? title,
    Widget? content,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: ColorStyles.backgroundBottomSheet,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        content: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null) SizedBox(height: 30.h),
              if (title != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
              content ?? SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 60.h,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(12)),
                        color: ColorStyles.greenColor3,
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12)),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(dialogContext);
                          if (onCancel != null) onCancel();
                        },
                        child: Text(
                          cancelText ?? "Отмена",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 60.h,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomRight: Radius.circular(12)),
                        color: ColorStyles.orangeColor,
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(12)),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(dialogContext);
                          if (onConfirm != null) onConfirm();
                        },
                        child: Text(
                          confirmText ?? "Сохранить",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  static Future<void> showBottomSheet({
    required BuildContext context,
    required Widget Function(BuildContext) buildChild,
    required String title,
    BoxConstraints? constraints,
  }) async {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      backgroundColor: ColorStyles.backgroundBottomSheet,
      builder: (dialogContext) {
        final viewInsets = EdgeInsets.fromWindowPadding(
          WidgetsBinding.instance.window.viewInsets,
          WidgetsBinding.instance.window.devicePixelRatio,
        );
        return SingleChildScrollView(
          padding:
              EdgeInsets.fromLTRB(20.w, 20.h, 20.w, viewInsets.bottom + 20.h),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => Navigator.pop(dialogContext),
                    child: Icon(
                      Icons.close,
                      color: Colors.black.withValues(alpha: 0.5),
                      size: 25.h,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              buildChild(dialogContext),
            ],
          ),
        );
      },
    );
  }

  static showErrorMessage(
    BuildContext context,
    String text, {
    String? confirmText,
    VoidCallback? onConfirm,
  }) {
    return showDialog(
        context: context,
        builder: (dialogContext) => AlertDialog(
              contentPadding: EdgeInsets.zero,
              backgroundColor: ColorStyles.backgroundBottomSheet,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Container(
                    height: 60.h,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                      color: ColorStyles.greenColor3,
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(dialogContext);
                        if (onConfirm != null) onConfirm();
                      },
                      child: Text(
                        confirmText ?? "ОК",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ));
  }

  static void show({
    required BuildContext context,
    required String title,
    Widget? widget,
    String? subtitle,
    Color buttonOneColor = ColorStyles.primaryTextColor,
    String buttonOneTitle = 'Да',
    VoidCallback? buttonOneOnTap,
    Color buttonTwoColor = ColorStyles.redButtonColor,
    String buttonTwoTitle = 'Нет',
    VoidCallback? buttonTwoOnTap,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6))),
            backgroundColor: Colors.white,
            content: Container(
              child: Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: TextStyle(
                                fontFamily: 'Circie',
                                fontSize: 18.sp,
                                color: ColorStyles.primaryTextColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          InkWell(
                            child: Icon(
                              Icons.close,
                              size: 24.w,
                              color: ColorStyles.greyTextColor,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                    if (subtitle != null)
                      SizedBox(
                        height: 10.h,
                      ),
                    if (subtitle != null)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          subtitle,
                          style: TextStyle(
                            fontFamily: 'Circie',
                            fontSize: 16.sp,
                            color: ColorStyles.greyTextColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    if (widget != null)
                      SizedBox(
                        height: 10.h,
                      ),
                    if (widget != null) widget,
                    SizedBox(
                      height: 20.h,
                    ),
                    _getButton(
                      onTap: () {
                        Navigator.pop(context);
                        if (buttonOneOnTap != null) buttonOneOnTap();
                      },
                      color: buttonOneColor,
                      text: buttonOneTitle,
                    ),
                    _getButton(
                      onTap: () {
                        if (buttonTwoOnTap != null) buttonTwoOnTap();
                        Navigator.pop(context);
                      },
                      color: buttonTwoColor,
                      text: buttonTwoTitle,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  static Widget _getButton({
    required VoidCallback onTap,
    required Color color,
    required String text,
  }) {
    return SizedBox(
      height: 60.h,
      child: Column(
        children: [
          Container(
            height: 1.h,
            width: double.maxFinite,
            color: ColorStyles.textFieldBorderColor,
          ),
          const Spacer(),
          SizedBox(
            height: 50.h,
            width: double.maxFinite,
            child: TextButton(
              onPressed: onTap,
              style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero)),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: color,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
