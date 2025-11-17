import 'package:fin_uslugi/core/widgets/app_card_layout.dart';
import 'package:fin_uslugi/features/programms/presentation/widgets/app_info_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  const InfoCard({required this.title, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: AppCardLayout(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: AppInfoColumn(
              title: title,
              value: value,
            )),
      ),
    );
  }
}
