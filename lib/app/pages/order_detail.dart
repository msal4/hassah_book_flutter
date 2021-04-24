import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/widgets/round_container.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/widgets/loading_indicator.dart';
import 'package:hassah_book_flutter/common/widgets/product_card.dart';
import 'package:hassah_book_flutter/common/widgets/retry.dart';
import 'package:hassah_book_flutter/common/widgets/unfocus_on_tap.dart';

const _kBottomSheetMinExtent = 20.0;
const _kBottomSheetMinHeight = 550.0;

class OrderDetailPageArguments {
  const OrderDetailPageArguments({@required this.orderId}) : assert(orderId != null);

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
    final minSheetSize = (padding.bottom + _kBottomSheetMinExtent) / size.height;
    final initialSheetHeight = min(_kBottomSheetMinHeight / size.height, 1.0);

    return UnfocusOnTap(
      child: Query(
        options: QueryOptions(document: _orderQuery.document, variables: {"id": orderId}),
        builder: (result, {refetch, fetchMore}) {
          if (result.hasException) {
            return Retry(message: result.exception.toString(), onRetry: refetch);
          }

          if (result.isLoading) {
            return LoadingIndicator();
          }

          final order = _orderQuery.parse(result.data).order;

          return Scaffold(
            bottomSheet: _buildBottomSheet(context, initialSheetHeight, minSheetSize, order),
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(title: Text("Cart"), floating: true, snap: true),
              ],
              body: _buildPurchasesList(context, order.purchases.items),
            ),
          );
        },
      ),
    );
  }

  ListView _buildPurchasesList(BuildContext context, List<PurchaseMixin> items) {
    final theme = Theme.of(context);
    final padding = MediaQuery.of(context).padding;

    return ListView.separated(
      padding: EdgeInsets.all(kDefaultPadding).copyWith(
        bottom: kDefaultPadding + padding.bottom + _kBottomSheetMinExtent,
      ),
      itemBuilder: (context, idx) {
        final item = items[idx];

        return RoundContainer(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(item.product.image),
              SizedBox(width: kDefaultPadding),
              Expanded(child: _buildProductInfo(context, theme, item)),
            ],
          ),
        );
      },
      separatorBuilder: (context, idx) => SizedBox(height: kDefaultPadding),
      itemCount: items.length,
    );
  }

  Widget _buildProductInfo(BuildContext context, ThemeData theme, PurchaseMixin item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.product.name, style: theme.textTheme.headline6, overflow: TextOverflow.ellipsis),
        Text("by ${item.product.author.name}", style: theme.textTheme.bodyText2, overflow: TextOverflow.ellipsis),
        SizedBox(height: kDefaultPadding / 2),
        Text(
          "${item.product.price * item.quantity} IQD",
          style: theme.textTheme.subtitle1.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.accentColor,
          ),
        )
      ],
    );
  }

  Widget _buildImage(String url) {
    return Container(
      width: kDefaultImageWidth / 2,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(kDefaultBorderRadius)),
      child: Image.network(
        url,
        fit: BoxFit.cover,
        frameBuilder: (ctx, child, _, __) => Image.asset("assets/images/product_placeholder.png"),
      ),
    );
  }

  DraggableScrollableSheet _buildBottomSheet(BuildContext context, double initialSheetHeight, double minSheetSize, OrderMixin order) {
    final theme = Theme.of(context);
    final padding = MediaQuery.of(context).padding;

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: initialSheetHeight,
      minChildSize: minSheetSize,
      builder: (BuildContext context, ScrollController scrollController) {
        return Mutation(
          options: MutationOptions(document: _cancelOrderMutation.document, variables: {"id": orderId}),
          builder: (runMutation, result) {
            return Container(
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kDefaultBorderRadius * 2),
                  topRight: Radius.circular(kDefaultBorderRadius * 2),
                ),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(.1), blurRadius: 10)],
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
                          Text("Total", style: theme.textTheme.headline6),
                          Spacer(),
                          Text(
                            "${order.totalPrice} IQD",
                            style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: kDefaultPadding),
                      Divider(),
                      SizedBox(height: kDefaultPadding),
                      GestureDetector(
                        onTap: result.isNotLoading
                            ? () async {
                                final result = await runMutation({"id": orderId}).networkResult;

                                if (result.hasException) {
                                  return;
                                }
                                if (result.isConcrete) {
                                  debugPrint(result.data.toString());
                                }
                              }
                            : null,
                        child: RoundContainer(
                          padding: const EdgeInsets.all(kDefaultPadding),
                          color: result.isLoading ? Colors.grey.shade800 : theme.accentColor,
                          borderRadius: BorderRadius.circular(9999),
                          child: Text(
                            "ORDER NOW",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.button.copyWith(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                  Align(
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
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
