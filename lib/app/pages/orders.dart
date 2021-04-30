import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/pages/order_detail.dart';
import 'package:hassah_book_flutter/app/widgets/pagination_handler.dart';
import 'package:hassah_book_flutter/app/widgets/round_container.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/utils/order.dart';
import 'package:hassah_book_flutter/common/utils/pagination.dart';
import 'package:hassah_book_flutter/common/widgets/loading_indicator.dart';
import 'package:hassah_book_flutter/common/widgets/product_card.dart';
import 'package:hassah_book_flutter/common/widgets/retry.dart';

class OrdersPage extends HookWidget {
  static const routeName = "/orders";

  final _myOrdersQuery = MyOrdersQuery();

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
      appBar: AppBar(title: Text("My Orders")),
      body: Query(
        options: QueryOptions(document: _myOrdersQuery.document),
        builder: (result, {fetchMore, refetch}) {
          if (result.hasException) {
            return Retry(message: result.exception.toString(), onRetry: refetch);
          }
          if (result.isLoading && result.data == null) {
            return LoadingIndicator();
          }

          final orders = _myOrdersQuery.parse(result.data).myOrders;

          return RefreshIndicator(
            onRefresh: refetch,
            child: PaginationHandler(
              enabled: !result.isLoading && orders.items.length < orders.total,
              fetchMore: () {
                final options = FetchMoreOptions(
                  document: _myOrdersQuery.document,
                  updateQuery: (oldData, newData) => updatePaginatedResponse(oldData, newData, "myOrders"),
                  variables: {"skip": orders.items.length},
                );

                fetchMore(options);
              },
              child: ListView.separated(
                padding: EdgeInsets.only(
                  top: kDefaultPadding,
                  bottom: padding.bottom + kDefaultPadding,
                  left: padding.left + kDefaultPadding,
                  right: padding.right + kDefaultPadding,
                ),
                itemBuilder: (context, idx) {
                  final order = orders.items[idx];
                  return _buildOrder(context, order: order, morePurchasesCount: order.purchases.total - 1, productImage: order.purchases.items[0].product.image);
                },
                separatorBuilder: (context, idx) => SizedBox(height: kDefaultPadding),
                itemCount: orders.items.length,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildOrder(BuildContext context, {@required OrderMixin order, @required int morePurchasesCount, @required String productImage}) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, OrderDetailPage.routeName, arguments: OrderDetailPageArguments(orderId: order.id));
      },
      child: RoundContainer(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildImage(productImage),
                if (morePurchasesCount > 0) ...[
                  SizedBox(width: kDefaultPadding),
                  Padding(
                    padding: const EdgeInsets.only(bottom: kDefaultPadding / 2),
                    child: Text("+$morePurchasesCount", style: theme.textTheme.subtitle1),
                  )
                ],
              ],
            ),
            SizedBox(width: kDefaultPadding),
            _buildDivider(),
            SizedBox(width: kDefaultPadding),
            Column(
              children: [
                Text(
                  "Status",
                  style: theme.textTheme.bodyText1.copyWith(color: Colors.grey.shade600),
                ),
                Text(humanizeOrderStatus(order.status), style: theme.textTheme.subtitle1),
              ],
            ),
            SizedBox(width: kDefaultPadding),
            _buildDivider(),
            SizedBox(width: kDefaultPadding),
            Column(
              children: [
                Text(
                  "Total",
                  style: theme.textTheme.bodyText1.copyWith(color: Colors.grey.shade600),
                ),
                Text("${order.totalPrice} IQD", style: theme.textTheme.subtitle1),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String url) {
    return Container(
      width: kDefaultImageWidth / 3,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(kDefaultBorderRadius)),
      child: Image.network(
        url,
        fit: BoxFit.cover,
        frameBuilder: (ctx, child, _, __) => Image.asset("assets/images/product_placeholder.png"),
      ),
    );
  }

  Widget _buildDivider() {
    return Center(
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(width: 1, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
