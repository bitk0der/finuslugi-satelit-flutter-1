import 'package:fin_uslugi/core/theme/app_font.dart';
import 'package:fin_uslugi/core/widgets/app_card_layout.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/app_image_network.dart';
import 'package:fin_uslugi/features/coupons/data/models/retailer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final RetailerModel retailer;
  const DefaultAppBar({required this.retailer, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      toolbarHeight: 100.h,
      leadingWidth: 0,
      title: Container(
        height: 100.h,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: ColorStyles.navbarGradient,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 20.w),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 40.w,
                          height: 40.w,
                          decoration: BoxDecoration(
                              color: ColorStyles.white,
                              borderRadius: BorderRadius.circular(12.r)),
                          padding: EdgeInsets.all(10.w),
                          child: Assets.icons.arrowRight.svg(),
                        )),
                    SizedBox(width: 10.w),
                    Flexible(
                        child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r)),
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          AppCardLayout(
                              padding: EdgeInsets.zero,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: SizedBox(
                                    width: 40.w,
                                    height: 40.w,
                                    child: AppImageNetwork(retailer.imageUrl)),
                              )),
                          Flexible(
                            child: Center(
                              child: Text(
                                  removeQueryParametersAndReturnDomain(
                                      retailer.website),
                                  style: UIFonts.hint
                                      .copyWith(color: ColorStyles.black),
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ],
                      ),
                    )),
                    SizedBox(width: 10.w),
                    GestureDetector(
                        onTap: () async {
                          if (!await launchUrl(
                              Uri.parse('https://${retailer.website}'),
                              mode: LaunchMode.externalApplication)) {
                            throw Exception(
                                'Could not launch ${retailer.website}');
                          }
                        },
                        child: Container(
                          width: 40.w,
                          height: 40.w,
                          decoration: BoxDecoration(
                              color: ColorStyles.white,
                              borderRadius: BorderRadius.circular(12.r)),
                          padding: EdgeInsets.all(10.w),
                          child: Assets.icons.shareIcon.svg(),
                        )),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  String removeQueryParametersAndReturnDomain(String url) {
    try {
      if (!url.startsWith('http://') && !url.startsWith('https://')) {
        url = 'https://$url';
      }
      Uri uri = Uri.parse(url);
      String domain = uri.host;
      if (domain.startsWith('www.')) {
        domain = domain.substring(4);
      }
      // Return the string representation of the simplified URL
      return domain.toString();
    } catch (e) {
      // If an error occurs, return the input URL
      return url;
    }
  }

  @override
  Size get preferredSize => Size(0, 100.h);
}
