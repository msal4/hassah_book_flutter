import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/models/cart_item.dart';
import 'package:hassah_book_flutter/app/pages/cart.dart';
import 'package:hassah_book_flutter/app/widgets/chips.dart';
import 'package:hassah_book_flutter/app/widgets/round_container.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/widgets/loading_indicator.dart';
import 'package:hassah_book_flutter/common/widgets/product_card.dart';
import 'package:hassah_book_flutter/common/widgets/retry.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductDetailPageArguments {
  const ProductDetailPageArguments({this.product, this.id, @required this.heroTagPrefix})
      : assert(product != null || id != null, "a product or an id is required"),
        assert(heroTagPrefix != null, "heroTagPrefix is required");

  final String id;
  final ProductMixin product;
  final String heroTagPrefix;
}

class ProductDetailPage extends HookWidget {
  ProductDetailPage({this.product, this.id, @required this.heroTagPrefix})
      : assert(product != null || id != null, "a product or an id is required"),
        assert(heroTagPrefix != null, "heroTagPrefix must not be null");

  final String id;
  final ProductMixin product;
  final String heroTagPrefix;

  static const routeName = "/product_detail";

  final _productQuery = ProductDetailQuery();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = MediaQuery.of(context).padding;

    final defaultQuantity = Hive.box<CartItem>(kCartBoxName).get(id ?? product.id)?.quantity ?? 1;
    final overviewClipped = useState(true);
    final quantity = useState(defaultQuantity);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(title: Text("Product Details"), floating: true, snap: true),
          SliverToBoxAdapter(
            child: Query(
              options: QueryOptions(document: _productQuery.document, variables: {"id": product?.id ?? id}),
              builder: (result, {fetchMore, refetch}) {
                if (product == null) {
                  if (result.isLoading) return LoadingIndicator();
                  if (result.hasException) return Retry(message: result.exception.toString(), onRetry: refetch);
                }

                final data = result.data != null ? _productQuery.parse(result.data) : null;

                return Container(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProductImage(id ?? product.id, product?.image ?? data.product.image, heroTagPrefix),
                      SizedBox(height: kDefaultPadding),
                      Center(child: Chips(items: data?.product?.categories?.map((e) => e.name)?.toList())),
                      SizedBox(height: kDefaultPadding * 2),
                      _buildProductHeader(
                        context,
                        product?.price ?? data.product.price,
                        product?.name ?? data.product.name,
                        product?.author ?? data.product.author,
                        data?.product,
                      ),
                      SizedBox(height: kDefaultPadding),
                      RoundContainer(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildInfoColumn(title: "Published In", value: data?.product?.publishedAt?.year.toString() ?? "...", theme: theme),
                            _buildDivider(),
                            _buildInfoColumn(title: "Pages", value: data?.product?.pages.toString() ?? "...", theme: theme),
                            _buildDivider(),
                            _buildInfoColumn(title: "Language", value: data?.product?.language ?? "...", theme: theme)
                          ],
                        ),
                      ),
                      SizedBox(height: kDefaultPadding),
                      GestureDetector(
                        onTap: () {
                          overviewClipped.value = !overviewClipped.value;
                        },
                        child: Text(
                          data?.product?.overview ?? "...",
                          style: theme.textTheme.bodyText1.copyWith(color: Colors.grey.shade800),
                          overflow: overviewClipped.value ? TextOverflow.ellipsis : null,
                        ),
                      ),
                      SizedBox(height: kDefaultPadding),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: RoundContainer(
                              borderRadius: BorderRadius.circular(9999),
                              child: Row(
                                children: [
                                  Text("QTY"),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      if (quantity.value > 1) {
                                        quantity.value--;
                                      }
                                    },
                                    child: Icon(Icons.remove),
                                  ),
                                  SizedBox(width: kDefaultPadding),
                                  Text(quantity.value.toString(), style: theme.textTheme.subtitle1.copyWith(color: theme.accentColor, fontWeight: FontWeight.bold)),
                                  SizedBox(width: kDefaultPadding),
                                  GestureDetector(
                                    onTap: () {
                                      quantity.value++;
                                    },
                                    child: Icon(Icons.add),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: kDefaultPadding),
                          Expanded(
                            flex: 1,
                            child: ValueListenableBuilder<Box<CartItem>>(
                              valueListenable: Hive.box<CartItem>(kCartBoxName).listenable(),
                              builder: (context, box, child) {
                                final inCartItem = box.get(id ?? product.id);

                                if (inCartItem != null && inCartItem.quantity == quantity.value) {
                                  return GestureDetector(
                                    onTap: () async {
                                      Navigator.of(context).pushNamed(CartPage.routeName);
                                    },
                                    child: RoundContainer(
                                      borderRadius: BorderRadius.circular(9999),
                                      color: theme.accentColor,
                                      child: Text(
                                        "Go to Cart",
                                        style: theme.textTheme.button.copyWith(color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                }

                                return GestureDetector(
                                  onTap: data != null
                                      ? () async {
                                          final item = CartItem(
                                            id: data.product.id,
                                            name: data.product.name,
                                            image: data.product.image,
                                            quantity: quantity.value,
                                            price: data.product.price,
                                            authorName: data.product.author.name,
                                          );
                                          await box.put(item.id, item);
                                        }
                                      : null,
                                  child: RoundContainer(
                                    borderRadius: BorderRadius.circular(9999),
                                    color: data == null ? Colors.grey.shade800 : theme.primaryColor,
                                    child: Text(
                                      "Add to Cart",
                                      style: theme.textTheme.button.copyWith(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: padding.bottom),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Row _buildProductHeader(BuildContext context, double price, String name, AuthorMixin author, ProductDetailMixin productDetail) {
    final theme = Theme.of(context);

    final isBookmarked = productDetail?.isFavorite ?? false;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$price IQD", style: theme.textTheme.headline5.copyWith(fontWeight: FontWeight.bold, color: theme.accentColor)),
              Text(name, style: theme.textTheme.headline6),
              Text("by ${author.name}", style: theme.textTheme.bodyText2),
            ],
          ),
        ),
        SizedBox(width: kDefaultPadding),
        IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {},
          icon: Container(
            padding: const EdgeInsets.all(kDefaultPadding / 2),
            decoration: BoxDecoration(color: isBookmarked ? theme.accentColor : theme.backgroundColor, borderRadius: BorderRadius.circular(9999)),
            child: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: isBookmarked ? Colors.white : Colors.grey.shade800,
              size: 20,
            ),
          ),
        )
      ],
    );
  }

  Center _buildProductImage(String id, String image, String heroTagPrefix) {
    return Center(
      child: Hero(
        tag: "image-$heroTagPrefix-$id",
        child: Container(
          width: kDefaultImageWidth,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
          ),
          child: Image.network(
            image,
            fit: BoxFit.cover,
            frameBuilder: (ctx, child, _, __) => Image.asset("assets/images/product_placeholder.png"),
          ),
        ),
      ),
    );
  }

  Column _buildInfoColumn({@required String title, @required String value, @required ThemeData theme}) {
    return Column(
      children: [
        Text(title, style: theme.textTheme.bodyText1.copyWith(color: Colors.grey.shade800)),
        Text(value ?? "...", style: theme.textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Center _buildDivider() {
    return Center(
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(width: 1, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
