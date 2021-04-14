import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/widgets/pagination_handler.dart';
import 'package:hassah_book_flutter/app/widgets/round_container.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/widgets/loading_indicator.dart';
import 'package:hassah_book_flutter/common/widgets/retry.dart';

class CategoriesPage extends HookWidget {
  final _categoriesQuery = CategoriesQuery();

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    return Query(
      options: QueryOptions(document: _categoriesQuery.document),
      builder: (result, {fetchMore, refetch}) {
        if (result.isLoading && result.data == null) {
          return LoadingIndicator();
        }

        if (result.hasException) {
          return Retry(message: result.exception.toString(), onRetry: refetch);
        }

        final data = _categoriesQuery.parse(result.data);

        return PaginationHandler(
          enabled: !result.isLoading && data.categories.items.length != data.categories.total,
          fetchMore: () {
            final options = FetchMoreOptions(
              document: _categoriesQuery.document,
              updateQuery: _updatePaginatedQuery,
              variables: {"skip": data.categories.items.length},
            );

            fetchMore(options);
          },
          child: ListView.separated(
            padding: EdgeInsets.all(kDefaultPadding).copyWith(
              top: padding.top + kAppBarHeight,
              bottom: padding.bottom + kDefaultPadding,
            ),
            itemBuilder: (context, idx) {
              return _buildCategoryItem(context, data.categories.items[idx]);
            },
            separatorBuilder: (context, idx) => SizedBox(height: kDefaultPadding),
            itemCount: data.categories.items.length,
          ),
        );
      },
    );
  }

  Map<String, dynamic> _updatePaginatedQuery(oldData, newData) {
    final oldDataParsed = _categoriesQuery.parse(oldData);
    final newDataParsed = _categoriesQuery.parse(newData);

    final items = [...oldDataParsed.categories.items, ...newDataParsed.categories.items];

    newDataParsed.categories.items = items;

    return newDataParsed.toJson();
  }

  Widget _buildCategoryItem(BuildContext context, CategoryMixin cat) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      key: Key(cat.id),
      onTap: () {},
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
              style: textTheme.subtitle1.copyWith(color: Colors.grey.shade800),
            ),
            Icon(Icons.chevron_right, color: Colors.grey.shade800)
          ],
        ),
      ),
    );
  }
}
