import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/utils/storage_util.dart';
import 'package:fin_uslugi/core/widgets/app_small_button.dart';
import 'package:fin_uslugi/features/programms/presentation/bloc/favourite_mortgage_bloc/local/local_mortgage_bloc.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CardsFavouriteButton extends StatefulWidget {
  final VoidCallback onTapFavourite;
  final String id;
  final bool isInCard;
  const CardsFavouriteButton(
      {super.key,
      required this.onTapFavourite,
      required this.id,
      this.isInCard = false});

  @override
  State<CardsFavouriteButton> createState() => _CardsFavouriteButtonState();
}

class _CardsFavouriteButtonState extends State<CardsFavouriteButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: GetIt.I<LocalMortgageBloc>(),
        builder: (context, state) {
          var inFavourites = GetIt.I<StorageUtil>().checkInFavourite(widget.id);
          return AppSmallButton(
              onTap: widget.onTapFavourite,
              color: widget.isInCard ? Colors.white : null,
              iconColor: inFavourites ? ColorStyles.red : null,
              icon: widget.isInCard
                  ? inFavourites
                      ? Assets.icons.buttonsIcon.star
                      : Assets.icons.buttonsIcon.outlinedStar
                  : Assets.icons.buttonsIcon.star);
        });
  }
}
