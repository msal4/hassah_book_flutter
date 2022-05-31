import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/auth_provider.dart';
import 'package:hassah_book_flutter/app/models/cart_item.dart';
import 'package:hassah_book_flutter/app/pages/login.dart';
import 'package:hassah_book_flutter/app/pages/orders.dart';
import 'package:hassah_book_flutter/app/pages/product_detail.dart';
import 'package:hassah_book_flutter/app/widgets/round_container.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/utils/ext.dart';
import 'package:hassah_book_flutter/common/utils/price.dart';
import 'package:hassah_book_flutter/common/utils/snackbar.dart';
import 'package:hassah_book_flutter/common/widgets/product_card.dart';
import 'package:hassah_book_flutter/common/widgets/unfocus_on_tap.dart';
import 'package:hassah_book_flutter/graphql/me.query.graphql.dart';
import 'package:hassah_book_flutter/graphql/place_order.query.graphql.dart';
import 'package:hassah_book_flutter/schema.graphql.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

const _kBottomSheetMinExtent = 20.0;
const _kBottomSheetMinHeight = 550.0;

class CartPage extends StatefulWidget {
  static const routeName = "/cart";

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    final size = MediaQuery.of(context).size;
    // Get the min bottom sheet height fraction.
    final minSheetSize =
        (padding.bottom + _kBottomSheetMinExtent) / size.height;
    final initialSheetHeight = min(_kBottomSheetMinHeight / size.height, 1.0);

    return UnfocusOnTap(
      child: ValueListenableBuilder<Box<CartItem>>(
        valueListenable: Hive.box<CartItem>(kCartBoxName).listenable(),
        builder: (context, box, child) {
          final items = box.values.toList();

          return Scaffold(
            bottomSheet: OrderSheet(
              padding: padding,
              initialSheetHeight: initialSheetHeight,
              minSheetSize: minSheetSize,
              box: box,
            ),
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  title: Text(context.loc!.cart),
                  floating: true,
                  snap: true,
                ),
              ],
              body: items.length == 0
                  ? _buildPlaceholder(context)
                  : _buildItemsList(context, items),
            ),
          );
        },
      ),
    );
  }

  ListView _buildItemsList(BuildContext context, List<CartItem> items) {
    final theme = Theme.of(context);
    final padding = MediaQuery.of(context).padding;

    return ListView.separated(
      padding: EdgeInsets.all(kDefaultPadding).copyWith(
        bottom: kDefaultPadding + padding.bottom + _kBottomSheetMinExtent,
      ),
      itemBuilder: (context, idx) {
        final item = items[idx];

        return ClipRRect(
          key: Key(item.id),
          borderRadius: BorderRadius.circular(kDefaultBorderRadius),
          child: Slidable(
            startActionPane: ActionPane(
              motion: const DrawerMotion(),
              extentRatio: kSlidableActionExtentRatio,
              children: [
                SlidableAction(
                  backgroundColor: kDangerColor,
                  icon: Icons.delete,
                  onPressed: (context) => _deleteItem(context, item),
                )
              ],
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  ProductDetailPage.routeName,
                  arguments: ProductDetailPageArguments(
                    id: item.id,
                    heroTagPrefix: "none",
                  ),
                );
              },
              child: RoundContainer(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImage(item.image),
                    const SizedBox(width: kDefaultPadding),
                    Expanded(child: _buildProductInfo(context, theme, item)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, idx) => SizedBox(height: kDefaultPadding),
      itemCount: items.length,
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Text(
        context.loc!.yourCartIsEmpty + ".",
        style: theme.textTheme.headline5!.copyWith(fontWeight: FontWeight.w300),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildProductInfo(
      BuildContext context, ThemeData theme, CartItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.name,
            style: theme.textTheme.headline6, overflow: TextOverflow.ellipsis),
        Text("${context.loc!.by} ${item.authorName}",
            style: theme.textTheme.bodyText2, overflow: TextOverflow.ellipsis),
        const SizedBox(height: kDefaultPadding / 2),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                if (item.quantity == 1) {
                  return _deleteItem(context, item);
                }
                item.quantity--;
                item.save();
              },
              child: Icon(Icons.remove),
            ),
            const SizedBox(width: kDefaultPadding),
            Text(
              item.quantity.toString(),
              style: theme.textTheme.subtitle1!.copyWith(
                color: theme.colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: kDefaultPadding),
            GestureDetector(
              onTap: () {
                item.quantity++;
                item.save();
              },
              child: Icon(Icons.add),
            ),
            const Spacer(),
            Text(
              "${formatPrice(item.price * item.quantity)} ${context.loc!.iqd}",
              style: theme.textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.secondary,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildImage(String url) {
    return ProductCoverImage(
      image: url,
      width: kDefaultImageWidth / 2,
      resolution: 150,
    );
  }

  void _deleteItem(BuildContext context, CartItem item) {
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
                  context.loc!.removeItemFromCartConfirmation,
                  style: theme.textTheme.subtitle1,
                ),
                const SizedBox(height: kDefaultPadding),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Material(
                        color: theme.colorScheme.secondary,
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
                              context.loc!.cancel.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: theme.textTheme.button!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: kDefaultPadding),
                    Expanded(
                      flex: 1,
                      child: Material(
                        color: theme.backgroundColor,
                        borderRadius: BorderRadius.circular(9999),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () {
                            item.delete();
                            Navigator.pop(context);
                          },
                          child: Ink(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding * 1.5,
                                vertical: kDefaultPadding),
                            child: Text(
                              context.loc!.yes.toUpperCase(),
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
}

class OrderSheet extends HookWidget {
  OrderSheet({
    Key? key,
    required this.initialSheetHeight,
    required this.minSheetSize,
    required this.box,
    required this.padding,
  }) : super(key: key);

  final double initialSheetHeight;
  final double minSheetSize;
  final Box<CartItem> box;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final TextEditingController? phoneController = useTextEditingController();
    final TextEditingController? provinceController =
        useTextEditingController();
    final TextEditingController? addressController = useTextEditingController();

    final double totalPrice =
        box.values.fold(0.0, (acc, item) => acc += item.price * item.quantity);

    final purchases = box.values
        .map(
          (item) => Input$PurchasePartialInput(
              product: Input$ObjectIdInput(id: item.id),
              quantity: item.quantity),
        )
        .toList();
    final auth = context.watch<AuthProvider>();

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: initialSheetHeight,
      minChildSize: minSheetSize,
      builder: (BuildContext context, ScrollController scrollController) {
        return auth.isAuthenticated
            ? Query(
                options: QueryOptions(document: queryDocumentMe),
                builder: (meResult, {refetch, fetchMore}) {
                  if (!meResult.hasException && meResult.isNotLoading) {
                    final me = Query$Me.fromJson(meResult.data!).me;
                    phoneController!.text = me.phone;
                    provinceController!.text = me.province!;
                    addressController!.text = me.address!;
                  }

                  return _buildSheet(
                    context,
                    scrollController: scrollController,
                    totalPrice: totalPrice,
                    isLoading: meResult.isLoading,
                    phoneController: phoneController,
                    provinceController: provinceController,
                    addressController: addressController,
                    auth: auth,
                    purchases: purchases,
                  );
                },
              )
            : _buildSheet(
                context,
                scrollController: scrollController,
                totalPrice: totalPrice,
                phoneController: phoneController,
                provinceController: provinceController,
                addressController: addressController,
                auth: auth,
                purchases: purchases,
              );
      },
    );
  }

  Widget _buildSheet(BuildContext context,
      {required ScrollController scrollController,
      required double totalPrice,
      bool isLoading = false,
      required TextEditingController? phoneController,
      required TextEditingController? provinceController,
      required TextEditingController? addressController,
      required AuthProvider auth,
      required List<Input$PurchasePartialInput> purchases}) {
    final theme = Theme.of(context);

    return Mutation(
      options: MutationOptions(document: queryDocumentPlaceOrder),
      builder: (runMutation, result) {
        return Container(
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(kDefaultBorderRadius * 2),
              topRight: Radius.circular(kDefaultBorderRadius * 2),
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
                      Text(context.loc!.total,
                          style: theme.textTheme.headline6),
                      const Spacer(),
                      Text("${formatPrice(totalPrice)} ${context.loc!.iqd}",
                          style: theme.textTheme.headline6!
                              .copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: kDefaultPadding),
                  const Divider(),
                  const SizedBox(height: kDefaultPadding),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                    child: TextField(
                      enabled: !isLoading && result!.isNotLoading,
                      controller: phoneController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding * 1.5,
                            vertical: kDefaultPadding / 1.5),
                        border: InputBorder.none,
                        labelText: context.loc!.phoneNumber,
                        filled: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                    child: TextField(
                      enabled: !isLoading && result!.isNotLoading,
                      controller: provinceController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding * 1.5,
                            vertical: kDefaultPadding / 1.5),
                        border: InputBorder.none,
                        labelText: context.loc!.province,
                        filled: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                    child: TextField(
                      enabled: !isLoading && result!.isNotLoading,
                      controller: addressController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding * 1.5,
                            vertical: kDefaultPadding / 1.5),
                        border: InputBorder.none,
                        labelText: context.loc!.address,
                        filled: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  GestureDetector(
                    onTap: box.isNotEmpty && result!.isNotLoading && !isLoading
                        ? () async {
                            if (!auth.isAuthenticated) {
                              Navigator.pushNamed(
                                context,
                                LoginPage.routeName,
                              );
                              return;
                            }
                            final input = Input$PlaceOrderInput(
                              phone: phoneController!.text,
                              province: provinceController!.text,
                              address: addressController!.text,
                              purchases: purchases,
                            );
                            final result = await runMutation({'data': input})
                                .networkResult!;
                            if (result.hasException) {
                              showSnackBar(
                                context,
                                message: context.loc!.somethingWentWrong,
                                type: SnackBarType.error,
                              );
                              return;
                            }
                            if (result.isConcrete) {
                              box.clear();
                              Navigator.pop(context);
                              Navigator.of(context)
                                  .pushNamed(OrdersPage.routeName);
                            }
                          }
                        : null,
                    child: RoundContainer(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      color: box.isEmpty || result!.isLoading
                          ? Colors.grey.shade800
                          : theme.colorScheme.secondary,
                      borderRadius: BorderRadius.circular(9999),
                      child: Text(
                        context.loc!.orderNow.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: theme.textTheme.button!
                            .copyWith(color: Colors.white),
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
  }
}
