import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/pages/product_detail.dart';
import 'package:hassah_book_flutter/app/widgets/chips.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/utils/rand.dart';
import 'package:hassah_book_flutter/common/widgets/loading_indicator.dart';
import 'package:hassah_book_flutter/common/widgets/retry.dart';

const kImageWidth = kDefaultImageWidth * 1.2;
const kImageHeight = kDefaultImageHeight * 1.2;

class AuthorPageArguments {
  const AuthorPageArguments({@required this.id}) : assert(id != null);

  final String id;
}

class AuthorPage extends HookWidget {
  static const routeName = "/author";

  AuthorPage({Key key, @required this.id})
      : assert(id != null),
        super(key: key);

  final String id;

  final _authorQuery = AuthorQuery();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final currentProduct = useState<ProductMixin>(null);
    final authorOverviewClipped = useState(true);
    final overviewClipped = useState(true);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(title: Text("Author Details"), floating: true, snap: true),
        ],
        body: Query(
          options: QueryOptions(document: _authorQuery.document, variables: {"id": id}),
          builder: (result, {fetchMore, refetch}) {
            if (result.data == null) {
              if (result.isLoading) {
                return LoadingIndicator();
              }

              if (result.hasException) {
                return Retry(message: result.exception.toString(), onRetry: refetch);
              }
            }

            final author = _authorQuery.parse(result.data).author;

            if (currentProduct.value == null && author.products.items.length > 0) {
              currentProduct.value = author.products.items[0];
            }

            return ListView(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: kAvatarRadius,
                    backgroundColor: theme.backgroundColor,
                    backgroundImage: const AssetImage("assets/images/product_placeholder.png"),
                    foregroundImage: NetworkImage(author.image),
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
                Text(
                  author.name,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () {
                    authorOverviewClipped.value = !authorOverviewClipped.value;
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Text(
                      author.overview,
                      overflow: authorOverviewClipped.value ? TextOverflow.ellipsis : null,
                      // textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
                CarouselSlider(
                  options: CarouselOptions(
                    height: kImageHeight,
                    viewportFraction: .5,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    onPageChanged: (idx, reason) {
                      final products = author.products.items;

                      overviewClipped.value = true;
                      currentProduct.value = products[idx];

                      if (idx + 1 == products.length && idx + 1 < author.products.total) {
                        final options = FetchMoreOptions(
                          document: _authorQuery.document,
                          updateQuery: (oldData, newData) => _updatePaginatedResponse(oldData, newData),
                          variables: {"skip": products.length},
                        );

                        fetchMore(options);
                      }
                    },
                  ),
                  items: author.products.items.map((product) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ProductImage(product: product);
                      },
                    );
                  }).toList(),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ProductDetailPage.routeName,
                      arguments: ProductDetailPageArguments(product: currentProduct.value, heroTagPrefix: ""),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          currentProduct.value?.name ?? "...",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.w500),
                        ),
                        if (currentProduct.value?.categories?.isNotEmpty ?? false) const SizedBox(height: kDefaultPadding),
                        Chips(items: currentProduct.value?.categories?.map((e) => e.name)?.toList()),
                        const SizedBox(height: kDefaultPadding),
                        GestureDetector(
                          onTap: () => overviewClipped.value = !overviewClipped.value,
                          child: Text(
                            currentProduct.value?.overview ?? "...",
                            maxLines: overviewClipped.value ? 2 : null,
                            overflow: overviewClipped.value ? TextOverflow.ellipsis : null,
                            style: theme.textTheme.bodyText1.copyWith(color: Colors.grey.shade700),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Map<String, dynamic> _updatePaginatedResponse(Map<String, dynamic> oldData, Map<String, dynamic> newData) {
    newData["author"]["products"]["items"] = [...oldData["author"]["products"]["items"], ...newData["author"]["products"]["items"]];
    return newData;
  }
}

class ProductImage extends HookWidget {
  const ProductImage({Key key, @required this.product})
      : assert(product != null),
        super(key: key);

  final ProductMixin product;

  @override
  Widget build(BuildContext context) {
    final heroTagPrefix = useMemoized(generateRandomString);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailPage.routeName,
          arguments: ProductDetailPageArguments(product: product, heroTagPrefix: heroTagPrefix),
        );
      },
      child: Hero(
        tag: "image-$heroTagPrefix-${product.id}",
        child: Center(
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(kDefaultBorderRadius)),
            child: FadeInImage.assetNetwork(
              placeholder: "assets/images/product_placeholder.png",
              image: product.image,
              fit: BoxFit.cover,
              width: kImageWidth,
            ),
          ),
        ),
      ),
    );
  }
}
