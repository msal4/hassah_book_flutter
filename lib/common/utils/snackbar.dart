import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';

enum SnackBarType { error, success, casual }

void showSnackBar(
  BuildContext context, {
  required String message,
  SnackBarType type = SnackBarType.casual,
  EdgeInsets? margin,
}) {
  final theme = Theme.of(context);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      margin: margin?.copyWith(left: kDefaultPadding, right: kDefaultPadding),
      behavior: SnackBarBehavior.floating,
      backgroundColor: type == SnackBarType.success
          ? theme.accentColor
          : type == SnackBarType.error
              ? kDangerColor
              : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(99999),
      ),
      duration: const Duration(seconds: 1),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: theme.textTheme.bodyText1!.copyWith(color: Colors.white),
      ),
    ),
  );
}
