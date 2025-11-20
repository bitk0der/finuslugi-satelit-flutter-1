import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/utils/ui_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculatorDebitCardTextField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final int minValue;
  final int maxValue;
  final Color backgroundColor;

  const CalculatorDebitCardTextField({
    super.key,
    required this.controller,
    required this.title,
    this.backgroundColor = const Color.fromRGBO(0, 0, 0, 0.05),
    this.minValue = 0,
    this.maxValue = 500000,
  });

  @override
  _CalculatorDebitCardTextFieldState createState() =>
      _CalculatorDebitCardTextFieldState();
}

class _CalculatorDebitCardTextFieldState
    extends State<CalculatorDebitCardTextField> {
  late double _sliderValue;

  @override
  void initState() {
    _sliderValue =
        double.tryParse(widget.controller.text.replaceAll(' ', '')) ?? 0;
    if (_sliderValue < widget.minValue) {
      _sliderValue = widget.minValue + .0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
            color: Colors.black.withValues(alpha: 0.8),
          ),
        ),
        SizedBox(height: 6.h),
        SizedBox(
          height: 72.h,
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
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: Colors.black.withValues(alpha: 0.5)),
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
                      maxLength: 9,
                      keyboardType: TextInputType.number,
                      inputFormatters: [LongNumberTextFormatter()],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: "",
                        suffixStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: ColorStyles.primaryFontColor
                              .withValues(alpha: 0.8),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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
                      tickMarkShape:
                          const RoundSliderTickMarkShape(tickMarkRadius: 0),
                    ),
                    child: Slider(
                      value: _sliderValue,
                      min: widget.minValue + .0,
                      max: widget.maxValue + .0,
                      divisions: 1000,
                      activeColor: ColorStyles.yellowColor,
                      inactiveColor: Colors.transparent,
                      onChanged: (double value) {
                        final result = value - value % 1000;
                        widget.controller.text =
                            UiUtil.prepareNumber(result.round().toString());
                        setState(() => _sliderValue = result);
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CustomSliderThumbShape extends SliderComponentShape {
  final double thumbRadius;

  const CustomSliderThumbShape({this.thumbRadius = 6.0});

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
