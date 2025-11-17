import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/utils/ui_util.dart';
import 'package:fin_uslugi/core/widgets/app_card_layout.dart';
import 'package:fin_uslugi/features/programms/presentation/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFieldWithSlider extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String? subtitle;
  final FocusNode? focusNode;
  final InputType inputType;
  final int minValue;
  final String? minValueSuffix;
  final int maxValue;
  final String? maxValueSuffix;
  final String? suffixText;
  final List<TextInputFormatter>? inputFormatter;
  final int? maxLength;
  final double borderRadius;
  final Color fillColor;
  final Color? titleColor;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final TextStyle? titleStyle;
  final int? divisions;

  const AppTextFieldWithSlider({
    Key? key,
    required this.controller,
    required this.title,
    this.inputType = InputType.withSlider,
    this.minValue = 10000,
    this.minValueSuffix = " руб",
    this.maxValue = 10000000,
    this.maxValueSuffix = " руб",
    this.suffixText,
    this.inputFormatter,
    this.maxLength,
    this.borderRadius = 0,
    this.focusNode,
    this.subtitle,
    this.fillColor = ColorStyles.fontColorWhite,
    this.titleColor,
    this.hintStyle,
    this.style,
    this.titleStyle,
    this.divisions,
  }) : super(key: key);

  @override
  State<AppTextFieldWithSlider> createState() => _AppTextFieldWithSliderState();
}

class _AppTextFieldWithSliderState extends State<AppTextFieldWithSlider> {
/*   List<TextInputFormatter>? _inputFormatter;

  @override
  void initState() {
    _inputFormatter =
        widget.inputFormatter ?? [FilteringTextInputFormatter.digitsOnly];
    super.initState();
  } */

  @override
  Widget build(BuildContext context) {
/*     String? suffixText = widget.suffixText; */

    return AppCardLayout(
      color: ColorStyles.backgroundColor,
      isNeedShadow: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: widget.titleStyle ?? TextStyle(color: Colors.black54),
          ),
          SizedBox(height: 10.h),
          AppTextField(
            controller: widget.controller,
            filled: true,
            textInputFormatters: widget.inputFormatter,
            borderRadius: 12,
            onChange: (p0) {
              final value =
                  double.tryParse(widget.controller.text.replaceAll(" ", "")) ??
                      widget.minValue.toDouble();
              if (value > widget.maxValue) {
                widget.controller.text = widget.maxValue.toString();
              }
              if (value < widget.minValue) {
                widget.controller.text = widget.minValue.toString();
              }
            },
            contentPadding: EdgeInsets.all(14.w),
            keyboardType: TextInputType.number,
            hintStyle: widget.hintStyle,
          ),
          SizedBox(height: 10.h),
          if (widget.inputType == InputType.withSlider)
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 6.h,
                thumbShape: CustomSliderThumbShape(thumbRadius: 10.r),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 0),
                trackShape: CustomTrackShape(),
                inactiveTickMarkColor: Colors.transparent,
                activeTickMarkColor: Colors.transparent,
                tickMarkShape:
                    const RoundSliderTickMarkShape(tickMarkRadius: 0),
              ),
              child: AnimatedBuilder(
                animation: widget.controller,
                builder: (context, _) {
                  final value = int.tryParse(
                          widget.controller.text.replaceAll(" ", "")) ??
                      widget.minValue.toDouble();
                  return Slider(
                    value: value < widget.minValue
                        ? widget.minValue + .0
                        : value > widget.maxValue
                            ? widget.maxValue + .0
                            : value + .0,
                    min: widget.minValue + .0,
                    max: widget.maxValue + .0,
                    divisions: widget.divisions ??
                        (widget.maxValue - widget.minValue) ~/ 10,
                    activeColor: ColorStyles.greenSlider,
                    inactiveColor: ColorStyles.backgroundSlider,
                    onChanged: (double value) {
                      int result = value.round();
                      widget.controller.text =
                          UiUtil.prepareNumber(result.toString());
                    },
                  );
                },
              ),
            ),
          if (widget.subtitle != null) ...[
            SizedBox(height: 12.h),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                widget.subtitle!,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class CustomSliderThumbShape extends SliderComponentShape {
  final double thumbRadius;

  const CustomSliderThumbShape({
    this.thumbRadius = 6.0,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double>? activationAnimation,
    Animation<double>? enableAnimation,
    bool? isDiscrete,
    TextPainter? labelPainter,
    RenderBox? parentBox,
    SliderThemeData? sliderTheme,
    TextDirection? textDirection,
    double? value,
    double? textScaleFactor,
    Size? sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final rect = Rect.fromCircle(center: center, radius: thumbRadius);

    final rrect = RRect.fromRectAndRadius(
      Rect.fromPoints(
        Offset(rect.left, rect.top),
        Offset(rect.right, rect.bottom),
      ),
      Radius.circular(thumbRadius),
    );

    final fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = ColorStyles.greenSlider
      ..strokeWidth = 4.h
      ..style = PaintingStyle.stroke;

    canvas.drawRRect(rrect, fillPaint);
    canvas.drawRRect(rrect, borderPaint);
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

enum InputType {
  withSlider,
  withoutSlider,
}
