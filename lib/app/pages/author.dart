import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/pages/product_detail.dart';
import 'package:hassah_book_flutter/app/pages/search.dart';
import 'package:hassah_book_flutter/app/widgets/chips.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/utils/ext.dart';
import 'package:hassah_book_flutter/common/utils/image.dart';
import 'package:hassah_book_flutter/common/utils/rand.dart';
import 'package:hassah_book_flutter/common/widgets/loading_indicator.dart';
import 'package:hassah_book_flutter/common/widgets/product_card.dart';
import 'package:hassah_book_flutter/common/widgets/retry.dart';
import 'package:hassah_book_flutter/graphql/author.query.graphql.dart';
import 'package:hassah_book_flutter/graphql/product.fragment.graphql.dart';

const kImageWidth = kDefaultImageWidth * 1.2;
const kImageHeight = kDefaultImageHeight * 1.2;

class AuthorPageArguments {
  const AuthorPageArguments({required this.id});

  final String id;
}

class AuthorPage extends HookWidget {
  static const routeName = "/author";

  AuthorPage({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final currentProduct = useRef<Fragment$Product?>(null);
    final authorOverviewClipped = useState(true);
    final overviewClipped = useState(true);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: Text(context.loc!.authorDetails),
            floating: true,
            snap: true,
          ),
        ],
        body: Query(
          options: QueryOptions(
              document: queryDocumentAuthor, variables: {"id": id}),
          builder: (result, {fetchMore, refetch}) {
            if (result.data == null) {
              if (result.isLoading) {
                return const LoadingIndicator();
              }

              if (result.hasException) {
                return Retry(
                  message: context.loc!.somethingWentWrong,
                  onRetry: refetch,
                );
              }
            }

            final author = Query$Author.fromJson(result.data!).author!;

            if (currentProduct.value == null &&
                author.products.items.length > 0) {
              currentProduct.value = author.products.items[0];
            }

            return ListView(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: kAvatarRadius,
                    backgroundColor: theme.backgroundColor,
                    backgroundImage: const AssetImage(
                      "assets/images/product_placeholder.png",
                    ),
                    foregroundImage: NetworkImage(imageURL(author.image, 300)),
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
                Text(
                  author.name,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headline6!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () {
                    authorOverviewClipped.value = !authorOverviewClipped.value;
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Text(
                      author.overview,
                      textAlign: authorOverviewClipped.value
                          ? TextAlign.center
                          : TextAlign.justify,
                      overflow: authorOverviewClipped.value
                          ? TextOverflow.ellipsis
                          : null,
                      // textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: kDefaultPadding / 2),
                Center(
                  child: _buildReadMoreLessButton(
                    theme,
                    authorOverviewClipped,
                    context,
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

                      if (idx + 1 == products.length &&
                          idx + 1 < author.products.total) {
                        final options = FetchMoreOptions(
                          document: queryDocumentAuthor,
                          updateQuery: (oldData, newData) =>
                              _updatePaginatedResponse(oldData!, newData!),
                          variables: {"skip": products.length},
                        );

                        fetchMore!(options);
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
                      arguments: ProductDetailPageArguments(
                          product: currentProduct.value, heroTagPrefix: ""),
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
                          style: theme.textTheme.headline6!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        if (currentProduct.value?.categories?.isNotEmpty ??
                            false)
                          const SizedBox(height: kDefaultPadding),
                        Chips(
                          onChipPressed: (item) => Navigator.pushNamed(
                            context,
                            SearchPage.routeName,
                            arguments: SearchPageArguments(categoryID: item.id),
                          ),
                          items: currentProduct.value?.categories
                              ?.map((e) => ChipItem(id: e.id, label: e.name))
                              ?.toList(),
                        ),
                        const SizedBox(height: kDefaultPadding),
                        GestureDetector(
                          onTap: () =>
                              overviewClipped.value = !overviewClipped.value,
                          child: Text(
                            currentProduct.value?.overview ?? "...",
                            maxLines: overviewClipped.value ? 2 : null,
                            overflow: overviewClipped.value
                                ? TextOverflow.ellipsis
                                : null,
                            textAlign: overviewClipped.value
                                ? TextAlign.center
                                : TextAlign.justify,
                            style: theme.textTheme.bodyText1!
                                .copyWith(color: Colors.grey.shade700),
                          ),
                        ),
                        const SizedBox(height: kDefaultPadding / 2),
                        _buildReadMoreLessButton(
                            theme, overviewClipped, context),
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

  Material _buildReadMoreLessButton(ThemeData theme,
      ValueNotifier<bool> authorOverviewClipped, BuildContext context) {
    return Material(
      color: theme.backgroundColor,
      borderRadius: BorderRadius.circular(9999),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          authorOverviewClipped.value = !authorOverviewClipped.value;
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding / 4,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                authorOverviewClipped.value
                    ? context.loc!.readMore
                    : context.loc!.readLess,
                style: theme.textTheme.button!
                    .copyWith(color: theme.colorScheme.secondary),
              ),
              const SizedBox(width: 5),
              Icon(
                authorOverviewClipped.value
                    ? Icons.keyboard_arrow_down_outlined
                    : Icons.keyboard_arrow_up_outlined,
                color: theme.colorScheme.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> _updatePaginatedResponse(
      Map<String, dynamic> oldData, Map<String, dynamic> newData) {
    newData["author"]["products"]["items"] = [
      ...oldData["author"]["products"]["items"],
      ...newData["author"]["products"]["items"]
    ];
    return newData;
  }
}

class ProductImage extends HookWidget {
  const ProductImage({Key? key, required this.product}) : super(key: key);

  final Fragment$Product product;

  @override
  Widget build(BuildContext context) {
    final heroTagPrefix = useMemoized(generateRandomString);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailPage.routeName,
          arguments: ProductDetailPageArguments(
            product: product,
            heroTagPrefix: heroTagPrefix,
          ),
        );
      },
      child: Align(
        child: Hero(
          tag: "image-$heroTagPrefix-${product.id}",
          child: ProductCoverImage(
            image: product.image,
            width: kDefaultImageWidth * 1.2,
            resolution: 300,
          ),
        ),
      ),
    );
  }
}
