import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/widgets/pagination_handler.dart';
import 'package:hassah_book_flutter/app/widgets/product_details_card.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/utils/pagination.dart';
import 'package:hassah_book_flutter/common/widgets/loading_indicator.dart';
import 'package:hassah_book_flutter/common/widgets/retry.dart';

class BookmarksPage extends StatelessWidget {
  final _bookmarksQuery = BookmarksQuery();
  final _removeBookmarkMutation = RemoveBookmarkMutation();

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(document: _bookmarksQuery.document),
      builder: (QueryResult result, {Future<QueryResult> Function(FetchMoreOptions) fetchMore, Future<QueryResult> Function() refetch}) {
        if (result.hasException && result.data == null) {
          return Retry(message: result.exception.toString(), onRetry: refetch);
        }

        if (result.isLoading && result.data == null) {
          return LoadingIndicator();
        }

        final bookmarks = _bookmarksQuery.parse(result.data).bookmarks;

        // Remove empty rows
        return RefreshIndicator(
          onRefresh: refetch,
          child: PaginationHandler(
              enabled: !result.isLoading && bookmarks.items.length != bookmarks.total,
              fetchMore: () {
                final options = FetchMoreOptions(
                  document: _bookmarksQuery.document,
                  updateQuery: (oldData, newData) => updatePaginatedResponse(oldData, newData, "bookmarks"),
                  variables: {"skip": bookmarks.items.length},
                );

                fetchMore(options);
              },
              child: _buildBookmarksList(context, bookmarks, refetch)),
        );
      },
    );
  }

  Widget _buildBookmarksList(BuildContext context, Bookmarks$Query$Bookmarks bookmarks, Future<QueryResult> refetch()) {
    final padding = MediaQuery.of(context).padding;

    return ListView.separated(
      padding: EdgeInsets.only(
        top: padding.top + kAppBarHeight,
        bottom: padding.bottom + kDefaultPadding,
        left: padding.left + kDefaultPadding,
        right: padding.right + kDefaultPadding,
      ),
      itemCount: bookmarks.items.length == 0 ? 1 : bookmarks.items.length,
      itemBuilder: (context, idx) {
        if (bookmarks.items.length == 0) return _buildPlaceholder(context);

        final bookmark = bookmarks.items[idx];
        return _buildItem(bookmark, refetch);
      },
      separatorBuilder: (context, idx) => SizedBox(height: kDefaultPadding),
    );
  }

  Widget _buildItem(BookmarkMixin bookmark, Future<void> Function() refetch) {
    // ClipRRect is needed so that the action doesn't animate beyond the bound of the product container.
    return ClipRRect(
      borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      child: GraphQLConsumer(
        builder: (client) {
          return Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: kSlidableActionExtentRatio,
            child: ProductDetailsCard(
              product: bookmark.product,
              isBookmarked: true,
              onBookmarkTap: () => _removeBookmark(client, bookmark.product.id, refetch),
            ),
            secondaryActions: <Widget>[
              IconSlideAction(
                onTap: () => _removeBookmark(client, bookmark.product.id, refetch),
                color: kDangerColor,
                iconWidget: SvgPicture.asset("assets/svg/trash.svg", width: kDefaultIconSize),
              )
            ],
          );
        },
      ),
    );
  }

  Future<void> _removeBookmark(GraphQLClient client, String productId, Future<void> Function() refetch) async {
    await client.mutate(MutationOptions(document: _removeBookmarkMutation.document, variables: {'productId': productId}));
    return await refetch();
  }

  Widget _buildPlaceholder(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      "You don't have any bookmarks.",
      style: theme.textTheme.headline5.copyWith(fontWeight: FontWeight.w300),
      textAlign: TextAlign.center,
    );
  }
}
