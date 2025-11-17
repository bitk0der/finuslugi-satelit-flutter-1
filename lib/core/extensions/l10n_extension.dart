import 'package:flutter/material.dart';
import 'package:fin_uslugi/gen/l10n.dart';

extension LocalizationExtension on BuildContext {
  S get l10n => S.of(this);
}
