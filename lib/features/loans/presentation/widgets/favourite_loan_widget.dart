import 'package:fin_uslugi/core/widgets/app_circle_button.dart';
import 'package:fin_uslugi/features/loans/data/models/credit/loan_main_model.dart';
import 'package:fin_uslugi/features/programms/presentation/bloc/favourite_mortgage_bloc/local/local_mortgage_bloc.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteLoanWidget extends StatefulWidget {
  final LoanMainModel loan;
  const FavouriteLoanWidget({super.key, required this.loan});

  @override
  State<FavouriteLoanWidget> createState() => _FavouriteLoanWidgetState();
}

class _FavouriteLoanWidgetState extends State<FavouriteLoanWidget> {
  late LocalMortgageBloc localMortgageBloc;
  @override
  void initState() {
    localMortgageBloc = GetIt.I<LocalMortgageBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: localMortgageBloc,
        listener: (context, state) => {},
        builder: (context, state) {
          var inFavourite = checkInFavourite(widget.loan.id);
          return AppCircleButton(
            onTap: () {
              GetIt.I<LocalMortgageBloc>()
                  .add(AddMortgageToFavourite(productItemModel: widget.loan));
            },
            icon: inFavourite
                ? Assets.icons.favouriteIcon
                : Assets.icons.buttonsIcon.outlinedStar,
          );
        });
  }

  bool checkInFavourite(String id) {
    List productsIds =
        GetIt.I<SharedPreferences>().getStringList('mortgagesIDS') ?? [];
    if (productsIds.contains(id)) {
      return true;
    } else {
      return false;
    }
  }
}
