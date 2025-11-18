import 'package:fin_uslugi/core/utils/handlers/config_item_click_handler.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/app_image_network.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fin_uslugi/features/coupons/data/models/config_model.dart';

class ConfigColumnItemWidget extends StatelessWidget {
  final ConfigModel config;
  const ConfigColumnItemWidget({required this.config, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: config.items.length,
      shrinkWrap: true,
      separatorBuilder: (context, index) => SizedBox(height: 3.h),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () async => ConfigItemClickHandler.configItemClickHandler(
            context, config.items[index]),
        child: AppImageNetwork(config.items[index].image),
      ),
    );
  }
}
