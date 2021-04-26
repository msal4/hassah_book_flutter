import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/widgets/chips.dart';
import 'package:hassah_book_flutter/app/widgets/round_container.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/widgets/loading_indicator.dart';
import 'package:hassah_book_flutter/common/widgets/product_card.dart';
import 'package:hassah_book_flutter/common/widgets/retry.dart';

const _kBookmarkIconWidth = 20.0;
const _kBookmarkIconHeight = 35.0;

class BookmarksPage extends HookWidget {
  final _bookmarksQuery = BookmarksQuery();

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    return Query(
      options: QueryOptions(document: _bookmarksQuery.document),
      builder: (QueryResult result, {Future<QueryResult> Function(FetchMoreOptions) fetchMore, Future<QueryResult> Function() refetch}) {
        if (result.hasException) {
          return Retry(message: result.exception.toString(), onRetry: refetch);
        }

        if (result.isLoading) {
          return LoadingIndicator();
        }

        final bookmarks = _bookmarksQuery.parse(result.data).bookmarks;

        // Remove empty rows
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
              borderRadius: BorderRadius.circular(kDefaultBorderRadius),
              child: Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: kSlidableActionExtentRatio,
                child: _buildBookmarkedProduct(context, bookmarks.items[idx]),
                secondaryActions: <Widget>[IconSlideAction(color: Color(0xFFF06F6F), icon: Icons.delete)],
              ),
            );
          },
          separatorBuilder: (context, idx) => SizedBox(height: kDefaultPadding),
          itemCount: bookmarks.items.length,
        );
      },
    );
  }

  Widget _buildBookmarkedProduct(BuildContext context, BookmarkMixin bookmark) {
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
              _buildImage(bookmark.product.image),
              SizedBox(width: kDefaultPadding),
              Expanded(child: _buildProductInfo(theme.textTheme, bookmark.product)),
            ],
          ),
        ),
        Positioned(right: kDefaultPadding / 2, child: _buildBookmarkIcon(theme.accentColor)),
      ],
    );
  }

  Widget _buildProductInfo(TextTheme textTheme, ProductMixin product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.name, style: textTheme.headline6, overflow: TextOverflow.ellipsis),
        Text("by ${product.author.name}", style: textTheme.bodyText2, overflow: TextOverflow.ellipsis),
        SizedBox(height: kDefaultPadding / 2),
        Chips(items: product.categories.map((e) => e.name).toList(), collapsable: false)
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
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(kDefaultBorderRadius)),
      child: Image.network(
        url,
        fit: BoxFit.cover,
        frameBuilder: (ctx, child, _, __) => Image.asset("assets/images/product_placeholder.png"),
      ),
    );
  }
}
