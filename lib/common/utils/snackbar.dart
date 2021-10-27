import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';

enum SnackBarType { error, success, casual }

void showSnackBar(BuildContext context,
    {@required String message, SnackBarType type = SnackBarType.casual}) {
  final theme = Theme.of(context);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: type == SnackBarType.success
          ? theme.accentColor
          : type == SnackBarType.error
              ? kDangerColor
              : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(kDefaultBorderRadius),
          topRight: Radius.circular(kDefaultBorderRadius),
        ),
      ),
      duration: const Duration(seconds: 1),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: theme.textTheme.bodyText1.copyWith(color: Colors.white),
      ),
    ),
  );
}
