import 'package:fin_uslugi/core/theme/app_font.dart';
import 'package:fin_uslugi/core/widgets/app_button.dart';
import 'package:fin_uslugi/core/widgets/app_card_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/features/coupons/data/models/coupon_item_model.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';

class AlertWidget extends StatelessWidget {
  final CouponItem coupon;
  const AlertWidget({required this.coupon, super.key});

  @override
  Widget build(BuildContext context) {
    return AppCardLayout(
        color: ColorStyles.white,
        padding: EdgeInsets.all(20.w),
        radius: 20.r,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Купон сохранен',
                    style: UIFonts.titleMedium.copyWith(fontSize: 26.sp)),
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Assets.icons.closeIcon.svg())
              ],
            ),
            SizedBox(height: 14.h),
            Text(
                'Мы можем заранее напомнить вам об окончании срока действия купона. Просто добавьте напоминание.',
                style: UIFonts.hint
                    .copyWith(color: ColorStyles.black.withOpacity(0.7))),
            SizedBox(height: 16.h),
            AppButton(
              backgroundColor: ColorStyles.blueButtonColor,
              onTap: () async {
                /*  List notificationsIds =
                    GetStorage().read('notificationsIds') ?? [];
                if (!notificationsIds.contains(coupon.uuid.hashCode)) {
                  notificationsIds.add(coupon.uuid.hashCode);
                  await GetStorage()
                      .write('notificationsIds', notificationsIds);
                }
                await NotificationController.createNotification(coupon); */
                Navigator.pop(context);
              },
              title: 'Добавить напоминание',
            ),
            AppButton(
              backgroundColor: Colors.transparent,
              onTap: () => Navigator.pop(context),
              title: 'Пропустить',
              /* textStyle: UIFonts.titleMedium.copyWith(
                  color: ColorStyles.black.withOpacity(0.4), fontSize: 16.sp), */
            )
          ],
        ));
  }
}
