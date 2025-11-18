import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageCard extends StatelessWidget {
  final AssetGenImage image;
  final Widget child;
  const ImageCard({super.key, required this.image, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 182.w,
        height: 250.h,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image.path))),
        child: child);
  }
}
