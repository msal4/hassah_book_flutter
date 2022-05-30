import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/pages/search.dart';
import 'package:hassah_book_flutter/app/widgets/products_row.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/utils/ext.dart';
import 'package:hassah_book_flutter/common/widgets/loading_indicator.dart';
import 'package:hassah_book_flutter/common/widgets/retry.dart';
import 'package:hassah_book_flutter/graphql/home.query.graphql.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    final leftPadding = padding.left + kDefaultPadding;
    final rightPadding = padding.right + kDefaultPadding;
    final topSafeAreaPadding = padding.top + kAppBarHeight;

    return Query(
      options: QueryOptions(document: queryDocumentHome),
      builder: (QueryResult result,
          {Future<QueryResult?> Function()? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          print(result.exception);
          return Retry(
            message: context.loc!.somethingWentWrong,
            onRetry: refetch,
          );
        }

        if (result.isLoading) {
          return const LoadingIndicator();
        }

        print(result.data);

        final home = Query$Home.fromJson(result.data!);
        // // Remove empty rows
        // home.categories.items = home.categories.items
        //     .where((cat) => cat.products.items.isNotEmpty)
        //     .toList();

        return ListView.separated(
          padding:
              EdgeInsets.only(top: topSafeAreaPadding, bottom: kDefaultPadding),
          separatorBuilder: (ctx, idx) =>
              const SizedBox(height: kDefaultPadding / 2),
          itemCount: (home.categories.items.length) + 1,
          itemBuilder: (_, index) {
            if (index == 0) {
              return Padding(
                padding:
                    EdgeInsets.only(right: rightPadding, left: leftPadding),
                child: const SearchBox(),
              );
            }

            final category = home.categories.items[index - 1];
            return ProductsRow(
              title: category.name,
              items: category.products.items,
            );
          },
        );
      },
    );
  }
}

class SearchBox extends HookWidget {
  const SearchBox();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kDefaultBorderRadius),
          color: Colors.grey.shade100),
      child: TextField(
        onTap: () {
          Navigator.of(context).pushNamed(SearchPage.routeName);
        },
        readOnly: true,
        style: textTheme.headline6,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: Colors.grey.shade800),
          hintText: context.loc!.search,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
