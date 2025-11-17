import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteCard extends StatelessWidget {
  final String title;
  final SvgGenImage icon;
  final List<Color> colors;
  const FavouriteCard(
      {super.key,
      required this.title,
      required this.icon,
      required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
          color: colors[0], borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon.svg(
              colorFilter: ColorFilter.mode(colors[1], BlendMode.srcIn),
              width: 18.w,
              height: 18.w),
          SizedBox(width: 8.w),
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          )
        ],
      ),
    );
  }
}
