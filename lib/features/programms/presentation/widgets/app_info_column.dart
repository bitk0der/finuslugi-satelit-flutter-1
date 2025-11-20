import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInfoColumn extends StatelessWidget {
  final String title;
  final String value;
  final bool isComparison;
  const AppInfoColumn(
      {required this.title,
      this.isComparison = false,
      required this.value,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: isComparison ? 240.w : null,
          child: Text(title,
              style: TextStyle(
                  color: Colors.black.withValues(alpha: 0.6), fontSize: 14)),
        ),
        SizedBox(height: 6.h),
        SizedBox(
            width: isComparison ? 240.w : null,
            child: RichText(
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text: value.split('>')[0].isEmpty
                    ? 'Нет данных'
                    : value.split('>')[0],
                style: const TextStyle(color: Colors.black, fontSize: 14),
                children: <TextSpan>[
                  value.split('>').length == 1
                      ? const TextSpan()
                      : TextSpan(
                          text: '>' * value.split('>').length,
                          style: const TextStyle(color: Colors.transparent)),
                ],
              ),
            )),
      ],
    );
  }
}
