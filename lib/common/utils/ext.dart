import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/main.dart';
import 'package:hassah_book_flutter/schema.graphql.dart';

extension LocalizationsExt on BuildContext {
  AppLocalizations? get loc => AppLocalizations.of(this);

  void Function(Locale) get setLocale => App.of(this)!.setLocale;

  Locale get locale => Localizations.localeOf(this);
}

extension OrderStatusExt on Enum$OrderStatus {
  Color get color {
    switch (this) {
      case Enum$OrderStatus.Pending:
        return Colors.yellow.shade700;
      case Enum$OrderStatus.Canceled:
        return Colors.grey;
      case Enum$OrderStatus.Failed:
        return kDangerColor;
      case Enum$OrderStatus.Processed:
        return Colors.blue;
      default:
        return Colors.green;
    }
  }
}
