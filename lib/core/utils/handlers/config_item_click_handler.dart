import 'package:fin_uslugi/features/coupons/data/models/config_item_model.dart';
import 'package:fin_uslugi/features/coupons/presentation/bloc/coupons_bloc/remote/remote_coupons_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

class ConfigItemClickHandler {
  static Future<void> configItemClickHandler(
      BuildContext context, ConfigItemModel config) async {
    if (config.url != null) {
      await launchUrl(
        Uri.parse(config.url!),
        mode: LaunchMode.externalApplication,
      );
    } else {
      GetIt.I<RemoteCouponsBloc>()
          .add(SearchCoupons(searchText: '', category: config.category));
      /* context.push('/home/main', extra: config); */
    }
  }
}
