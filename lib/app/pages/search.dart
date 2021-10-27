import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/pages/author.dart';
import 'package:hassah_book_flutter/app/pages/product_detail.dart';
import 'package:hassah_book_flutter/app/widgets/chips.dart';
import 'package:hassah_book_flutter/app/widgets/pagination_handler.dart';
import 'package:hassah_book_flutter/app/widgets/round_container.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/utils/ext.dart';
import 'package:hassah_book_flutter/common/utils/image.dart';
import 'package:hassah_book_flutter/common/utils/pagination.dart';
import 'package:hassah_book_flutter/common/utils/rand.dart';
import 'package:hassah_book_flutter/common/widgets/loading_indicator.dart';
import 'package:hassah_book_flutter/common/widgets/product_card.dart';
import 'package:hassah_book_flutter/common/widgets/retry.dart';

const _kDebounceDuration = 500;
const _kAuthorRadius = 50.0;
const _kSearchQueryKey = "searchQuery";

class SearchPageArguments {
  const SearchPageArguments({this.categoryID, this.searchQuery});

  final String categoryID;
  final String searchQuery;
}

class SearchPage extends StatefulWidget {
  const SearchPage({this.categoryID, this.searchQuery});

  final String categoryID;
  final String searchQuery;

  static const routeName = "/search";

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchQuery = SearchQuery();
  final _categorySearchQuery = CategorySearchQuery();

  TextEditingController _searchController = TextEditingController();

  String _currentCategoryID;
  OrderBy _currentSort;

  String _query = "";

  Timer _timer;

  final _heroTagPrefix = generateRandomString();

  @override
  void initState() {
    _currentCategoryID = widget.categoryID;
    _query = widget.searchQuery ?? "";
    _searchController.text = _query;

    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = MediaQuery.of(context).padding;

    final options = QueryOptions(
      document: _currentCategoryID != null
          ? _categorySearchQuery.document
          : _searchQuery.document,
      variables: {
        "id": _currentCategoryID,
        _kSearchQueryKey: _query,
        "order": _currentSort != null
            ? [OrderByMap(field: "createdAt", order: _currentSort)]
            : null
      },
    );

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
                options: options,
                builder: (result, {fetchMore, refetch}) {
                  if (result.hasException) {
                    return Retry(message: context.loc.somethingWentWrong);
                  }

                  if (result.data == null && result.isLoading) {
                    return const LoadingIndicator();
                  }

                  if (_currentCategoryID != null) {
                    final data = _categorySearchQuery.parse(result.data);
                    if (data?.category?.products == null) return SizedBox();

                    if (data.category.products.items.length == 0) {
                      return SingleChildScrollView(
                        child: _buildNoItemsFound(context, _query),
                      );
                    }

                    return PaginationHandler(
                      enabled: !result.isLoading &&
                          data.category.products.items.length !=
                              data.category.products.total,
                      fetchMore: () {
                        final options = FetchMoreOptions(
                          document: _searchQuery.document,
                          updateQuery: (oldData, newData) =>
                              updatePaginatedResponse(
                                  oldData, newData, "products"),
                          variables: {
                            "id": _currentCategoryID,
                            _kSearchQueryKey: _query,
                            "skip": data.category.products.items.length
                          },
                        );

                        fetchMore(options);
                      },
                      child: ListView.separated(
                        padding: EdgeInsets.only(
                          top: kDefaultPadding,
                          bottom: kDefaultPadding + padding.top,
                        ),
                        itemBuilder: (context, idx) {
                          final product = data.category.products.items[idx];

                          return Tooltip(
                            key: Key(product.id),
                            message:
                                "${product.name} ${context.loc.by} ${product.author.name}",
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  ProductDetailPage.routeName,
                                  arguments: ProductDetailPageArguments(
                                    product: product,
                                    heroTagPrefix: _heroTagPrefix,
                                  ),
                                );
                              },
                              child: RoundContainer(
                                color: theme.scaffoldBackgroundColor,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildImage(product),
                                    const SizedBox(width: kDefaultPadding),
                                    Expanded(
                                      child: _buildProductInfo(
                                        theme.textTheme,
                                        product,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, idx) =>
                            const SizedBox(height: kDefaultPadding),
                        itemCount: data.category.products.items.length,
                      ),
                    );
                  }

                  final data = _searchQuery.parse(result.data);
                  if (data?.products == null) return SizedBox();

                  return PaginationHandler(
                    enabled: !result.isLoading &&
                        data.products.items.length != data.products.total,
                    fetchMore: () {
                      final options = FetchMoreOptions(
                        document: _searchQuery.document,
                        updateQuery: (oldData, newData) =>
                            updatePaginatedResponse(
                                oldData, newData, "products"),
                        variables: {
                          "searchQuery": _query,
                          "skip": data.products.items.length
                        },
                      );

                      fetchMore(options);
                    },
                    child: ListView.separated(
                      padding: EdgeInsets.only(
                        top: kDefaultPadding,
                        bottom: kDefaultPadding + padding.top,
                      ),
                      itemBuilder: (context, idx) {
                        if (data.products.items.length == 0 &&
                            data.authors.items.length == 0) {
                          return _buildNoItemsFound(context, _query);
                        }
                        if (idx == 0) {
                          return _buildAuthorsRow(context, data.authors.items);
                        }

                        final product = data.products.items[idx - 1];

                        return Tooltip(
                          key: Key(product.id),
                          message:
                              "${product.name} ${context.loc.by} ${product.author.name}",
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                ProductDetailPage.routeName,
                                arguments: ProductDetailPageArguments(
                                  product: product,
                                  heroTagPrefix: _heroTagPrefix,
                                ),
                              );
                            },
                            child: RoundContainer(
                              color: theme.scaffoldBackgroundColor,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildImage(product),
                                  const SizedBox(width: kDefaultPadding),
                                  Expanded(
                                    child: _buildProductInfo(
                                      theme.textTheme,
                                      product,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, idx) =>
                          const SizedBox(height: kDefaultPadding),
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

  Widget _buildAuthorsRow(BuildContext context, List<AuthorMixin> authors) {
    final theme = Theme.of(context);

    if (authors.length == 0) {
      return const SizedBox();
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
        Navigator.pushNamed(context, AuthorPage.routeName,
            arguments: AuthorPageArguments(id: author.id));
      },
      child: Tooltip(
        message: author.name,
        child: Container(
          width: _kAuthorRadius * 2,
          child: Column(
            children: [
              CircleAvatar(
                radius: _kAuthorRadius,
                backgroundColor: theme.backgroundColor,
                backgroundImage:
                    const AssetImage("assets/images/product_placeholder.png"),
                foregroundImage: NetworkImage(imageURL(author.image, 200)),
              ),
              const SizedBox(height: 5),
              Text(
                author.name,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyText1
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductInfo(TextTheme textTheme, ProductMixin product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.name,
          style: textTheme.headline6,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          product.author.name,
          style: textTheme.bodyText2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: kDefaultPadding / 2),
        Chips(
          maxNumChips: 2,
          onChipPressed: (item) => Navigator.pushReplacementNamed(
            context,
            SearchPage.routeName,
            arguments:
                SearchPageArguments(categoryID: item.id, searchQuery: _query),
          ),
          items: product.categories
              .map((c) => ChipItem(id: c.id, label: c.name))
              .toList(),
          collapsable: false,
        ),
      ],
    );
  }

  Widget _buildImage(ProductMixin product) {
    return Hero(
      tag: "image-$_heroTagPrefix-${product.id}",
      child: ProductCoverImage(
        image: product.image,
        width: kSmallProductImageWidth,
        resolution: 150,
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(BuildContext context) {
    final theme = Theme.of(context);
    final isRTL = context.locale.languageCode == "ar";

    final onFilter = () async {
      final result = await showModalBottomSheet<FilterResults>(
        context: context,
        builder: (context) => FilterDialog(
          initialSort: _currentSort,
          initialCategoryID: _currentCategoryID,
        ),
        backgroundColor: theme.backgroundColor,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefaultBorderRadius),
        ),
      );

      setState(() {
        _currentSort = result.sort;
        _currentCategoryID = result.categoryID;
      });
    };

    return SliverAppBar(
      floating: true,
      snap: true,
      toolbarHeight: kAppBarHeight,
      backgroundColor: theme.backgroundColor,
      titleSpacing: 0,
      leading: const SizedBox(),
      leadingWidth: 0,
      title: Row(
        children: [
          _buildBackButton(context, isRTL),
          const SizedBox(width: kDefaultPadding / 2),
          Expanded(
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                if (_timer?.isActive ?? false) _timer?.cancel();

                _timer =
                    Timer(const Duration(milliseconds: _kDebounceDuration), () {
                  setState(() {
                    _query = value;
                  });
                });
              },
              textInputAction: TextInputAction.search,
              autofocus: true,
              style: theme.textTheme.headline6,
              decoration: InputDecoration(
                hintText: context.loc.search,
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: kDefaultPadding / 2),
          const Icon(Icons.search),
          const SizedBox(width: kDefaultPadding),
          Stack(
            children: [
              IconButton(
                tooltip: context.loc.filter,
                icon: Icon(Icons.filter_list),
                onPressed: onFilter,
                padding: EdgeInsets.only(
                  left: isRTL ? kDefaultPadding : 0,
                  right: isRTL ? 0 : kDefaultPadding,
                ),
              ),
              if (_currentCategoryID != null || _currentSort != null)
                Positioned(
                  top: 12,
                  child: GestureDetector(
                    onTap: onFilter,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: kDangerColor,
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBackButton(BuildContext context, bool isRTL) {
    return IconButton(
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      icon: Icon(
        Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
        color: Colors.grey.shade800,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      padding: EdgeInsets.only(
        left: isRTL ? 0 : kDefaultPadding,
        right: isRTL ? kDefaultPadding : 0,
      ),
    );
  }

  Widget _buildNoItemsFound(BuildContext context, String query) {
    final theme = Theme.of(context);

    return Column(
      children: [
        const Icon(Icons.error_outline),
        const SizedBox(height: kDefaultPadding / 2),
        Text(context.loc.noResultsFound),
        Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Material(
            color: theme.primaryColor,
            borderRadius: BorderRadius.circular(9999),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => RequestBookDialog(),
                  backgroundColor: theme.backgroundColor,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                  ),
                );
              },
              child: Ink(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 1.5,
                  vertical: kDefaultPadding,
                ),
                child: Text(
                  context.loc.requestUnavailableBook.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: theme.textTheme.button.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FilterResults {
  const FilterResults({this.categoryID, this.sort});

  final String categoryID;
  final OrderBy sort;
}

class FilterDialog extends HookWidget {
  FilterDialog({this.initialCategoryID, this.initialSort});

  final String initialCategoryID;
  final OrderBy initialSort;

  final _categoriesQuery = CategoriesQuery();

  @override
  Widget build(BuildContext context) {
    final currentCategory = useState<String>(initialCategoryID);
    final currentSort = useState<OrderBy>(initialSort);
    final theme = Theme.of(context);
    final isRTL = context.locale.languageCode == "ar";

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.loc.filter,
              textAlign: TextAlign.center,
              style: theme.textTheme.headline6,
            ),
            const SizedBox(height: kDefaultPadding),
            const Divider(),
            const SizedBox(height: kDefaultPadding),
            Row(
              children: [
                Text(context.loc.category + ":"),
                const SizedBox(width: kDefaultPadding),
                Query(
                  options: QueryOptions(
                    document: _categoriesQuery.document,
                    variables: {"take": 100},
                  ),
                  builder: (result, {refetch, fetchMore}) {
                    final data = result.data != null
                        ? _categoriesQuery.parse(result.data)
                        : null;

                    return Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: kDefaultPadding / 3,
                        horizontal: kDefaultPadding * 1.2,
                      ),
                      decoration: BoxDecoration(
                        color: theme.scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(9999),
                      ),
                      child: DropdownButton<String>(
                        icon: Icon(Icons.keyboard_arrow_down),
                        underline: Container(),
                        value: currentCategory.value,
                        onChanged: (catID) {
                          currentCategory.value = catID;
                        },
                        items: [
                          DropdownMenuItem(
                            value: null,
                            child: Text(context.loc.category),
                          ),
                          for (final c in data?.categories?.items)
                            DropdownMenuItem(
                              value: c.id,
                              child: Text(c.name),
                            )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: kDefaultPadding),
            Row(
              children: [
                Text(context.loc.sort + ":"),
                const SizedBox(width: kDefaultPadding),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding / 3,
                    horizontal: kDefaultPadding * 1.2,
                  ),
                  decoration: BoxDecoration(
                    color: theme.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(9999),
                  ),
                  child: DropdownButton<OrderBy>(
                    icon: Padding(
                      padding: EdgeInsets.only(
                        left: isRTL ? 0 : kDefaultPadding,
                        right: isRTL ? kDefaultPadding : 0,
                      ),
                      child: const Icon(Icons.keyboard_arrow_down),
                    ),
                    underline: Container(),
                    value: currentSort.value,
                    onChanged: (sort) {
                      currentSort.value = sort;
                    },
                    items: [
                      DropdownMenuItem(
                        value: null,
                        child: Text(context.loc.sort),
                      ),
                      DropdownMenuItem(
                        value: OrderBy.desc,
                        child: Text(context.loc.latest),
                      ),
                      DropdownMenuItem(
                        value: OrderBy.asc,
                        child: Text(context.loc.oldest),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: kDefaultPadding * 2),
            Row(
              children: [
                Material(
                  color: theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(9999),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(
                        context,
                        FilterResults(categoryID: null, sort: null),
                      );
                    },
                    child: Ink(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding * 1.5,
                        vertical: kDefaultPadding,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.clear,
                            color: currentCategory.value != null
                                ? kDangerColor
                                : null,
                          ),
                          const SizedBox(width: kDefaultPadding),
                          Text(
                            context.loc.clear.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: theme.textTheme.button,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: kDefaultPadding),
                Expanded(
                  child: Material(
                    color: theme.accentColor,
                    borderRadius: BorderRadius.circular(9999),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(
                          context,
                          FilterResults(
                            categoryID: currentCategory.value,
                            sort: currentSort.value,
                          ),
                        );
                      },
                      child: Ink(
                        padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding * 1.5,
                          vertical: kDefaultPadding,
                        ),
                        child: Text(
                          context.loc.apply.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: theme.textTheme.button.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RequestBookDialog extends HookWidget {
  final _requestMutation = CreateRequestMutation();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final contentController = useTextEditingController();
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Mutation(
      options: MutationOptions(document: _requestMutation.document),
      builder: (sendRequest, res) {
        final onSubmit = () async {
          if (contentController.text.isNotEmpty) {
            final res = await sendRequest({"content": contentController.text})
                .networkResult;
            if (res.hasException) return;

            Navigator.pop(context);
          }
        };

        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            padding: const EdgeInsets.all(kDefaultPadding).copyWith(
              bottom: bottomPadding + kDefaultPadding,
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    context.loc.requestUnavailableBook,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headline6,
                  ),
                  const SizedBox(height: kDefaultPadding),
                  const Divider(),
                  const SizedBox(height: kDefaultPadding),
                  RoundContainer(
                    color: Colors.grey.shade200,
                    padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding / 2,
                    ),
                    child: TextField(
                      controller: contentController,
                      textInputAction: TextInputAction.next,
                      maxLines: null,
                      keyboardType: TextInputType.text,
                      onSubmitted: (v) {
                        onSubmit();
                      },
                      enableSuggestions: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: context.loc.requestBookName,
                      ),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding * 2),
                  Material(
                    color: theme.accentColor,
                    borderRadius: BorderRadius.circular(9999),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        onSubmit();
                      },
                      child: Ink(
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding * 1.5,
                          vertical: kDefaultPadding,
                        ),
                        child: Text(
                          context.loc.requestBook.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: theme.textTheme.button
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
