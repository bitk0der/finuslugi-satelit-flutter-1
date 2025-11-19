import 'package:auto_route/auto_route.dart';
import 'package:fin_uslugi/core/routes/app_router.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/widgets/app_small_button.dart';
import 'package:fin_uslugi/features/programms/presentation/bloc/favourite_mortgage_bloc/local/local_mortgage_bloc.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteButton extends StatefulWidget {
  const FavouriteButton({super.key});

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: GetIt.I<LocalMortgageBloc>(),
        builder: (context, state) {
          List<String> productsIds =
              GetIt.I<SharedPreferences>().getStringList('mortgagesIDS') ?? [];
          return Stack(children: [
            Container(
              height: 40.h,
              width: 40.h,
              padding: EdgeInsets.all(2.w),
              child: AppSmallButton(
                size: 38.w,
                onTap: () {
                  context.router.push(const FavouritesRoute());
                },
                icon: Assets.icons.buttonsIcon.star,
              ),
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
                      color: ColorStyles.greenStar),
                  child: Text(
                    productsIds.length.toString(),
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
              )
          ]);
        });
  }
}
