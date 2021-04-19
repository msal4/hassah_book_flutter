import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/models/cart_item.dart';
import 'package:hassah_book_flutter/app/pages/product_detail.dart';
import 'package:hassah_book_flutter/app/pages/profile.dart';
import 'package:hassah_book_flutter/app/widgets/round_container.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/widgets/product_card.dart';
import 'package:hassah_book_flutter/common/widgets/unfocus_on_tap.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

const _kBottomSheetMinExtent = 20.0;
const _kBottomSheetMinHeight = 550.0;

class CartPage extends StatefulWidget {
  static const routeName = "/cart";

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _orderMutation = OrderMutation();

  final _phoneController = TextEditingController.fromValue(TextEditingValue(text: "07705983835"));
  final _provinceController = TextEditingController.fromValue(TextEditingValue(text: "Baghdad"));
  final _addressController = TextEditingController.fromValue(TextEditingValue(text: "123 Street"));

  @override
  void dispose() {
    _phoneController.dispose();
    _provinceController.dispose();
    _addressController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    final size = MediaQuery.of(context).size;
    // Get the min bottom sheet height fraction.
    final minSheetSize = (padding.bottom + _kBottomSheetMinExtent) / size.height;
    final initialSheetHeight = min(_kBottomSheetMinHeight / size.height, 1.0);

    return UnfocusOnTap(
      child: ValueListenableBuilder<Box<CartItem>>(
        valueListenable: Hive.box<CartItem>(kCartBoxName).listenable(),
        builder: (context, box, child) {
          final items = box.values.toList();

          return Scaffold(
            bottomSheet: _buildBottomSheet(context, initialSheetHeight, minSheetSize, box),
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(title: Text("Cart"), floating: true, snap: true),
              ],
              body: items.length == 0 ? _buildPlaceholder(context) : _buildItemsList(context, items),
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
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: kSlidableActionExtentRatio,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(ProductDetailPage.routeName, arguments: ProductDetailPageArguments(id: item.id, heroTagPrefix: "none"));
              },
              child: RoundContainer(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImage(item.image),
                    SizedBox(width: kDefaultPadding),
                    Expanded(child: _buildProductInfo(context, theme, item)),
                  ],
                ),
              ),
            ),
            secondaryActions: <Widget>[
              IconSlideAction(
                color: Color(0xFFF06F6F),
                icon: Icons.delete,
                onTap: () => _deleteItem(context, item),
              )
            ],
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
        "Your cart is empty.",
        style: theme.textTheme.headline5.copyWith(fontWeight: FontWeight.w300),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildProductInfo(BuildContext context, ThemeData theme, CartItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.name, style: theme.textTheme.headline6, overflow: TextOverflow.ellipsis),
        Text("by ${item.authorName}", style: theme.textTheme.bodyText2, overflow: TextOverflow.ellipsis),
        SizedBox(height: kDefaultPadding / 2),
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
            SizedBox(width: kDefaultPadding),
            Text(item.quantity.toString(), style: theme.textTheme.subtitle1.copyWith(color: theme.accentColor, fontWeight: FontWeight.bold)),
            SizedBox(width: kDefaultPadding),
            GestureDetector(
              onTap: () {
                item.quantity++;
                item.save();
              },
              child: Icon(Icons.add),
            ),
            Spacer(),
            Text(
              "${item.price * item.quantity} IQD",
              style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold, color: theme.accentColor),
            ),
          ],
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
                  'Do you want to remove this item from your cart?',
                  style: theme.textTheme.subtitle1,
                ),
                SizedBox(height: kDefaultPadding),
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
                            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding),
                            child: Text(
                              "CANCEL",
                              textAlign: TextAlign.center,
                              style: theme.textTheme.button.copyWith(color: Colors.white),
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
                          onTap: () {
                            item.delete();
                            Navigator.pop(context);
                          },
                          child: Ink(
                            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding),
                            child: Text(
                              "YES",
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

  DraggableScrollableSheet _buildBottomSheet(BuildContext context, double initialSheetHeight, double minSheetSize, Box<CartItem> box) {
    final theme = Theme.of(context);
    final padding = MediaQuery.of(context).padding;

    final totalPrice = box.values.fold(0, (acc, item) => acc += item.price * item.quantity);

    final purchases = box.values.map((item) => PurchasePartialInput(product: ObjectIdInput(id: item.id), quantity: item.quantity)).toList();

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: initialSheetHeight,
      minChildSize: minSheetSize,
      builder: (BuildContext context, ScrollController scrollController) {
        return Mutation(
          options: MutationOptions(document: _orderMutation.document),
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
                          Text("$totalPrice IQD", style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: kDefaultPadding),
                      Divider(),
                      SizedBox(height: kDefaultPadding),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                        child: TextField(
                          controller: _phoneController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding / 1.5),
                            border: InputBorder.none,
                            labelText: "Phone Number",
                            filled: true,
                          ),
                        ),
                      ),
                      SizedBox(height: kDefaultPadding),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                        child: TextField(
                          controller: _provinceController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding / 1.5),
                            border: InputBorder.none,
                            labelText: "Province",
                            filled: true,
                          ),
                        ),
                      ),
                      SizedBox(height: kDefaultPadding),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                        child: TextField(
                          controller: _addressController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding / 1.5),
                            border: InputBorder.none,
                            labelText: "Address",
                            filled: true,
                          ),
                        ),
                      ),
                      SizedBox(height: kDefaultPadding),
                      GestureDetector(
                        onTap: result.isNotLoading
                            ? () async {
                                final input = PlaceOrderInput(phone: _phoneController.text, address: _addressController.text, purchases: purchases);
                                final result = await runMutation({'data': input}).networkResult;
                                if (result.hasException) {
                                  return;
                                }
                                if (result.isConcrete) {
                                  debugPrint(result.data.toString());
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pushNamed(ProfilePage.routeName);
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
