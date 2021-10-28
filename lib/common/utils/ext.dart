import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';

import '../../main.dart';

extension LocalizationsExt on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this);

  void Function(Locale) get setLocale => App.of(this).setLocale;

  Locale get locale => Localizations.localeOf(this);
}

extension OrderStatusExt on OrderStatus {
  Color get color {
    switch (this) {
      case OrderStatus.pending:
        return Colors.yellow.shade700;
      case OrderStatus.canceled:
        return Colors.grey;
      case OrderStatus.failed:
        return kDangerColor;
      case OrderStatus.processed:
        return Colors.blue;
      default:
        return Colors.green;
    }
  }
}
