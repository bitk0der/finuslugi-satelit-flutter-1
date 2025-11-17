import 'package:cached_network_image/cached_network_image.dart';
import 'package:fin_uslugi/core/utils/ui_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImageNetwork extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final double strokeWidth;

  const AppImageNetwork(
    this.url, {
    super.key,
    this.width,
    this.height,
    this.strokeWidth = 4,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    var localUrl = UiUtil.getlogoUrl(url);
    if (localUrl.contains('.svg')) {
      return SvgPicture.network(
        localUrl,
        placeholderBuilder: (BuildContext context) => SizedBox(
          width: 25.r,
          height: 25.r,
          child: Center(
            child: CircularProgressIndicator(
              strokeWidth: strokeWidth,
            ),
          ),
        ),
      );
    }
    return CachedNetworkImage(
      imageUrl: localUrl,
      width: width?.w,
      fit: fit,
      height: height?.h,
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return SizedBox(
          width: 30.r,
          height: 30.r,
          child: Center(
            child: CircularProgressIndicator(
              strokeWidth: strokeWidth,
              value: downloadProgress.progress,
            ),
          ),
        );
      },
      errorWidget: (context, url, error) => const SizedBox(),
    );
  }
}
