import 'package:fin_uslugi/core/widgets/app_text_field_with_slider.dart';
import 'package:fin_uslugi/features/loans/presentation/pages/loans_filters_page.dart';
import 'package:fin_uslugi/features/loans/presentation/theme/calculator_ui_util.dart';
import 'package:flutter/material.dart';

class SumWidget extends StatefulWidget {
  final LoanController controller;
  final String title;
  const SumWidget(this.controller,
      {super.key, this.title = "Сумма займа, руб."});

  @override
  State<SumWidget> createState() => _SumWidgetState();
}

class _SumWidgetState extends State<SumWidget> {
  final _sumController = TextEditingController();

  @override
  void initState() {
    _sumController.text = CalculatorUiUtil.prepareNumber(
      widget.controller.get().toInt().toString(),
    );

    _sumController.addListener(() {
      if (_sumController.text.isNotEmpty) {
        widget.controller
            .set(double.parse(_sumController.text.replaceAll(' ', '')));
      } else {
        widget.controller.set(3000);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _sumController.text = widget.controller.get().toInt().toString();

    return AppTextFieldWithSlider(
      controller: _sumController,
      title: widget.title,
      inputFormatter: [LongNumberTextFormatter()],
      minValue: 3000,
      maxValue: 100000,
      maxLength: 11,
      borderRadius: 12,
    );
  }
}
