import 'dart:async';

import 'package:fin_uslugi/features/coupons/presentation/bloc/coupons_bloc/remote/remote_coupons_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextChangeHandler {
  static Timer? _debounce;
  static String textChangeHandler(
      {required String searchText,
      required BuildContext context,
      String? category,
      Function(String)? onTextChanged}) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 750), () {
      BlocProvider.of<RemoteCouponsBloc>(context)
          .add(SearchCoupons(searchText: searchText, category: category));
      onTextChanged != null ? onTextChanged(searchText) : null;
      _debounce?.cancel();
    });
    return searchText;
  }
}
