import 'package:flutter/material.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';

class RoundContainer extends StatelessWidget {
  const RoundContainer(
      {Key key, this.child, this.color = const Color(0xFFF5F5F5)})
      : super(key: key);

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding / 1.5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(kDefaultRadius),
      ),
      child: child,
    );
  }
}
