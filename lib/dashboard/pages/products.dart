import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/widgets/loading_indicator.dart';
import 'package:hassah_book_flutter/common/widgets/product_card.dart';
import 'package:hassah_book_flutter/common/widgets/retry.dart';

class ProductsPage extends HookWidget {
  static const routeName = "/products";

  final _productsQuery = ProductsQuery();

  @override
  Widget build(BuildContext context) {
    return Query(
      builder: (result, {fetchMore, refetch}) {
        if (result.loading) {
          return const LoadingIndicator();
        }

        if (result.hasException) {
          return Retry(message: result.exception.toString(), onRetry: refetch);
        }

        final data = _productsQuery.parse(result.data);

        return GridView.builder(
          itemCount: data.products.items.length,
          itemBuilder: (context, index) {
            return ProductCard(product: data.products.items[index]);
          },
          gridDelegate:
              SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200),
        );
      },
      options: QueryOptions(documentNode: _productsQuery.document),
    );
  }
}
