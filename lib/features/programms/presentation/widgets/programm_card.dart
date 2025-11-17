import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/product.dart';
import 'package:fin_uslugi/core/widgets/app_card_layout.dart';
import 'package:fin_uslugi/features/programms/presentation/bloc/comparison_mortgage_bloc/local/local_comparison_mortgage_bloc.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgrammCard extends StatefulWidget {
  final Color? color;
  final Product productItem;
  const ProgrammCard({this.color, required this.productItem, super.key});

  @override
  State<ProgrammCard> createState() => _ProgrammCardState();
}

class _ProgrammCardState extends State<ProgrammCard> {
  late LocalComparisonMortgageBloc _localComparisonMortgageBloc;
  @override
  void initState() {
    _localComparisonMortgageBloc = GetIt.I<LocalComparisonMortgageBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List mortgagesIDS =
        GetIt.I<SharedPreferences>().getStringList('mortgagesIDS') ?? [];
    bool isInFavourite = mortgagesIDS.contains(widget.productItem.id);
    List comparrisonIDS =
        GetIt.I<SharedPreferences>().getStringList('comparisonIDS') ?? [];
    bool isInComparison = comparrisonIDS.contains(widget.productItem.id);

    return AppCardLayout(
      child: Column(
        children: [
          Row(children: [
            /*   ClipOval(
              child: SizedBox(
                width: 44.w,
                height: 44.w,
                child: Image.network(
                    '${ApiPath.domain}${widget.productItem.organizationRoundLogo}.png'),
              ),
            ), */
            SizedBox(width: 10.w),
            /*    Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.productItem.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).primaryTextTheme.labelLarge),
                  SizedBox(height: 4.h),
                  Text(widget.productItem.organizationName,
                      style: Theme.of(context).primaryTextTheme.bodySmall)
                ],
              ),
            ) */
          ]),
          SizedBox(height: 12.h),
          AppCardLayout(
            child: Column(
              children: [
                /* rowInfo('Сумма кредита:',
                    'до ${NumberFormat('#,##0').format(widget.productItem.params.maxSum).replaceAll(',', ' ')}  руб.'),
                SizedBox(height: 10.h),
                rowInfo(
                    'Перв. взнос:', 'от ${widget.productItem.params.minPsk}%'),
                SizedBox(height: 10.h),
                rowInfo('Ставка:',
                    'от ${widget.productItem.params.minRate}% годовых') */
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              /*  Flexible(
                  child: AppButton(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ProgrammDetailsPage(
                                  productItemModel: widget.productItem))),
                      title: 'Подробнее')), */
              SizedBox(width: 6.w),
              GestureDetector(
                  onTap: () => onTapComparison(isInComparison),
                  child: AppCardLayout(
                      padding: EdgeInsets.all(11.w),
                      child: Assets.icons.navBarIcons.comparisonIcon.svg(
                          colorFilter: isInComparison
                              ? null
                              : ColorFilter.mode(
                                  Theme.of(context)
                                      .inputDecorationTheme
                                      .fillColor!,
                                  BlendMode.srcIn)))),
              SizedBox(width: 6.w),
              GestureDetector(
                  onTap: () => onTapFavourites(isInFavourite),
                  child: AppCardLayout(
                      padding: EdgeInsets.all(11.w),
                      child: /* isInFavourite
                          ? Assets.icons.arrowRight.svg(
                              width: 28.w,
                              height: 28.w,
                              colorFilter: widget.color == null
                                  ? null
                                  : ColorFilter.mode(widget.color!, BlendMode.srcIn))
                          : */
                          Assets.icons.arrowRight.svg())),
            ],
          )
        ],
      ),
    );
  }

  onTapFavourites(bool isInFavourite) {
    /* if (isInFavourite) {
      _localMortgageBloc.add(DeleteMortgageFromFavourite(productItemModel: widget.productItem));
    } else {
      _localMortgageBloc.add(AddMortgageToFavourite(productItemModel: widget.productItem));
    } */
  }

  onTapComparison(bool isInComparison) {
    if (isInComparison) {
      _localComparisonMortgageBloc.add(
          DeleteMortgageFromComparison(productItemModel: widget.productItem));
    } else {
      _localComparisonMortgageBloc
          .add(AddMortgageToComparison(productItemModel: widget.productItem));
    }
  }

  Widget rowInfo(String title, String value) {
    var theme = Theme.of(context);
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title, style: theme.primaryTextTheme.labelSmall),
      Text(value,
          style: theme.primaryTextTheme.labelSmall!
              .copyWith(color: theme.primaryColor))
    ]);
  }
}
