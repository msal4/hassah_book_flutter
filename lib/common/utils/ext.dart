import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../main.dart';

extension LocalizationsExt on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this);

  void Function(Locale) get setLocale => App.of(this).setLocale;
}
