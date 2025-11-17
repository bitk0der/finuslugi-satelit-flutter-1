import 'package:fin_uslugi/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppErrorWidget extends StatelessWidget {
  final Function() onTap;
  const AppErrorWidget({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Произошла ошибка, проверьте соединение с интернетом или попробуйте позже...',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 20.h),
            AppButton(onTap: onTap, title: 'Обновить страницу')
          ],
        ),
      ),
    );
  }
}
