import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hassah_book_flutter/app/models/cart_item.dart';
import 'package:hassah_book_flutter/app/pages/profile.dart';
import 'package:hassah_book_flutter/app/widgets/round_container.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/widgets/product_card.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

const _kBottomSheetMinExtent = 20.0;
const _kBottomSheetMinHeight = 450.0;

class CartPage extends StatelessWidget {
  static const routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = MediaQuery.of(context).padding;
    final size = MediaQuery.of(context).size;
    // Get the min bottom sheet height fraction.
    final minSheetSize = (padding.bottom + _kBottomSheetMinExtent) / size.height;
    final initialSheetHeight = min(_kBottomSheetMinHeight / size.height, 1.0);

    return Scaffold(
      bottomSheet: _buildBottomSheet(context, initialSheetHeight, minSheetSize),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<CartItem>(kCartBoxName).listenable(),
        builder: (BuildContext context, Box<CartItem> box, Widget child) {
          final items = box.values.toList();

          return NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(title: Text("Cart"), floating: true, snap: true),
            ],
            body: ListView.separated(
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
                    child: RoundContainer(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildImage(item.image),
                          SizedBox(width: kDefaultPadding),
                          Expanded(child: _buildProductInfo(theme, item)),
                        ],
                      ),
                    ),
                    secondaryActions: <Widget>[
                      IconSlideAction(
                          color: Color(0xFFF06F6F),
                          icon: Icons.delete,
                          onTap: () {
                            item.delete();
                          })
                    ],
                  ),
                );
              },
              separatorBuilder: (context, idx) => SizedBox(height: kDefaultPadding),
              itemCount: items.length,
            ),
          );
        },
      ),
    );
  }

  DraggableScrollableSheet _buildBottomSheet(BuildContext context, double initialSheetHeight, double minSheetSize) {
    final theme = Theme.of(context);
    final padding = MediaQuery.of(context).padding;

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: initialSheetHeight,
      minChildSize: minSheetSize,
      builder: (BuildContext context, ScrollController scrollController) {
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
                      Text("\$40.0", style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: kDefaultPadding),
                  Divider(),
                  SizedBox(height: kDefaultPadding),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                    child: TextField(
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
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(ProfilePage.routeName);
                    },
                    child: RoundContainer(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      color: theme.accentColor,
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
  }

  Widget _buildProductInfo(ThemeData theme, CartItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.name, style: theme.textTheme.headline6, overflow: TextOverflow.ellipsis),
        Text("by John Wick", style: theme.textTheme.bodyText2, overflow: TextOverflow.ellipsis),
        SizedBox(height: kDefaultPadding / 2),
        Row(
          children: [
            Icon(Icons.remove),
            SizedBox(width: kDefaultPadding),
            Text(item.quantity.toString(), style: theme.textTheme.subtitle1.copyWith(color: theme.accentColor, fontWeight: FontWeight.bold)),
            SizedBox(width: kDefaultPadding),
            Icon(Icons.add),
            Spacer(),
            Text(
              "${item.price}",
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
}
