import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/auth_provider.dart';
import 'package:hassah_book_flutter/app/bookmarks_provider.dart';
import 'package:hassah_book_flutter/app/models/cart_item.dart';
import 'package:hassah_book_flutter/app/pages/author.dart';
import 'package:hassah_book_flutter/app/pages/cart.dart';
import 'package:hassah_book_flutter/app/pages/login.dart';
import 'package:hassah_book_flutter/app/widgets/chips.dart';
import 'package:hassah_book_flutter/app/widgets/round_container.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/utils/ext.dart';
import 'package:hassah_book_flutter/common/widgets/loading_indicator.dart';
import 'package:hassah_book_flutter/common/widgets/retry.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class ProductDetailPageArguments {
  const ProductDetailPageArguments(
      {this.product, this.id, @required this.heroTagPrefix})
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

    final defaultQuantity =
        Hive.box<CartItem>(kCartBoxName).get(id ?? product.id)?.quantity ?? 1;
    final overviewClipped = useState(true);
    final quantity = useState(defaultQuantity);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(context.loc.productDetails),
            floating: true,
            snap: true,
          ),
          SliverToBoxAdapter(
            child: Query(
              options: QueryOptions(
                  document: _productQuery.document,
                  variables: {"id": id ?? product.id}),
              builder: (result, {fetchMore, refetch}) {
                if (this.product == null) {
                  if (result.isLoading) return LoadingIndicator();
                  if (result.hasException)
                    return Retry(
                      message: result.exception.toString(),
                      onRetry: refetch,
                    );
                }

                final data = result.data != null
                    ? _productQuery.parse(result.data)
                    : null;
                final product = this.product ?? data.product;

                final language = data?.product?.language ?? "...";

                return Container(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProductImage(
                        id ?? product.id,
                        product.image,
                        heroTagPrefix,
                      ),
                      const SizedBox(height: kDefaultPadding),
                      Center(
                        child: Chips(
                          items: product.categories.map((e) => e.name).toList(),
                        ),
                      ),
                      const SizedBox(height: kDefaultPadding * 2),
                      _buildProductHeader(
                          context, product, data?.product, refetch),
                      const SizedBox(height: kDefaultPadding),
                      RoundContainer(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildInfoColumn(
                              title: context.loc.publishedIn,
                              value:
                                  data?.product?.publishedAt?.year.toString() ??
                                      "...",
                              theme: theme,
                            ),
                            _buildDivider(),
                            _buildInfoColumn(
                              title: context.loc.pages,
                              value: data?.product?.pages.toString() ?? "...",
                              theme: theme,
                            ),
                            _buildDivider(),
                            _buildInfoColumn(
                              title: context.loc.language,
                              value: (language == "ar"
                                  ? context.loc.ar
                                  : language == "en"
                                      ? context.loc.en
                                      : language),
                              theme: theme,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: kDefaultPadding),
                      GestureDetector(
                        onTap: () {
                          overviewClipped.value = !overviewClipped.value;
                        },
                        child: Text(
                          data?.product?.overview ?? "...",
                          style: theme.textTheme.bodyText1
                              .copyWith(color: Colors.grey.shade800),
                          maxLines: overviewClipped.value ? 2 : null,
                          overflow: overviewClipped.value
                              ? TextOverflow.ellipsis
                              : null,
                        ),
                      ),
                      const SizedBox(height: kDefaultPadding),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: RoundContainer(
                              borderRadius: BorderRadius.circular(9999),
                              child: Row(
                                children: [
                                  Text(context.loc.qty),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      if (quantity.value > 1) {
                                        quantity.value--;
                                      }
                                    },
                                    child: Icon(Icons.remove),
                                  ),
                                  const SizedBox(width: kDefaultPadding),
                                  Text(quantity.value.toString(),
                                      style: theme.textTheme.subtitle1.copyWith(
                                          color: theme.accentColor,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(width: kDefaultPadding),
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
                          const SizedBox(width: kDefaultPadding),
                          Expanded(
                            flex: 1,
                            child: ValueListenableBuilder<Box<CartItem>>(
                              valueListenable:
                                  Hive.box<CartItem>(kCartBoxName).listenable(),
                              builder: (context, box, child) {
                                final inCartItem = box.get(id ?? product.id);

                                if (inCartItem != null &&
                                    inCartItem.quantity == quantity.value) {
                                  return GestureDetector(
                                    onTap: () => Navigator.of(context)
                                        .pushNamed(CartPage.routeName),
                                    child: RoundContainer(
                                      borderRadius: BorderRadius.circular(9999),
                                      color: theme.accentColor,
                                      child: Text(
                                        context.loc.goToCart,
                                        style: theme.textTheme.button
                                            .copyWith(color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                }

                                return GestureDetector(
                                  onTap: data != null
                                      ? () => box.put(
                                          data.product.id,
                                          CartItem.fromProduct(
                                              data.product, quantity.value))
                                      : null,
                                  child: RoundContainer(
                                    borderRadius: BorderRadius.circular(9999),
                                    color: data == null
                                        ? Colors.grey.shade800
                                        : theme.primaryColor,
                                    child: Text(
                                      context.loc.addToCart,
                                      style: theme.textTheme.button
                                          .copyWith(color: Colors.white),
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

  Row _buildProductHeader(BuildContext context, ProductMixin product,
      ProductDetailMixin productDetail, VoidCallback refetch) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${product.price} ${context.loc.iqd}",
                style: theme.textTheme.headline5.copyWith(
                    fontWeight: FontWeight.bold, color: theme.accentColor),
              ),
              Text(
                product.name,
                style: theme.textTheme.headline6,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AuthorPage.routeName,
                      arguments: AuthorPageArguments(id: product.author.id));
                },
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "${context.loc.by} ",
                      style: theme.textTheme.bodyText1,
                    ),
                    TextSpan(
                      text: product.author.name,
                      style: theme.textTheme.bodyText1.copyWith(
                        color: theme.accentColor,
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: kDefaultPadding),
        if (productDetail != null) Bookmark(product: productDetail)
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
          child: FadeInImage.assetNetwork(
            placeholder: "assets/images/product_placeholder.png",
            image: image,
            fit: BoxFit.cover,
            height: kDefaultImageHeight,
            width: kDefaultImageWidth,
          ),
        ),
      ),
    );
  }

  Column _buildInfoColumn(
      {@required String title,
      @required String value,
      @required ThemeData theme}) {
    return Column(
      children: [
        Text(title,
            style: theme.textTheme.bodyText1
                .copyWith(color: Colors.grey.shade800)),
        Text(value ?? "...",
            style: theme.textTheme.bodyText1
                .copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Center _buildDivider() {
    return Center(
      child: Container(
        height: 30,
        decoration: const BoxDecoration(
          border: const Border(
            left: const BorderSide(width: 1, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class Bookmark extends StatefulWidget {
  const Bookmark({Key key, @required this.product})
      : assert(product != null),
        super(key: key);

  final ProductDetailMixin product;

  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  ProductDetailMixin get product => widget.product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bookmarks = context.read<BookmarksProvider>();
    final auth = context.watch<AuthProvider>();

    return GraphQLConsumer(
      builder: (GraphQLClient client) {
        return IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: () async {
            if (!auth.isAuthenticated) {
              Navigator.pushNamed(context, LoginPage.routeName);
              return;
            }

            final isFavorite = product.isFavorite;

            setState(() {
              product.isFavorite = !isFavorite;
            });

            final productId = (product as dynamic).id;

            if (isFavorite) {
              await bookmarks.removeBookmark(productId);
            } else {
              await bookmarks.addBookmark(productId);
            }
          },
          icon: Container(
            padding: const EdgeInsets.all(kDefaultPadding / 2),
            decoration: BoxDecoration(
                color: product.isFavorite
                    ? theme.accentColor
                    : theme.backgroundColor,
                borderRadius: BorderRadius.circular(9999)),
            child: Icon(
              product.isFavorite ? Icons.bookmark : Icons.bookmark_border,
              color: product.isFavorite ? Colors.white : Colors.grey.shade800,
              size: 20,
            ),
          ),
        );
      },
    );
  }
}
