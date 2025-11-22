import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/theme/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fin_uslugi/features/coupons/data/models/config_model.dart';
import 'package:fin_uslugi/features/coupons/presentation/bloc/coupons_bloc/remote/remote_coupons_bloc.dart';
import 'package:fin_uslugi/features/coupons/presentation/widgets/config_column_item_widget.dart';
import 'package:fin_uslugi/features/coupons/presentation/widgets/config_row_item_widget.dart';
import 'package:get_it/get_it.dart';

class CategoryPage extends StatefulWidget {
  final ValueChanged<String> onCategorySelected;
  const CategoryPage({super.key, required this.onCategorySelected});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late RemoteCouponsBloc _remoteCouponsBloc;
  String? nextPageKey;

  @override
  void initState() {
    _remoteCouponsBloc = GetIt.I<RemoteCouponsBloc>();
    _remoteCouponsBloc.add(GetConfig());
    super.initState();
  }

  List<ConfigModel>? configModels;
//TODO coupons route
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: _remoteCouponsBloc,
        listener: (context, RemoteCouponsState state) async {
          if (state is GetConfigSuccessfull) {
            configModels = state.configModel;
          }
        },
        builder: (context, state) {
          return Scaffold(
              backgroundColor: ColorStyles.white,
              body: SafeArea(
                child: CustomScrollView(shrinkWrap: true, slivers: [
                  if (state is Failed)
                    SliverFillRemaining(
                        child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          'На сервере произошла ошибка или нет соединения с интернетом',
                          textAlign: TextAlign.center,
                          style: UIFonts.couponText,
                        ),
                      ),
                    ))
                  else if (state is Loading || configModels == null)
                    SliverFillRemaining(
                        child: Center(
                      child: SizedBox(
                          width: 32.w,
                          height: 32.w,
                          child: const CircularProgressIndicator(
                              color: ColorStyles.black)),
                    ))
                  else
                    configModels!.isEmpty
                        ? SliverFillRemaining(
                            child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Text(
                                'По вашему запросу купоны не найдены, попробуйте поменять запрос',
                                textAlign: TextAlign.center,
                                style: UIFonts.couponText,
                              ),
                            ),
                          ))
                        : SliverPadding(
                            padding: EdgeInsets.symmetric(
                                    vertical: 17.h, horizontal: 20.w)
                                .copyWith(bottom: 100),
                            sliver: SliverList.builder(
                                itemCount: configModels!.length,
                                itemBuilder: (context, i) {
                                  if (configModels![i].type == 'col') {
                                    return ConfigColumnItemWidget(
                                      config: configModels![i],
                                      onCategorySelected:
                                          widget.onCategorySelected,
                                    );
                                  }
                                  return ConfigRowItemWidget(
                                      config: configModels![i]);
                                }))
                ]),
              ));
        });
  }
}
