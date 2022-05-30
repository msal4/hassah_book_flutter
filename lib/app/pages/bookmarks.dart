import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/auth_provider.dart';
import 'package:hassah_book_flutter/app/bookmarks_provider.dart';
import 'package:hassah_book_flutter/app/pages/login.dart';
import 'package:hassah_book_flutter/app/widgets/pagination_handler.dart';
import 'package:hassah_book_flutter/app/widgets/product_details_card.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/utils/ext.dart';
import 'package:hassah_book_flutter/common/widgets/loading_indicator.dart';
import 'package:hassah_book_flutter/common/widgets/retry.dart';
import 'package:hassah_book_flutter/graphql/bookmark.fragment.graphql.dart';
import 'package:provider/provider.dart';

class BookmarksPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final bookmarks = context.watch<BookmarksProvider>();
    final auth = context.watch<AuthProvider>();
    final theme = Theme.of(context);

    final isLoading = bookmarks.isLoading;
    final hasException = bookmarks.hasException;
    final data = bookmarks.bookmarks;

    useEffect(() {
      if (auth.isAuthenticated) Future.microtask(bookmarks.getBookmarks);
      return;
    }, [auth.isAuthenticated]);

    if (!auth.isAuthenticated) {
      return Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.loc!.loginToSeeYourBookmarks,
              style: theme.textTheme.subtitle1,
            ),
            const SizedBox(height: kDefaultPadding),
            Material(
              color: theme.colorScheme.secondary,
              borderRadius: BorderRadius.circular(9999),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(LoginPage.routeName);
                },
                child: Ink(
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 1.5,
                    vertical: kDefaultPadding,
                  ),
                  child: Text(
                    context.loc!.login.toUpperCase(),
                    textAlign: TextAlign.center,
                    style:
                        theme.textTheme.button!.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (hasException) {
      return Retry(
        message: context.loc!.somethingWentWrong,
        onRetry: bookmarks.getBookmarks,
      );
    }

    if (isLoading && data == null) {
      return const LoadingIndicator();
    }

    return RefreshIndicator(
      onRefresh: bookmarks.getBookmarks,
      child: PaginationHandler(
        enabled: !isLoading && data?.items.length != data?.total,
        fetchMore: bookmarks.fetchMore,
        child: _buildBookmarksList(context, bookmarks),
      ),
    );
  }

  Widget _buildBookmarksList(
      BuildContext context, BookmarksProvider bookmarks) {
    final padding = MediaQuery.of(context).padding;
    final items = bookmarks.bookmarks?.items ?? [];

    return ListView.separated(
      padding: EdgeInsets.only(
        top: padding.top + kAppBarHeight,
        bottom: padding.bottom + kDefaultPadding,
        left: padding.left + kDefaultPadding,
        right: padding.right + kDefaultPadding,
      ),
      itemCount: items.length == 0 ? 1 : items.length,
      itemBuilder: (context, idx) {
        if (items.length == 0) return _buildPlaceholder(context);

        return _buildItem(items[idx], bookmarks);
      },
      separatorBuilder: (context, idx) =>
          const SizedBox(height: kDefaultPadding),
    );
  }

  Widget _buildItem(Fragment$Bookmark bookmark, BookmarksProvider bookmarks) {
    // ClipRRect is needed so that the action doesn't animate beyond the bound of the product container.
    return ClipRRect(
      borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      child: GraphQLConsumer(
        builder: (client) {
          return Slidable(
            startActionPane: ActionPane(
              motion: const DrawerMotion(),
              extentRatio: kSlidableActionExtentRatio,
              children: [
                SlidableAction(
                  onPressed: (context) =>
                      bookmarks.removeBookmark(bookmark.product.id),
                  backgroundColor: kDangerColor,
                  icon: Icons.delete,
                )
              ],
            ),
            child: ProductDetailsCard(
              product: bookmark.product,
              isBookmarked: true,
              onBookmarkTap: () =>
                  bookmarks.removeBookmark(bookmark.product.id),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      context.loc!.youDontHaveBookmarks,
      style: theme.textTheme.headline5!.copyWith(fontWeight: FontWeight.w300),
      textAlign: TextAlign.center,
    );
  }
}
