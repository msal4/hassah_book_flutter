import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/pages/author.dart';
import 'package:hassah_book_flutter/app/pages/product_detail.dart';
import 'package:hassah_book_flutter/app/widgets/chips.dart';
import 'package:hassah_book_flutter/app/widgets/pagination_handler.dart';
import 'package:hassah_book_flutter/app/widgets/round_container.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/utils/rand.dart';
import 'package:hassah_book_flutter/common/widgets/loading_indicator.dart';
import 'package:hassah_book_flutter/common/widgets/product_card.dart';
import 'package:hassah_book_flutter/common/widgets/retry.dart';

const _kDebounceDuration = 500;
const _kAuthorRadius = 50.0;
const _kSearchQueryKey = "searchQuery";

class SearchPage extends StatefulWidget {
  static const routeName = "/search";

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchQuery = SearchQuery();

  String _query = "";

  Timer _timer;

  final _heroTagPrefix = generateRandomString();

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = MediaQuery.of(context).padding;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: theme.backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(kDefaultBorderRadius * 2),
                topRight: Radius.circular(kDefaultBorderRadius * 2),
              ),
            ),
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [_buildSliverAppBar(context)];
              },
              body: Query(
                options: QueryOptions(document: _searchQuery.document, variables: {_kSearchQueryKey: _query}),
                builder: (result, {fetchMore, refetch}) {
                  if (result.hasException) {
                    return Retry(message: result.exception.toString());
                  }

                  if (result.data == null && result.isLoading) {
                    return LoadingIndicator();
                  }

                  final data = _searchQuery.parse(result.data);

                  return PaginationHandler(
                    enabled: !result.isLoading && data.products.items.length != data.products.total,
                    fetchMore: () {
                      final options = FetchMoreOptions(
                        document: _searchQuery.document,
                        updateQuery: _updatePaginatedQuery,
                        variables: {"searchQuery": _query, "skip": data.products.items.length},
                      );

                      fetchMore(options);
                    },
                    child: ListView.separated(
                      padding: EdgeInsets.only(top: kDefaultPadding, bottom: kDefaultPadding + padding.top),
                      itemBuilder: (context, idx) {
                        if (idx == 0) {
                          return _buildAuthorsRow(context, data.authors.items);
                        }

                        final product = data.products.items[idx - 1];

                        return Tooltip(
                          key: Key(product.id),
                          message: "${product.name} by ${product.author.name}",
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                ProductDetailPage.routeName,
                                arguments: ProductDetailPageArguments(product: product, heroTagPrefix: _heroTagPrefix),
                              );
                            },
                            child: RoundContainer(
                              color: theme.scaffoldBackgroundColor,
                              margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildImage(product),
                                  SizedBox(width: kDefaultPadding),
                                  Expanded(child: _buildProductInfo(theme.textTheme, product)),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, idx) => SizedBox(height: kDefaultPadding),
                      itemCount: data.products.items.length + 1,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> _updatePaginatedQuery(oldData, newData) {
    final oldDataParsed = _searchQuery.parse(oldData);
    final newDataParsed = _searchQuery.parse(newData);

    final items = [...oldDataParsed.products.items, ...newDataParsed.products.items];

    newDataParsed.products.items = items;

    return newDataParsed.toJson();
  }

  Widget _buildAuthorsRow(BuildContext context, List<AuthorMixin> authors) {
    final theme = Theme.of(context);

    if (authors.length == 0) {
      return SizedBox();
    }

    return Container(
      height: _kAuthorRadius * 2 + 30,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, idx) {
          return _buildAuthor(theme, authors[idx]);
        },
        separatorBuilder: (_, __) => const SizedBox(width: kDefaultPadding),
        itemCount: authors.length,
      ),
    );
  }

  Widget _buildAuthor(ThemeData theme, AuthorMixin author) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AuthorPage.routeName, arguments: AuthorPageArguments(id: author.id));
      },
      child: Container(
        width: _kAuthorRadius * 2,
        child: Column(
          children: [
            CircleAvatar(
              radius: _kAuthorRadius,
              backgroundColor: theme.backgroundColor,
              backgroundImage: const AssetImage("assets/images/product_placeholder.png"),
              foregroundImage: NetworkImage(author.image),
            ),
            const SizedBox(height: 5),
            Text(
              author.name,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyText1.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductInfo(TextTheme textTheme, ProductMixin product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.name, style: textTheme.headline6, overflow: TextOverflow.ellipsis),
        Text("by ${product.author.name}", style: textTheme.bodyText2, overflow: TextOverflow.ellipsis),
        SizedBox(height: kDefaultPadding / 2),
        Chips(items: product.categories.map((c) => c.name).toList(), collapsable: false),
      ],
    );
  }

  Widget _buildImage(ProductMixin product) {
    return Hero(
      tag: "image-$_heroTagPrefix-${product.id}",
      child: Container(
        width: kDefaultImageWidth / 2,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(kDefaultBorderRadius)),
        child: Image.network(
          product.image,
          fit: BoxFit.cover,
          frameBuilder: (ctx, child, _, __) => Image.asset("assets/images/product_placeholder.png"),
        ),
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar(
      floating: true,
      snap: true,
      toolbarHeight: kAppBarHeight,
      backgroundColor: theme.backgroundColor,
      titleSpacing: 0,
      leading: SizedBox(),
      leadingWidth: 0,
      title: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Row(
          children: [
            _buildBackButton(context),
            SizedBox(width: kDefaultPadding),
            Expanded(
              child: TextField(
                onChanged: (value) {
                  if (_timer?.isActive ?? false) _timer?.cancel();

                  _timer = Timer(Duration(milliseconds: _kDebounceDuration), () {
                    setState(() {
                      _query = value;
                    });
                  });
                },
                textInputAction: TextInputAction.search,
                autofocus: true,
                style: theme.textTheme.headline6,
                decoration: InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(width: kDefaultPadding / 2),
            Icon(Icons.search),
            SizedBox(width: kDefaultPadding),
            Icon(Icons.filter_list),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Tooltip(
      message: MaterialLocalizations.of(context).backButtonTooltip,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
          color: Colors.grey.shade800,
        ),
      ),
    );
  }
}
