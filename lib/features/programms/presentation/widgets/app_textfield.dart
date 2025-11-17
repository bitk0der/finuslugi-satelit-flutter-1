import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatefulWidget {
  final String? hintText;
  final List<TextInputFormatter>? textInputFormatters;
  final TextInputType? keyboardType;
  final bool? filled;
  final Color? colorCursor;
  final EdgeInsets? contentPadding;
  final TextAlign? textAlign;
  final bool? readOnly;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Function(String)? onChange;
  final Function(String)? onSubmit;
  final TextStyle? textStyle;
  final double? borderRadius;
  final TextStyle? hintStyle;
  final TextInputAction? textInputAction;

  const AppTextField(
      {this.hintText,
      this.textInputFormatters,
      this.filled,
      this.controller,
      this.keyboardType,
      this.contentPadding,
      this.validator,
      this.onChange,
      this.readOnly,
      this.suffixIcon,
      this.textAlign,
      this.textStyle,
      this.borderRadius,
      this.hintStyle,
      this.colorCursor,
      this.textInputAction,
      this.onSubmit,
      super.key});

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final FocusNode _focusNode = FocusNode();
  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = widget.controller ?? TextEditingController();
    _focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  InputBorder getBorderRadius({bool? isErrorborder}) {
    if (isErrorborder == null) {
      return focusedBorder.copyWith(
          borderRadius: widget.borderRadius != null
              ? BorderRadius.circular(widget.borderRadius!)
              : defaultBorder.borderRadius);
    }
    if (isErrorborder) {
      return errorBorder.copyWith(
          borderRadius: widget.borderRadius != null
              ? BorderRadius.circular(widget.borderRadius!)
              : defaultBorder.borderRadius);
    } else {
      return defaultBorder.copyWith(
          borderRadius: widget.borderRadius != null
              ? BorderRadius.circular(widget.borderRadius!)
              : defaultBorder.borderRadius);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      inputFormatters: widget.textInputFormatters,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      style: widget.textStyle ?? TextStyle(),
      textAlign: widget.textAlign ?? TextAlign.left,
      onChanged: (string) =>
          widget.onChange != null ? widget.onChange!(string) : null,
      onFieldSubmitted: (string) =>
          widget.onSubmit != null ? widget.onSubmit!(string) : null,
      focusNode: _focusNode,
      readOnly: widget.readOnly ?? false,
      cursorColor: widget.colorCursor ?? Theme.of(context).primaryColor,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        filled: widget.filled,
        fillColor: ColorStyles.fillColor,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        suffixIcon: widget.suffixIcon,
        border: getBorderRadius(isErrorborder: false),
        enabledBorder: getBorderRadius(isErrorborder: false),
        focusedBorder: getBorderRadius(),
        errorBorder: getBorderRadius(isErrorborder: true),
        focusedErrorBorder: getBorderRadius(isErrorborder: true),
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 19.h),
      ),
    );
  }
}
