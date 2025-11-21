import 'package:fin_uslugi/core/routes/app_router.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/theme/app_fonts.dart';
import 'package:fin_uslugi/core/widgets/app_circle_button.dart';
import 'package:fin_uslugi/core/widgets/title.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/filters_bloc.dart';
import 'package:fin_uslugi/features/home/presentation/widgets/home_appbar_widget.dart';
import 'package:fin_uslugi/features/home/presentation/widgets/image_card.dart';
import 'package:fin_uslugi/features/loans/presentation/widgets/card_layout.dart';
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
    return Container(
      color: Color(0xff13161C),
      child: SingleChildScrollView(
          child: Column(children: [
        const HomeAppbarWidget(),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r))),
          child: SafeArea(
            top: false,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              AppTitle(
                'Финпродукты',
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Column(
                      children: [
                        InkWell(
                            onTap: () {
                              GetIt.I<FiltersBloc>()
                                  .add(ChangeTabIndex(index: 0));
                              context.navigateTo(const SelectionRouter());
                            },
                            child: ImageCard(
                                image: Assets.images.finProductBackOne,
                                child: cardChild('Деньги до зарплаты',
                                    'Без скрытых комиссий и\nплатежей'))),
                        SizedBox(height: 10.h),
                        grayImageCard(
                            Assets.images.finProductBackGrayOne,
                            'Вклады до 35% годовых',
                            'Самые высокие ставки!', () {
                          GetIt.I<FiltersBloc>().add(ChangeTabIndex(index: 4));
                          context.navigateTo(const SelectionRouter());
                        }, 182),
                      ],
                    ),
                    SizedBox(width: 10.w),
                    Column(children: [
                      grayImageCard(
                        Assets.images.finProductBackGrayTwo,
                        'Кредиты на любые цели',
                        'Деньги сразу на карту',
                        () {
                          GetIt.I<FiltersBloc>().add(ChangeTabIndex(index: 3));
                          context.navigateTo(const SelectionRouter());
                        },
                        182,
                      ),
                      SizedBox(height: 10.h),
                      InkWell(
                        onTap: () {
                          GetIt.I<FiltersBloc>().add(ChangeTabIndex(index: 0));
                          context.navigateTo(const SelectionRouter());
                        },
                        child: ImageCard(
                            image: Assets.images.finProductBackTwo,
                            child: cardChild('Кредитная карта до 400 000 ₽',
                                '0 ₽ за первый год обслуживания')),
                      ),
                    ]),
                  ]),
                ],
              ),
              AppTitle(
                'Экономия на покупках',
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: grayImageCard(
                        Assets.images.finProductBackGrayThree,
                        'Дебетовые карты',
                        'Высокий кэшбэк!',
                        () {
                          GetIt.I<FiltersBloc>().add(ChangeTabIndex(index: 4));
                          context.navigateTo(const SelectionRouter());
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: grayImageCard(
                        Assets.images.finProductBackGrayFour,
                        'Промокоды и купоны',
                        'Выгодные покупки!',
                        () {
                          GetIt.I<FiltersBloc>().add(ChangeTabIndex(index: 4));
                          context.navigateTo(const SelectionRouter());
                        },
                      ),
                    )
                  ],
                ),
              ),
              AppTitle(
                'Полезное',
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16),
              ),
              IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: InkWell(
                            onTap: () {
                              /*    GetIt.I<FiltersBloc>()
                                  .add(ChangeTabIndex(index: 4)); */
                              context.router.navigate(const BanksRoute());
                            },
                            child: grayCard(
                                Assets.icons.banks,
                                'Каталог банков РФ',
                                'Посмотреть актуальную информацию о банках')),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: InkWell(
                            onTap: () {
                              GetIt.I<FiltersBloc>()
                                  .add(ChangeTabIndex(index: 4));
                              context.navigateTo(const SelectionRouter());
                            },
                            child: grayCard(Assets.icons.mfos, 'Каталог МФО РФ',
                                'Посмотреть актуальную информацию об МФО')),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
        )
      ])),
    );
  }

  Widget grayImageCard(
    AssetGenImage image,
    String text,
    String description,
    VoidCallback onTap, [
    double? width,
  ]) {
    return InkWell(
        onTap: () {
          GetIt.I<FiltersBloc>().add(ChangeTabIndex(index: 4));
          context.navigateTo(const SelectionRouter());
        },
        child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
                color: ColorStyles.fillColor,
                image: DecorationImage(
                    image: AssetImage(image.path), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20)),
            width: width,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Flexible(
                    child: Text(text,
                        style: TextStyles.h1
                            .copyWith(color: Colors.black, height: 1.1)),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  SizedBox(
                    width: 110.w,
                    child: Text(description,
                        style: TextStyles.h5.copyWith(
                            color: Colors.black.withValues(alpha: 0.8),
                            height: 1.1,
                            fontSize: 13.sp)),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              redButton()
            ])));
  }

  Widget redButton() => AppCircleButton(
      icon: Assets.icons.arrowRight,
      backgroundColor: ColorStyles.red,
      padding: 8);

  Widget grayCard(
    SvgGenImage icon,
    String text,
    String description, [
    double? width,
  ]) {
    return Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
            color: ColorStyles.fillColor,
            borderRadius: BorderRadius.circular(20)),
        width: width,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                AppCircleButton(
                  icon: icon,
                  backgroundColor: ColorStyles.black,
                ),
                SizedBox(height: 16.h),
                Text(text,
                    style: TextStyles.h2.copyWith(
                        color: Colors.black, fontSize: 16.sp, height: 1.2)),
              ]),
              SizedBox(height: 6.h),
              Text(description,
                  style:
                      TextStyles.h5.copyWith(color: Colors.black, height: 1.1))
            ]));
  }

  Widget cardChild(String text, String description, [bool isVertical = false]) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppCardLayout(
              color: ColorStyles.greenStar,
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
              child: Text('Одобрено',
                  style: TextStyles.h2
                      .copyWith(color: Colors.black, fontSize: 12.sp)),
            ),
            SizedBox(height: 10.h),
            SizedBox(
                width: isVertical ? 180.w : null,
                child: Text(text,
                    style: TextStyles.h1
                        .copyWith(color: Colors.white, fontSize: 22.sp))),
            SizedBox(height: 10),
            SizedBox(
                width: isVertical ? 180.w : null,
                child: Text(description,
                    style: TextStyles.h5.copyWith(color: Colors.white))),
          ],
        ));
  }
}
