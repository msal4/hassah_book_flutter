import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/auth_provider.dart';
import 'package:hassah_book_flutter/app/pages/login.dart';
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
import 'package:provider/provider.dart';

class OrdersPage extends StatelessWidget {
  static const routeName = "/orders";

  final _myOrdersQuery = MyOrdersQuery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Orders")),
      body: Query(
        options: QueryOptions(document: _myOrdersQuery.document),
        builder: (result, {fetchMore, refetch}) {
          return _OrdersList(query: _myOrdersQuery, result: result, fetchMore: fetchMore, refetch: refetch);
        },
      ),
    );
  }
}

class _OrdersList extends HookWidget {
  const _OrdersList({@required this.query, @required this.result, @required this.fetchMore, @required this.refetch})
      : assert(query != null),
        assert(result != null),
        assert(fetchMore != null),
        assert(refetch != null);

  final MyOrdersQuery query;
  final QueryResult result;
  final Future<QueryResult> Function() refetch;
  final Future<QueryResult> Function(FetchMoreOptions) fetchMore;

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    final auth = context.watch<AuthProvider>();
    final theme = Theme.of(context);

    useEffect(() {
      if (auth.isAuthenticated) Future.microtask(refetch);
      return;
    }, [auth.isAuthenticated]);

    if (!auth.isAuthenticated) {
      return Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login to see your orders", style: theme.textTheme.subtitle1),
            SizedBox(height: kDefaultPadding),
            Material(
              color: theme.accentColor,
              borderRadius: BorderRadius.circular(9999),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(LoginPage.routeName);
                },
                child: Ink(
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding),
                  child: Text(
                    "LOGIN",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.button.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (result.hasException) {
      return Retry(message: result.exception.toString(), onRetry: refetch);
    }

    if (result.isLoading && result.data == null) {
      return LoadingIndicator();
    }

    final orders = query.parse(result.data).myOrders;

    if (orders.items.length == 0) {
      return _buildPlaceholder(context);
    }

    return RefreshIndicator(
      onRefresh: refetch,
      child: PaginationHandler(
        enabled: !result.isLoading && orders.items.length < orders.total,
        fetchMore: () {
          final options = FetchMoreOptions(
            document: query.document,
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

  Widget _buildPlaceholder(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      "You have no orders.",
      style: theme.textTheme.headline5.copyWith(fontWeight: FontWeight.w300),
      textAlign: TextAlign.center,
    );
  }
}
