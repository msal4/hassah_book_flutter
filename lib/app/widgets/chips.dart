import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';

const _kMinHorizontalPadding = kDefaultPadding / 2;
const _kMinVerticalPadding = 2.0;
const _kMaxNumChips = 3;

class Chips extends HookWidget {
  const Chips({Key key, @required this.items, this.maxNumChips = _kMaxNumChips, this.collapsable = true})
      : assert(maxNumChips != null, "maxNumChips must not be null"),
        super(key: key);

  final List<String> items;
  final int maxNumChips;
  final bool collapsable;

  @override
  Widget build(BuildContext context) {
    if (this.items == null || this.items.isEmpty) return SizedBox();

    final items = this.items.fold(<String>[], (List<String> previousList, element) {
      return !previousList.contains(element) ? [...previousList, element] : previousList;
    }).toList();

    final theme = Theme.of(context);

    final currentItems = useState(items.length > maxNumChips ? items.sublist(0, maxNumChips) : items);

    return Wrap(
      alignment: WrapAlignment.center,
      runSpacing: _kMinHorizontalPadding,
      children: [
        for (final item in currentItems.value)
          _buildChip(
            text: item,
            theme: Theme.of(context),
            rightMargin: (items.last != item),
          ),
        if (collapsable && items.length > maxNumChips && currentItems.value.length == maxNumChips)
          GestureDetector(
            onTap: () {
              currentItems.value = items;
            },
            child: _buildChip(
              theme: theme,
              backgroundColor: theme.backgroundColor,
              textColor: theme.textTheme.bodyText1.color,
            ),
          )
      ],
    );
  }

  Widget _buildChip({text = "...", rightMargin = false, ThemeData theme, Color backgroundColor, Color textColor}) {
    if (backgroundColor == null) backgroundColor = theme.primaryColor;
    if (textColor == null) textColor = Colors.white;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: _kMinHorizontalPadding, vertical: _kMinVerticalPadding),
      margin: rightMargin ? const EdgeInsets.only(right: _kMinHorizontalPadding) : null,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9999),
        color: backgroundColor,
      ),
      child: Text(text, style: theme.textTheme.bodyText1.copyWith(color: textColor, fontSize: 10)),
    );
  }
}
