import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hassah_book_flutter/app/widgets/chips.dart';
import 'package:hassah_book_flutter/app/widgets/round_container.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/widgets/product_card.dart';

const _kActionExtentRatio = .25;

const _kBookmarkIconWidth = 20.0;
const _kBookmarkIconHeight = 35.0;

class BookmarksPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    return ListView.separated(
      padding: EdgeInsets.only(
        top: padding.top + kAppBarHeight,
        bottom: padding.bottom + kDefaultPadding,
        left: padding.left + kDefaultPadding,
        right: padding.right + kDefaultPadding,
      ),
      itemBuilder: (context, idx) {
        // ClipRRect is needed so that the action doesn't animate beyond the bound of the product container.
        return ClipRRect(
          borderRadius: BorderRadius.circular(kDefaultRadius),
          child: Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: _kActionExtentRatio,
            child: _buildBookmarkedProduct(context, idx),
            secondaryActions: <Widget>[IconSlideAction(color: Color(0xFFF06F6F), icon: Icons.delete)],
          ),
        );
      },
      separatorBuilder: (context, idx) => SizedBox(height: kDefaultPadding),
      itemCount: 20,
    );
  }

  Widget _buildBookmarkedProduct(BuildContext context, int index) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        RoundContainer(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2).copyWith(
            left: kDefaultPadding,
            right: kDefaultPadding * 2,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(""),
              SizedBox(width: kDefaultPadding),
              Expanded(child: _buildProductInfo(theme.textTheme)),
            ],
          ),
        ),
        Positioned(right: kDefaultPadding / 2, child: _buildBookmarkIcon(theme.accentColor)),
      ],
    );
  }

  Widget _buildProductInfo(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("This is a Test Name fsdf sd fs", style: textTheme.headline6, overflow: TextOverflow.ellipsis),
        Text("by John Wick", style: textTheme.bodyText2, overflow: TextOverflow.ellipsis),
        SizedBox(height: kDefaultPadding / 2),
        Chips(items: List<String>.generate(20, (idx) => "item $idx"), collapsable: false)
      ],
    );
  }

  Widget _buildBookmarkIcon(Color color) {
    return Container(
      width: _kBookmarkIconWidth,
      height: _kBookmarkIconHeight,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5)),
      ),
      padding: const EdgeInsets.only(top: _kBookmarkIconHeight / 4),
      child: Icon(Icons.bookmark_rounded, color: Colors.white, size: 15),
    );
  }

  Widget _buildImage(String url) {
    return Container(
      width: kDefaultImageWidth / 2,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(kDefaultRadius)),
      child: Image.network(
        url,
        fit: BoxFit.cover,
        frameBuilder: (ctx, child, _, __) => Image.asset("assets/images/product_placeholder.png"),
      ),
    );
  }
}
