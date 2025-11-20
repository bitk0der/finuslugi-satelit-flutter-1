import 'dart:io';

import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/theme/app_font.dart';
import 'package:fin_uslugi/core/utils/handlers/text_change_handler.dart';
import 'package:fin_uslugi/features/programms/presentation/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';

class DefaultSliverAppBar extends StatefulWidget {
  final Function(String) onTextChanged;
  const DefaultSliverAppBar({required this.onTextChanged, super.key});

  @override
  State<DefaultSliverAppBar> createState() => _MainPageState();
}

class _MainPageState extends State<DefaultSliverAppBar> {
  var top = 0.0;
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        bottom: PreferredSize(
          preferredSize: Size(0, 20.h),
          child: const SizedBox.shrink(),
        ),
        pinned: true,
        expandedHeight: 150.h,
        leading: const SizedBox.shrink(),
        flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          top = constraints.biggest.height;
          return Stack(
            children: [
              Positioned(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: ColorStyles.navbarGradient,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: Opacity(
                    opacity: ((top - 95) / (150 - 95)).clamp(0, 1),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 62.h),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (Platform.isAndroid)
                              SizedBox(
                                  height: 44.w,
                                  child: Assets.images.bagImage.image()),
                            /*  if (Platform.isIOS)
                              Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: SizedBox(
                                      height: 44.w,
                                      child: Assets.images.logoMultibonusIos
                                          .image())), */
                            SizedBox(width: 10.w),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Т-плюс онлайн',
                                    style: UIFonts.bodyMedium,
                                    overflow: TextOverflow.ellipsis),
                                SizedBox(height: 2.h),
                                Text('Банк скидок',
                                    style: UIFonts.bodySmall,
                                    overflow: TextOverflow.ellipsis)
                              ],
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        ColorStyles.white,
                        ColorStyles.white
                      ],
                      stops: [0.0, 0.5, 0.5, 1],
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                    ),
                  ),
                  child: AppTextField(
                      filled: true,
                      textStyle: UIFonts.bodySmall,
                      hintText: 'Введите категорию или товар',
                      onChange: (text) => TextChangeHandler.textChangeHandler(
                          searchText: text,
                          context: context,
                          onTextChanged: widget.onTextChanged)),
                ),
              ),
            ],
          );
        }));
  }
}
