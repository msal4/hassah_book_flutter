import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';

const _kMinHorizontalPadding = kDefaultPadding / 2;
const _kMinVerticalPadding = 2.0;
const _kMaxNumChips = 3;

class ChipItem {
  const ChipItem({@required this.id, @required this.label});

  final String id;
  final String label;

  @override
  int get hashCode => hashValues(id, label);

  @override
  bool operator ==(Object other) {
    return other is ChipItem && other.id == id && other.label == label;
  }
}

class Chips extends HookWidget {
  const Chips({
    Key key,
    @required this.items,
    this.maxNumChips = _kMaxNumChips,
    this.collapsable = true,
    this.textColor,
    this.backgroundColor,
    this.onChipPressed,
  })  : assert(maxNumChips != null, "maxNumChips must not be null"),
        super(key: key);

  final List<ChipItem> items;
  final int maxNumChips;
  final bool collapsable;
  final void Function(ChipItem item) onChipPressed;

  /// If not provided the default [textColor] is going to be used.
  final Color textColor;

  /// If not provided the default [backgroundColor] is going to be used.
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    if (this.items == null || this.items.isEmpty) return const SizedBox();

    final items =
        this.items.fold(<ChipItem>[], (List<ChipItem> previousList, element) {
      return !previousList.contains(element)
          ? [...previousList, element]
          : previousList;
    }).toList();

    final theme = Theme.of(context);

    final currentItems = useState(
        items.length > maxNumChips ? items.sublist(0, maxNumChips) : items);

    final backgroundColor = this.backgroundColor ?? theme.primaryColor;
    final textColor = this.textColor ?? Colors.white;

    return Wrap(
      alignment: WrapAlignment.center,
      runSpacing: _kMinHorizontalPadding,
      children: [
        for (final item in currentItems.value)
          GestureDetector(
            onTap: () {
              if (onChipPressed != null) onChipPressed(item);
            },
            child: _buildChip(
              textStyle: theme.textTheme.bodyText1,
              text: item.label,
              backgroundColor: backgroundColor,
              textColor: textColor,
            ),
          ),
        if (collapsable &&
            items.length > maxNumChips &&
            currentItems.value.length == maxNumChips)
          GestureDetector(
            onTap: () {
              currentItems.value = items;
            },
            child: _buildChip(
              textStyle: theme.textTheme.bodyText1,
              backgroundColor: theme.backgroundColor,
              textColor: theme.textTheme.bodyText1.color,
            ),
          )
      ],
    );
  }

  Widget _buildChip({
    @required TextStyle textStyle,
    @required Color backgroundColor,
    @required Color textColor,
    String text = "...",
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: _kMinHorizontalPadding,
        vertical: _kMinVerticalPadding,
      ),
      margin:
          const EdgeInsets.symmetric(horizontal: _kMinHorizontalPadding / 2),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9999),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 10)
        ],
      ),
      child:
          Text(text, style: textStyle.copyWith(color: textColor, fontSize: 10)),
    );
  }
}
