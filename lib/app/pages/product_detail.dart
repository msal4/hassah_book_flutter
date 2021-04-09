import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/widgets/chips.dart';
import 'package:hassah_book_flutter/app/widgets/round_container.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';

class ProductDetailPageArguments {
  const ProductDetailPageArguments({@required this.product, @required this.heroTagPrefix})
      : assert(product != null, "product is required"),
        assert(heroTagPrefix != null, "heroTagPrefix is required");

  final ProductMixin product;
  final String heroTagPrefix;
}

class ProductDetailPage extends HookWidget {
  ProductDetailPage({@required this.product, @required this.heroTagPrefix})
      : assert(product != null, "product must not be null"),
        assert(heroTagPrefix != null, "heroTagPrefix must not be null");

  final ProductMixin product;
  final String heroTagPrefix;

  static const routeName = "/product_detail";

  final _productQuery = ProductDetailQuery();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final overviewClipped = useState(true);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(title: Text("Product Details"), floating: true, snap: true),
          SliverToBoxAdapter(
            child: SafeArea(
              child: Query(
                options: QueryOptions(document: _productQuery.document, variables: {"id": product.id}),
                builder: (result, {fetchMore, refetch}) {
                  final data = result.data != null ? _productQuery.parse(result.data) : null;

                  return Container(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildProductImage(product, heroTagPrefix),
                        SizedBox(height: kDefaultPadding),
                        Center(child: Chips(items: product.categories.map((e) => e.name).toList())),
                        SizedBox(height: kDefaultPadding * 2),
                        _buildProductHeader(context, product, data?.product),
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
                              child: RoundContainer(
                                child: Row(
                                  children: [
                                    Text("QTY"),
                                    Spacer(),
                                    Icon(Icons.remove),
                                    SizedBox(width: kDefaultPadding),
                                    Text("2", style: theme.textTheme.subtitle1.copyWith(color: theme.accentColor, fontWeight: FontWeight.bold)),
                                    SizedBox(width: kDefaultPadding),
                                    Icon(Icons.add),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: kDefaultPadding),
                            RoundContainer(
                              color: theme.primaryColor,
                              child: Text(
                                "Add to Cart",
                                style: theme.textTheme.button.copyWith(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _buildProductHeader(BuildContext context, ProductMixin product, ProductDetailMixin productDetail) {
    final theme = Theme.of(context);

    final isBookmarked = productDetail?.isFavorite ?? false;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("\$${product.price}", style: theme.textTheme.headline5.copyWith(fontWeight: FontWeight.bold, color: theme.accentColor)),
              Text(product.name, style: theme.textTheme.headline6),
              Text("by ${product.author.name}", style: theme.textTheme.bodyText2),
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

  Center _buildProductImage(ProductMixin product, String heroTagPrefix) {
    return Center(
      child: Hero(
        tag: "image-$heroTagPrefix-${product.id}",
        child: Container(
          width: 200,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
          ),
          child: Image.network(
            product.image,
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
