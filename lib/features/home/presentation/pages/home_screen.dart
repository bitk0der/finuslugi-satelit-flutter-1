import 'package:fin_uslugi/core/routes/app_router.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/theme/app_fonts.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/filters_bloc.dart';
import 'package:fin_uslugi/features/home/presentation/widgets/image_card.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Home Screen',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp),
          ),
          Assets.icons.navBarIcons.homeNavBarIcon.svg(
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              children: [
                InkWell(
                    onTap: () {
                      GetIt.I<FiltersBloc>().add(ChangeTabIndex(index: 2));
                      context.navigateTo(const SelectionRouter());
                    },
                    child: ImageCard(
                        image: Assets.images.finProductBackOne,
                        child: cardChild('Кредиты на любые цели'))),
                SizedBox(height: 10.h),
                InkWell(
                    onTap: () {
                      GetIt.I<FiltersBloc>().add(ChangeTabIndex(index: 4));
                      context.navigateTo(const SelectionRouter());
                    },
                    child:
                        grayCard(Assets.icons.safeIcon, 'Ипотечные кредиты')),
              ],
            ),
            SizedBox(width: 10.w),
            Column(children: [
              InkWell(
                  onTap: () {
                    GetIt.I<FiltersBloc>().add(ChangeTabIndex(index: 3));
                    context.navigateTo(const SelectionRouter());
                  },
                  child: grayCard(
                      Assets.icons.safeIcon, 'Вклады, счета и депозиты')),
              SizedBox(height: 10.h),
              InkWell(
                onTap: () {
                  GetIt.I<FiltersBloc>().add(ChangeTabIndex(index: 0));
                  context.navigateTo(const SelectionRouter());
                },
                child: ImageCard(
                    image: Assets.images.finProductBackTwo,
                    child: cardChild('Кредитные карты без %')),
              ),
            ]),
          ]),
        ],
      ),
    );
  }

  Widget grayCard(SvgGenImage icon, String text) {
    return Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
            color: ColorStyles.fillColor,
            borderRadius: BorderRadius.circular(20)),
        width: 182.w,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          icon.svg(),
          SizedBox(height: 16.h),
          Row(
            children: [
              Flexible(
                child: Text(text,
                    style: TextStyles.h2
                        .copyWith(color: Colors.black, height: 1.2)),
              ),
              SizedBox(width: 15.w)
            ],
          )
        ]));
  }

  Widget cardChild(String text, [bool isVertical = false]) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Сравните',
                style: TextStyles.h2.copyWith(
                    color: Colors.black.withOpacity(0.8), fontSize: 16)),
            SizedBox(height: 3.h),
            SizedBox(
                width: isVertical ? 180.w : null,
                child: Text(text,
                    style: TextStyles.h1
                        .copyWith(color: Colors.black, fontSize: 20.sp))),
          ],
        ));
  }
}
