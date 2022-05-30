import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/pages/search.dart';
import 'package:hassah_book_flutter/app/widgets/pagination_handler.dart';
import 'package:hassah_book_flutter/app/widgets/round_container.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/utils/ext.dart';
import 'package:hassah_book_flutter/common/widgets/loading_indicator.dart';
import 'package:hassah_book_flutter/common/widgets/retry.dart';
import 'package:hassah_book_flutter/graphql/categories.query.graphql.dart';
import 'package:hassah_book_flutter/graphql/category.fragment.graphql.dart';

class CategoriesPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    return Query(
      options: QueryOptions(
        document: queryDocumentCategories,
        variables: {"take": 100},
      ),
      builder: (result, {fetchMore, refetch}) {
        if (result.isLoading && result.data == null ||
            result.data!["categories"] == null) {
          return const LoadingIndicator();
        }

        if (result.hasException) {
          return Retry(
            message: context.loc!.somethingWentWrong,
            onRetry: refetch,
          );
        }

        final data = Query$Categories.fromJson(result.data!);

        return PaginationHandler(
          enabled: !result.isLoading &&
              data.categories.items.length != data.categories.total,
          fetchMore: () {
            final options = FetchMoreOptions(
              document: queryDocumentCategories,
              updateQuery: _updatePaginatedQuery,
              variables: {"skip": data.categories.items.length, "take": 100},
            );

            fetchMore!(options);
          },
          child: ListView.separated(
            padding: EdgeInsets.all(kDefaultPadding).copyWith(
              top: padding.top + kAppBarHeight,
              bottom: padding.bottom + kDefaultPadding,
            ),
            itemBuilder: (context, idx) {
              return _buildCategoryItem(context, data.categories.items[idx]);
            },
            separatorBuilder: (context, idx) =>
                const SizedBox(height: kDefaultPadding),
            itemCount: data.categories.items.length,
          ),
        );
      },
    );
  }

  Map<String, dynamic> _updatePaginatedQuery(oldData, newData) {
    final items = [
      ...oldData["categories"]["items"],
      ...newData["categories"]["items"]
    ];

    return {
      ...newData,
      "categories":
          Map<String, dynamic>.from({...newData["categories"], "items": items})
    };
  }

  Widget _buildCategoryItem(BuildContext context, Fragment$Category cat) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      key: Key(cat.id),
      onTap: () {
        Navigator.pushNamed(
          context,
          SearchPage.routeName,
          arguments: SearchPageArguments(categoryID: cat.id),
        );
      },
      child: RoundContainer(
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              cat.name,
              style: textTheme.subtitle1!.copyWith(color: Colors.grey.shade800),
            ),
            Icon(Icons.chevron_right, color: Colors.grey.shade800)
          ],
        ),
      ),
    );
  }
}
