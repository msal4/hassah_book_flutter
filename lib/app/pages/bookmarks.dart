import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hassah_book_flutter/app/widgets/chips.dart';
import 'package:hassah_book_flutter/app/widgets/round_container.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/widgets/product_card.dart';

class BookmarksPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    final leftPadding = padding.left + kDefaultPadding;
    final rightPadding = padding.right + kDefaultPadding;
    final topPadding = padding.top + kDefaultPadding;
    final bottomPadding = padding.bottom + kDefaultPadding;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return ListView.separated(
      padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding, left: leftPadding, right: rightPadding),
      itemBuilder: (context, idx) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(kDefaultRadius),
          child: Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: Stack(
              children: [
                RoundContainer(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(kDefaultRadius),
                        child: Container(
                          width: kDefaultImageWidth / 2,
                          child: Image.network(
                            "",
                            fit: BoxFit.cover,
                            frameBuilder: (ctx, child, _, __) => Image.asset("assets/images/product_placeholder.png"),
                          ),
                        ),
                      ),
                      SizedBox(width: kDefaultPadding),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("This is a Test Name fsdf sd fs", style: textTheme.headline6, overflow: TextOverflow.ellipsis),
                            Text("by John Wick", style: textTheme.bodyText2, overflow: TextOverflow.ellipsis),
                            SizedBox(height: kDefaultPadding / 2),
                            Chips(items: List<String>.generate(20, (idx) => "item $idx"), collapsable: false)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: kDefaultPadding / 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.accentColor,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5)),
                    ),
                    padding: const EdgeInsets.only(left: 3, right: 3, top: 14, bottom: 6),
                    child: Icon(Icons.bookmark_rounded, color: Colors.white, size: 15),
                  ),
                ),
              ],
            ),
            secondaryActions: <Widget>[
              IconSlideAction(
                color: Color(0xFFF06F6F),
                icon: Icons.delete,
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, idx) => SizedBox(height: kDefaultPadding),
      itemCount: 20,
    );
  }
}
