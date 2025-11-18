import 'package:auto_route/auto_route.dart';
import 'package:fin_uslugi/core/constants/constants.dart';
import 'package:fin_uslugi/features/local_notifications/presentation/controllers/message_payload_handler.dart';
import 'package:fin_uslugi/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fin_uslugi/core/routes/app_router.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/theme/app_fonts.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class AppRootScreen extends StatefulWidget {
  const AppRootScreen({super.key});

  @override
  State<AppRootScreen> createState() => _AppRootScreenState();
}

class _AppRootScreenState extends State<AppRootScreen> {
  final routes = [
    const HomeRouter(),
    const HomeRouter(),
    const HomeRouter(),
    const HomeRouter(),
  ];
  final _icons = [
    Assets.icons.navBarIcons.mapNavBarIcon,
    Assets.icons.navBarIcons.mapNavBarIcon,
    Assets.icons.navBarIcons.mapNavBarIcon,
    Assets.icons.navBarIcons.mapNavBarIcon,
  ];
  late final _labels = [
    'navbar_home',
    'navbar_selection',
    'navbar_debts',
    'navbar_assistent',
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (payloadToHandle != null) {
        await Future.delayed(const Duration(seconds: 1), () {
          handleNotificationTap(payloadToHandle);
          payloadToHandle = null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: ColorStyles.white,
      routes: routes,
      extendBody: true,
      bottomNavigationBuilder: (context, tabsRouter) {
        if (tabsRouter.topMatch.meta['hideBottomNav'] == true) {
          return const SizedBox.shrink();
        }
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: const [BoxShadow(blurRadius: 16, color: Colors.black12)],
          ),
          margin: EdgeInsets.all(
            16.w,
          ).copyWith(bottom: 16 + MediaQuery.of(context).viewPadding.bottom),
          child: PopScope(
            canPop: tabsRouter.activeIndex == 0,
            onPopInvokedWithResult: (canPop, result) async {
              if (!canPop) {
                ScaffoldMessenger.of(context).clearSnackBars();
                tabsRouter.setActiveIndex(tabsRouter.activeIndex - 1);
                tabsRouter.navigate(routes[tabsRouter.activeIndex]);
              }
            },
            child: MediaQuery.removePadding(
              context: context,
              removeBottom: true,
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                currentIndex: tabsRouter.activeIndex,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                onTap: (index) async {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  tabsRouter.setActiveIndex(index);
                  tabsRouter.navigate(routes[index]);
                },
                useLegacyColorScheme: false,
                selectedLabelStyle: TextStyles.h2.copyWith(fontSize: 0),
                unselectedLabelStyle: TextStyles.h2.copyWith(fontSize: 0),
                items: List.generate(
                  _labels.length,
                  (index) => BottomNavigationBarItem(
                    label: '',
                    icon: _getIcon(
                      _icons[index],
                      _labels[index],
                      tabsRouter.activeIndex == index,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _getIcon(SvgGenImage icon, String text, bool isActive) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 13.h),
      child: Column(
        children: [
          AnimatedCrossFade(
            firstChild: getIcon(icon, ColorStyles.blue),
            secondChild: getIcon(
              icon,
              ColorStyles.black.withValues(alpha: 0.4),
            ),
            crossFadeState:
                isActive ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: standartDuration,
          ),
          SizedBox(height: 5.h),
          AnimatedDefaultTextStyle(
            style: TextStyles.h4.copyWith(
              color:
                  isActive ? Colors.black : Colors.black.withValues(alpha: 0.4),
            ),
            duration: standartDuration,
            child: Text(text),
          ),
        ],
      ),
    );
  }

  SvgPicture getIcon(SvgGenImage icon, Color color) => icon.svg(
        width: 24.w,
        height: 24.h,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      );
}
