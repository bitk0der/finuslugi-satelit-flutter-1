import 'package:auto_route/auto_route.dart';
import 'package:fin_uslugi/core/routes/app_router.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/widgets/app_circle_button.dart';
import 'package:fin_uslugi/features/local_notifications/presentation/bloc/notification_bloc.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationButton extends StatefulWidget {
  const NotificationButton({super.key});

  @override
  State<NotificationButton> createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: GetIt.I<LocalNotificationBloc>(),
        builder: (context, state) {
          List<String> productsIds = GetIt.I<SharedPreferences>()
                  .getStringList('local_notifications') ??
              [];
          return Stack(children: [
            AppCircleButton(
              icon: Assets.icons.bell,
              backgroundColor: Colors.white10,
              onTap: () =>
                  context.router.navigate(BackgroundNotificationsRoute()),
            ),
            if (productsIds.isNotEmpty)
              Positioned(
                right: 0,
                child: Container(
                  width: 18.w,
                  height: 18.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: ColorStyles.grayBorder),
                      color: ColorStyles.red),
                  child: Text(
                    productsIds.length.toString(),
                    style: const TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              )
          ]);
        });
  }
}
