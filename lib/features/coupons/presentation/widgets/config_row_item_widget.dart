import 'package:fin_uslugi/core/utils/handlers/config_item_click_handler.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/app_image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fin_uslugi/features/coupons/data/models/config_item_model.dart';
import 'package:fin_uslugi/features/coupons/data/models/config_model.dart';

class ConfigRowItemWidget extends StatelessWidget {
  final ConfigModel config;
  const ConfigRowItemWidget({required this.config, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 3.h,
      ),
      child: Row(
        children: [
          networkImage(context, config.items.first),
          SizedBox(width: 6.w),
          networkImage(context, config.items.last),
        ],
      ),
    );
  }

  Widget networkImage(BuildContext context, ConfigItemModel item) {
    return Flexible(
        child: GestureDetector(
            onTap: () async =>
                ConfigItemClickHandler.configItemClickHandler(context, item),
            child: AppImageNetwork(item.image)));
  }
}
