import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/pages/product_detail.dart';
import 'package:hassah_book_flutter/app/widgets/round_container.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/utils/ext.dart';
import 'package:hassah_book_flutter/common/utils/order.dart';
import 'package:hassah_book_flutter/common/utils/rand.dart';
import 'package:hassah_book_flutter/common/widgets/loading_indicator.dart';
import 'package:hassah_book_flutter/common/widgets/product_card.dart';
import 'package:hassah_book_flutter/common/widgets/retry.dart';
import 'package:hassah_book_flutter/common/widgets/unfocus_on_tap.dart';
import 'package:intl/intl.dart';

const _kBottomSheetMinExtent = 20.0;
const _kBottomSheetMinHeight = 460.0;

const _kStatusIconLineThickness = 4.0;
const _kCircleIconRadius = 25.0;

final _kGreenStatusColor = Colors.greenAccent.shade700;
final _kPendingStatusColor = Colors.yellow.shade700;
final _kDefaultStatusColor = Colors.grey.shade800;

const _kQueryPollInterval = Duration(seconds: 10);

class OrderStatusInfo {
  const OrderStatusInfo([this.status = OrderStatus.pending])
      : assert(status != null);

  final OrderStatus status;

  int get index => _indexes[status];

  final _indexes = const {
    OrderStatus.canceled: -2,
    OrderStatus.failed: -1,
    OrderStatus.pending: 0,
    OrderStatus.processed: 1,
    OrderStatus.delivering: 2,
    OrderStatus.delivered: 3,
  };
}

class OrderDetailPageArguments {
  const OrderDetailPageArguments({@required this.orderId})
      : assert(orderId != null);

  final String orderId;
}

class OrderDetailPage extends StatelessWidget {
  OrderDetailPage({@required this.orderId}) : assert(orderId != null);

  final String orderId;

  static const routeName = "/order_detail";

  final _orderQuery = OrderQuery();
  final _cancelOrderMutation = CancelOrderMutation();

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    final size = MediaQuery.of(context).size;

    // Get the min bottom sheet height fraction.
    final minSheetSize =
        (padding.bottom + _kBottomSheetMinExtent) / size.height;
    final initialSheetHeight = min(_kBottomSheetMinHeight / size.height, 1.0);

    return UnfocusOnTap(
      child: Query(
        options: QueryOptions(
          document: _orderQuery.document,
          variables: {"id": orderId},
          pollInterval: _kQueryPollInterval,
        ),
        builder: (result, {refetch, fetchMore}) {
          final appBarTitle = Text(context.loc.orderDetails);

          if (result.hasException) {
            return Scaffold(
              appBar: AppBar(title: appBarTitle),
              body:
                  Retry(message: result.exception.toString(), onRetry: refetch),
            );
          }

          if (result.isLoading) {
            return Scaffold(
              appBar: AppBar(title: appBarTitle),
              body: LoadingIndicator(),
            );
          }

          final order = _orderQuery.parse(result.data).order;

          return Scaffold(
            bottomSheet: _buildBottomSheet(
                context, initialSheetHeight, minSheetSize, order, refetch),
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                    title: Text("${context.loc.order} #${order.orderNumber}"),
                    floating: true,
                    snap: true),
              ],
              body: _buildPurchasesList(context, order.purchases.items),
            ),
          );
        },
      ),
    );
  }

  ListView _buildPurchasesList(
      BuildContext context, List<PurchaseMixin> items) {
    final padding = MediaQuery.of(context).padding;

    return ListView.separated(
      padding: EdgeInsets.all(kDefaultPadding).copyWith(
        bottom: kDefaultPadding + padding.bottom + _kBottomSheetMinExtent,
      ),
      itemBuilder: (context, idx) => PurchaseCard(purchase: items[idx]),
      separatorBuilder: (context, idx) => SizedBox(height: kDefaultPadding),
      itemCount: items.length,
    );
  }

  DraggableScrollableSheet _buildBottomSheet(
      BuildContext context,
      double initialSheetHeight,
      double minSheetSize,
      OrderMixin order,
      Future<QueryResult> Function() refetch) {
    final theme = Theme.of(context);
    final padding = MediaQuery.of(context).padding;

    final currentStatusInfo = OrderStatusInfo(order.status);

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: initialSheetHeight,
      minChildSize: minSheetSize,
      builder: (BuildContext context, ScrollController scrollController) {
        return Mutation(
          options: MutationOptions(
              document: _cancelOrderMutation.document,
              variables: {"id": orderId}),
          builder: (runMutation, result, {refresh}) {
            return Container(
              decoration: BoxDecoration(
                color: theme.backgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(kDefaultBorderRadius * 2),
                  topRight: const Radius.circular(kDefaultBorderRadius * 2),
                ),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(.1), blurRadius: 10)
                ],
              ),
              child: Stack(
                children: [
                  ListView(
                    padding: EdgeInsets.only(
                      top: padding.top + kDefaultPadding,
                      bottom: padding.bottom + kDefaultPadding,
                      left: padding.left + kDefaultPadding,
                      right: padding.right + kDefaultPadding,
                    ),
                    controller: scrollController,
                    children: [
                      Row(
                        children: [
                          Text(context.loc.total,
                              style: theme.textTheme.headline6),
                          const Spacer(),
                          Text("${order.totalPrice} ${context.loc.iqd}",
                              style: theme.textTheme.headline6),
                        ],
                      ),
                      const SizedBox(height: kDefaultPadding * 2),
                      Row(
                        children: [
                          ..._buildIconLine(
                            "pending",
                            OrderStatusInfo(),
                            currentStatusInfo,
                            false,
                          ),
                          ..._buildIconLine(
                            "processed",
                            OrderStatusInfo(OrderStatus.processed),
                            currentStatusInfo,
                          ),
                          ..._buildIconLine(
                            "car",
                            OrderStatusInfo(OrderStatus.delivering),
                            currentStatusInfo,
                          ),
                          ..._buildIconLine(
                            "delivered",
                            OrderStatusInfo(OrderStatus.delivered),
                            currentStatusInfo,
                          ),
                        ],
                      ),
                      const SizedBox(height: kDefaultPadding * 2),
                      RoundContainer(
                        color: theme.scaffoldBackgroundColor,
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  context.loc.status,
                                  style: theme.textTheme.bodyText1
                                      .copyWith(color: Colors.grey.shade600),
                                  textAlign: TextAlign.center,
                                ),
                                Text(humanizeOrderStatus(context, order.status),
                                    style: theme.textTheme.subtitle1
                                        .copyWith(color: order.status.color),
                                    textAlign: TextAlign.center),
                              ],
                            ),
                            const SizedBox(width: kDefaultPadding),
                            _buildDivider(),
                            const SizedBox(width: kDefaultPadding),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  context.loc.orderedOn,
                                  style: theme.textTheme.bodyText1
                                      .copyWith(color: Colors.grey.shade600),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                    DateFormat.yMEd()
                                        .format(order.createdAt.toLocal()),
                                    style: theme.textTheme.subtitle1,
                                    textAlign: TextAlign.center),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: kDefaultPadding * 2),
                      if (order.status == OrderStatus.pending)
                        GestureDetector(
                          onTap: result.isNotLoading
                              ? () =>
                                  _cancelOrder(context, runMutation, refetch)
                              : null,
                          child: RoundContainer(
                            padding: const EdgeInsets.all(kDefaultPadding),
                            color: result.isLoading
                                ? Colors.grey.shade600
                                : theme.scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(9999),
                            child: Text(
                              context.loc.cancel.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: theme.textTheme.button.copyWith(
                                  color: result.isLoading
                                      ? Colors.grey.shade200
                                      : Colors.grey.shade800),
                            ),
                          ),
                        )
                    ],
                  ),
                  _buildSwipeIndicator(),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Align _buildSwipeIndicator() {
    return Align(
      alignment: Alignment.topCenter,
      child: IgnorePointer(
        child: Container(
          margin: const EdgeInsets.only(top: kDefaultPadding),
          decoration: BoxDecoration(
            color: Colors.grey.shade500,
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
          ),
          width: 40,
          height: 4,
        ),
      ),
    );
  }

  Color _getColorByStatus(
      OrderStatusInfo status, OrderStatusInfo currentStatus) {
    if (currentStatus.status == OrderStatus.failed) {
      return kDangerColor;
    }

    if (status.status == OrderStatus.pending &&
        currentStatus.status == OrderStatus.pending) {
      return _kPendingStatusColor;
    } else if (status.index <= currentStatus.index) {
      return _kGreenStatusColor;
    } else {
      return _kDefaultStatusColor;
    }
  }

  List<Widget> _buildIconLine(String iconName, OrderStatusInfo status,
      OrderStatusInfo currentStatusInfo,
      [hasLine = true]) {
    final color = _getColorByStatus(status, currentStatusInfo);

    return [
      if (hasLine) _buildLine(color),
      _buildIcon(iconName, color),
    ];
  }

  Expanded _buildLine(Color color) {
    return Expanded(
      child: Container(
        height: _kStatusIconLineThickness,
        color: color,
      ),
    );
  }

  CircleAvatar _buildIcon(String name, Color color) {
    return CircleAvatar(
      radius: _kCircleIconRadius,
      backgroundColor: color,
      foregroundColor: Colors.white,
      child: SvgPicture.asset("assets/svg/$name.svg"),
    );
  }

  Future<void> _cancelOrder(
    BuildContext context,
    MultiSourceResult Function(Map<String, dynamic>, {Object optimisticResult})
        runMutation,
    Future<QueryResult> Function() refetch,
  ) async {
    final theme = Theme.of(context);

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(kDefaultBorderRadius * 2),
              topRight: Radius.circular(kDefaultBorderRadius * 2),
            ),
            color: theme.scaffoldBackgroundColor,
          ),
          padding: const EdgeInsets.all(kDefaultPadding),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  context.loc.cancelOrderConfirmation,
                  style: theme.textTheme.subtitle1,
                ),
                const SizedBox(height: kDefaultPadding),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Material(
                        color: theme.accentColor,
                        borderRadius: BorderRadius.circular(9999),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Ink(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding * 1.5,
                                vertical: kDefaultPadding),
                            child: Text(
                              context.loc.no.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: theme.textTheme.button
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: kDefaultPadding),
                    Expanded(
                      flex: 1,
                      child: Material(
                        color: theme.backgroundColor,
                        borderRadius: BorderRadius.circular(9999),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () async {
                            final result = await runMutation({"id": orderId})
                                .networkResult;

                            if (result.hasException) {
                              refetch();
                              Navigator.pop(context);
                              return;
                            }
                            if (result.isConcrete) {
                              debugPrint(result.data.toString());
                            }
                            refetch();
                            Navigator.pop(context);
                          },
                          child: Ink(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding * 1.5,
                                vertical: kDefaultPadding),
                            child: Text(
                              context.loc.yes.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: theme.textTheme.button,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
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

class PurchaseCard extends HookWidget {
  const PurchaseCard({@required this.purchase}) : assert(purchase != null);

  final PurchaseMixin purchase;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final heroTagPrefix = useMemoized(generateRandomString);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailPage.routeName,
          arguments: ProductDetailPageArguments(
              heroTagPrefix: heroTagPrefix, product: purchase.product),
        );
      },
      child: RoundContainer(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(heroTagPrefix),
            const SizedBox(width: kDefaultPadding),
            Expanded(
              child: _buildProductInfo(context, theme, purchase),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String heroTagPrefix) {
    return Hero(
      tag: "image-$heroTagPrefix-${purchase.product.id}",
      child: ProductCoverImage(
        image: purchase.product.image,
        width: kSmallProductImageWidth,
        resolution: 150,
      ),
    );
  }

  Widget _buildProductInfo(
      BuildContext context, ThemeData theme, PurchaseMixin item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.product.name,
            style: theme.textTheme.headline6, overflow: TextOverflow.ellipsis),
        Text("${context.loc.by} ${item.product.author.name}",
            style: theme.textTheme.bodyText2, overflow: TextOverflow.ellipsis),
        SizedBox(height: kDefaultPadding / 2),
        Row(
          children: [
            Text("${item.quantity} ${context.loc.items}"),
            Spacer(),
            Text(
              "${item.product.price * item.quantity} ${context.loc.iqd}",
              style: theme.textTheme.subtitle1.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.accentColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}
