import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/widgets/app_small_button.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/filters_bloc.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/custom_app_bar.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class FilterButton extends StatefulWidget {
  final VoidCallback onTap;
  const FilterButton({super.key, required this.onTap});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    int index = GetIt.I<FiltersBloc>().index;
    return BlocBuilder(
        bloc: GetIt.I<FiltersBloc>(),
        builder: (context, state) {
          return Stack(children: [
            Container(
                height: 40.h,
                width: 40.h,
                padding: EdgeInsets.all(2.w),
                child: AppSmallButton(
                    onTap: widget.onTap,
                    padding: 10,
                    icon: Assets.icons.buttonsIcon.settings)),
            if (CustomAppBar.appliedFiltersCount(index) != null &&
                CustomAppBar.appliedFiltersCount(index) != 0)
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
                    CustomAppBar.appliedFiltersCount(index).toString(),
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
              )
          ]);
        });
  }
}
