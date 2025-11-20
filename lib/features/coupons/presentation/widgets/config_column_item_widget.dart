import 'package:fin_uslugi/features/cards/presentation/widgets/app_image_network.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fin_uslugi/features/coupons/data/models/config_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ConfigColumnItemWidget extends StatelessWidget {
  final ConfigModel config;
  final ValueChanged<String> onCategorySelected;
  const ConfigColumnItemWidget(
      {required this.config, super.key, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: config.items.length,
      shrinkWrap: true,
      separatorBuilder: (context, index) => SizedBox(height: 3.h),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () async {
          if (config.items[index].url != null) {
            await launchUrl(
              Uri.parse(config.items[index].url!),
              mode: LaunchMode.externalApplication,
            );
          } else {
            onCategorySelected(config.items[index].category);
          }
        } /* ConfigItemClickHandler.configItemClickHandler(
            context, config.items[index]) */
        ,
        child: AppImageNetwork(config.items[index].image),
      ),
    );
  }
}
