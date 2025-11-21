import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fin_uslugi/core/routes/app_router.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/widgets/app_card_layout.dart';
import 'package:fin_uslugi/core/widgets/app_circle_button.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/custom_app_bar.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainServicePage extends StatefulWidget {
  const MainServicePage({super.key});

  @override
  State<MainServicePage> createState() => _MainServicePageState();
}

class _MainServicePageState extends State<MainServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.getGradient(
          isNeedFilterButtons: false,
          context: context,
          onTap: () => {},
          title: 'Сервис',
          actions: [],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              serviceButton(
                'Избранное',
                Assets.icons.yellowStar,
                () => context.router.navigate(FavouritesRoute()),
              ),
              const SizedBox(height: 12),
              serviceButton(
                'Уведомления',
                Assets.icons.banks,
                () => context.router.navigate(BackgroundNotificationsRoute()),
              )
            ],
          ),
        ));
  }

  AppCardLayout serviceButton(
          String title, SvgGenImage icon, VoidCallback onTap) =>
      AppCardLayout(
          color: ColorStyles.fillColor2,
          onTap: onTap,
          child: Row(
            children: [
              Flexible(
                child: Row(
                  children: [
                    AppCircleButton(
                      icon: icon,
                      backgroundColor: ColorStyles.black,
                      iconColor: Colors.white,
                    ),
                    SizedBox(width: 12),
                    Flexible(child: Text(title))
                  ],
                ),
              ),
              SizedBox(width: 12),
              Assets.icons.arrowRight.svg(
                  colorFilter: ColorFilter.mode(
                ColorStyles.grayBorder,
                BlendMode.srcIn,
              )),
            ],
          ));
}
