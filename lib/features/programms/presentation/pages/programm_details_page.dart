import 'package:fin_uslugi/core/constants/constants.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/utils/values_service.dart';
import 'package:fin_uslugi/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fin_uslugi/features/app_banner/presentation/app_web_view.dart';
import 'package:fin_uslugi/features/programms/data/models/product_item_model.dart';
import 'package:fin_uslugi/features/programms/presentation/widgets/info_card.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class ProgrammDetailsPage extends StatefulWidget {
  final ProductItemModel productItemModel;
  const ProgrammDetailsPage({required this.productItemModel, super.key});

  @override
  State<ProgrammDetailsPage> createState() => _ProgrammDetailsPageState();
}

class _ProgrammDetailsPageState extends State<ProgrammDetailsPage> {
  bool firstTabIsChoosen = true;
  bool isFullOpened = false;
  late ThemeData theme;
  @override
  void initState() {
    super.initState();
  }

  Color getColor(bool firstTabIsChoosen) {
    return firstTabIsChoosen
        ? theme.primaryColor.withValues(alpha: 0.5)
        : theme.primaryColor;
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    List<String> values = getValues(widget.productItemModel);
    List<String> valuesSecondBar = getValuesSecondBar(widget.productItemModel);
    return SafeArea(
      top: false,
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: ColorStyles.detailsGradient,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0.3])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r)),
                color: Theme.of(context).colorScheme.primary),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                        child: GestureDetector(
                      onTap: () => setState(() {
                        firstTabIsChoosen = true;
                      }),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: getColor(!firstTabIsChoosen)))),
                        child: Text('Условия и описание',
                            style: theme.primaryTextTheme.labelSmall!
                                .copyWith(color: getColor(!firstTabIsChoosen))),
                      ),
                    )),
                    Flexible(
                        child: GestureDetector(
                      onTap: () => setState(() {
                        firstTabIsChoosen = false;
                      }),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: getColor(firstTabIsChoosen)))),
                          child: Text('Требования',
                              style: theme.primaryTextTheme.labelSmall!
                                  .copyWith(
                                      color: getColor(firstTabIsChoosen)))),
                    )),
                  ],
                ),
                Expanded(
                  child: !firstTabIsChoosen
                      ? Padding(
                          padding: EdgeInsets.only(bottom: 20.h, top: 16.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                for (int index = 0;
                                    index < titlesSecondBar.length;
                                    index++)
                                  InfoCard(
                                    title: titlesSecondBar[index],
                                    value: valuesSecondBar[index],
                                  ),
                              ]),
                              button(widget.productItemModel)
                            ],
                          ),
                        )
                      : ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(bottom: 20.h, top: 16.h),
                          children: [
                            for (int index = 0; index < titles.length; index++)
                              InfoCard(
                                title: titles[index],
                                value: values[index],
                              ),
                            SizedBox(height: 12.h),
                            widget.productItemModel.params.productDescription
                                    .isEmpty
                                ? const SizedBox.shrink()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('ОПИСАНИЕ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge),
                                      SizedBox(height: 14.h),
                                      HtmlWidget(
                                        widget.productItemModel.params
                                            .productDescription,
                                        textStyle: theme
                                            .primaryTextTheme.labelLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.w400,
                                                height: 1.3),
                                      ),
                                      SizedBox(height: 21.h),
                                    ],
                                  ),
                            button(widget.productItemModel)
                          ],
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget button(ProductItemModel productItemModel) {
    return productItemModel.url.isNotEmpty
        ? AppButton(
            onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => AppWebView(
                          title: productItemModel.name,
                          url: productItemModel.params.link)),
                ),
            title: 'Оставить заявку')
        : const SizedBox.shrink();
  }
}
