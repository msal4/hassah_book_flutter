import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/widgets/products_row.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/widgets/loading_indicator.dart';
import 'package:hassah_book_flutter/common/widgets/retry.dart';

class HomePage extends StatelessWidget {
  final _homeQuery = HomeQuery();

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(documentNode: _homeQuery.document),
      builder: (
        QueryResult result, {
        Future<QueryResult> Function() refetch,
        FetchMore fetchMore,
      }) {
        if (result.hasException) {
          return Retry(message: result.exception.toString(), onRetry: refetch);
        }

        if (result.loading) {
          return LoadingIndicator();
        }

        final home = _homeQuery.parse(result.data);

        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 10),
          separatorBuilder: (ctx, idx) => SizedBox(height: 10),
          itemCount: home.categories.items.length + 1,
          itemBuilder: (_, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: SearchBox(),
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
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.only(left: kDefaultPadding),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultRadius),
        color: Colors.grey.shade100,
      ),
      child: TextField(
        style: textTheme.headline6,
        decoration: InputDecoration(
          icon: Icon(Icons.search),
          hintText: "Search",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
