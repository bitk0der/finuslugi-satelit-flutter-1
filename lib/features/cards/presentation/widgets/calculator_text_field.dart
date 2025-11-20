import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/utils/ui_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculatorTextField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final Color backgroundColor;
  final double titleHorizontalPadding;
  final bool showRange;
  final InputType inputType;
  final int minValue;
  final String minValueSuffix;
  final int maxValue;
  final String maxValueSuffix;
  final String? suffixText;
  final List<TextInputFormatter>? inputFormatter;
  final int? maxLength;
  final Color borderColor;
  final double borderRadius;

  const CalculatorTextField({
    super.key,
    required this.controller,
    required this.title,
    this.backgroundColor = const Color.fromRGBO(0, 0, 0, 0.05),
    this.borderColor = const Color.fromRGBO(0, 0, 0, 0.05),
    this.borderRadius = 4,
    this.titleHorizontalPadding = 0,
    this.showRange = true,
    this.inputType = InputType.withSlider,
    this.minValue = 10000,
    this.minValueSuffix = " ₽",
    this.maxValue = 300000000,
    this.maxValueSuffix = " ₽",
    this.suffixText,
    this.inputFormatter,
    this.maxLength,
  });

  @override
  _CalculatorTextFieldState createState() => _CalculatorTextFieldState();
}

class _CalculatorTextFieldState extends State<CalculatorTextField> {
  List<TextInputFormatter>? _inputFormatter;
  double _sliderValue = 0;

  @override
  void initState() {
    _inputFormatter = widget.inputFormatter ??
        [
          FilteringTextInputFormatter.digitsOnly,
        ];
    if (widget.inputType == InputType.withSlider) {
      if (widget.minValue < 100 && widget.maxValue < 100) {
        _sliderValue = double.parse(widget.controller.text.replaceAll(" ", ""));
      } else {
        double result =
            double.parse(widget.controller.text.replaceAll(" ", "")) -
                widget.minValue;
        if (result <= 200000) {
          result = result / 1000;
        } else if (result > 200000 && result <= 20200000) {
          result = ((result - 200000) / 100000) + 200;
        } else {
          result = ((result - 20200000) / 1000000) + 400;
        }
        _sliderValue = result;
      }
    }
    widget.controller.addListener(() {
      double controllerValue =
          double.tryParse(widget.controller.text.replaceAll(" ", "")) ??
              widget.minValue.toDouble();
      if (controllerValue < widget.minValue) {
        controllerValue = widget.minValue.toDouble();
      }
      if (controllerValue > widget.maxValue) {
        controllerValue = widget.maxValue.toDouble();
      }
      if (widget.inputType == InputType.withSlider) {
        if (widget.minValue < 100 && widget.maxValue < 100) {
          setState(() {
            _sliderValue = controllerValue > widget.maxValue
                ? widget.maxValue.toDouble()
                : controllerValue;
          });
        } else {
          if (controllerValue >= widget.maxValue) {
            setState(() {
              _sliderValue = 660;
            });
          } else {
            double result = controllerValue - widget.minValue;
            if (result < 0) {
              setState(() {
                _sliderValue = 0;
              });
            } else {
              if (result <= 200000) {
                result = result / 1000;
              } else if (result > 200000 && result <= 20200000) {
                result = ((result - 200000) / 100000) + 200;
              } else {
                result = ((result - 20200000) / 1000000) + 400;
              }
              setState(() {
                _sliderValue = result;
              });
            }
          }
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? suffixText = widget.suffixText;
    if (suffixText != null && suffixText == "лет" ||
        suffixText == "год" ||
        suffixText == "года") {
      suffixText = UiUtil.generateYearPlural(_sliderValue.round());
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: widget.titleHorizontalPadding.w),
          child: Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              color: Colors.black.withValues(alpha: 0.8),
            ),
          ),
        ),
        SizedBox(height: 6.h),
        SizedBox(
          height: widget.inputType == InputType.withSlider ? 72.h : 60.h,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: double.maxFinite,
                  height: 60.h,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  decoration: BoxDecoration(
                    color: widget.backgroundColor,
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    border: Border.all(color: widget.borderColor),
                  ),
                  child: Center(
                    child: TextField(
                      controller: widget.controller,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18.sp,
                        color: Colors.black,
                      ),
                      onEditingComplete: () => FocusScope.of(context).unfocus(),
                      maxLength: widget.maxLength,
                      keyboardType: TextInputType.number,
                      inputFormatters: _inputFormatter,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: "",
                        suffixText: suffixText,
                        suffixStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: Colors.black.withValues(alpha: 0.5),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (widget.inputType == InputType.withSlider)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 28.h,
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          trackHeight: 2.h,
                          thumbShape: CustomSliderThumbShape(thumbRadius: 10.h),
                          overlayShape:
                              const RoundSliderOverlayShape(overlayRadius: 0),
                          trackShape: CustomTrackShape(),
                          inactiveTickMarkColor: Colors.transparent,
                          activeTickMarkColor: Colors.transparent,
                          tickMarkShape: const RoundSliderTickMarkShape(
                              tickMarkRadius: 0)),
                      child: Slider(
                        value: _sliderValue,
                        min: widget.minValue > 100 ? 0 : widget.minValue + .0,
                        max: widget.maxValue > 100 ? 660 : widget.maxValue + .0,
                        divisions:
                            widget.maxValue > 100 ? 660 : widget.maxValue,
                        activeColor: ColorStyles.yellowColor,
                        inactiveColor: Colors.transparent,
                        onChanged: (double value) {
                          int result = value.round();
                          if (widget.maxValue > 100) {
                            if (value <= 200) {
                              result = widget.minValue + result * 100;
                            } else if (value > 200 && value <= 400) {
                              result = widget.minValue +
                                  (200 * 100) +
                                  (result - 200) * 10000;
                            } else {
                              result = widget.minValue +
                                  (200 * 100) +
                                  (400) * 10000 +
                                  (result - 400) * 100000;
                              if (result > widget.maxValue) {
                                result = widget.maxValue;
                              }
                            }
                          }
                          widget.controller.text =
                              UiUtil.prepareNumber(result.toString());
                          setState(() => _sliderValue = value);
                        },
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
        // if (widget.inputType == InputType.withSlider) SizedBox(height: 5.h),

        if (widget.inputType == InputType.withSlider && widget.showRange)
          Row(children: [
            Text(
              widget.minValue.toString() + widget.minValueSuffix,
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: ColorStyles.fontColorDarkGrey,
              ),
            ),
            const Spacer(),
            Text(
              UiUtil.prepareNumber(widget.maxValue.toString()) +
                  widget.maxValueSuffix,
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: ColorStyles.fontColorDarkGrey,
              ),
            ),
          ]),
      ],
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
      ..color = ColorStyles.yellowColor
      ..strokeWidth = 6.h
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
