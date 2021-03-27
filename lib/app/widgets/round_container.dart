import 'package:flutter/material.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';

class RoundContainer extends StatelessWidget {
  const RoundContainer({
    Key key,
    this.child,
    this.color,
    this.padding = const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
    this.margin,
  }) : super(key: key);

  final Widget child;
  final Color color;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: margin,
      padding: padding,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: color ?? theme.backgroundColor,
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      ),
      child: child,
    );
  }
}
