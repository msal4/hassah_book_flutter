import 'author.fragment.graphql.dart';
import 'category.fragment.graphql.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:json_annotation/json_annotation.dart';
import 'product.fragment.graphql.dart';
part 'home.query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Query$Home {
  Query$Home(
      {required this.latestProducts,
      required this.categories,
      required this.$__typename});

  @override
  factory Query$Home.fromJson(Map<String, dynamic> json) =>
      _$Query$HomeFromJson(json);

  final Query$Home$latestProducts latestProducts;

  final Query$Home$categories categories;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$HomeToJson(this);
  int get hashCode {
    final l$latestProducts = latestProducts;
    final l$categories = categories;
    final l$$__typename = $__typename;
    return Object.hashAll([l$latestProducts, l$categories, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Home) || runtimeType != other.runtimeType)
      return false;
    final l$latestProducts = latestProducts;
    final lOther$latestProducts = other.latestProducts;
    if (l$latestProducts != lOther$latestProducts) return false;
    final l$categories = categories;
    final lOther$categories = other.categories;
    if (l$categories != lOther$categories) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$Home on Query$Home {
  Query$Home copyWith(
          {Query$Home$latestProducts? latestProducts,
          Query$Home$categories? categories,
          String? $__typename}) =>
      Query$Home(
          latestProducts:
              latestProducts == null ? this.latestProducts : latestProducts,
          categories: categories == null ? this.categories : categories,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const queryDocumentHome = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Home'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'products'),
            alias: NameNode(value: 'latestProducts'),
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'order'),
                  value: ListValueNode(values: [
                    ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'field'),
                          value: StringValueNode(
                              value: 'createdAt', isBlock: false)),
                      ObjectFieldNode(
                          name: NameNode(value: 'order'),
                          value: EnumValueNode(name: NameNode(value: 'DESC')))
                    ])
                  ]))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                  name: NameNode(value: 'PaginatedProductResponse'),
                  directives: []),
              FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: 'categories'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                  name: NameNode(value: 'PaginatedCategoryDetailResponse'),
                  directives: []),
              FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  fragmentDefinitionPaginatedProductResponse,
  fragmentDefinitionPaginatedCategoryDetailResponse,
  fragmentDefinitionProduct,
  fragmentDefinitionCategoryDetail,
  fragmentDefinitionAuthor,
  fragmentDefinitionCategory,
]);
Query$Home _parserFn$Query$Home(Map<String, dynamic> data) =>
    Query$Home.fromJson(data);

class Options$Query$Home extends graphql.QueryOptions<Query$Home> {
  Options$Query$Home(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      Duration? pollInterval,
      graphql.Context? context})
      : super(
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            pollInterval: pollInterval,
            context: context,
            document: queryDocumentHome,
            parserFn: _parserFn$Query$Home);
}

class WatchOptions$Query$Home extends graphql.WatchQueryOptions<Query$Home> {
  WatchOptions$Query$Home(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      Duration? pollInterval,
      bool? eagerlyFetchResults,
      bool carryForwardDataOnException = true,
      bool fetchResults = false})
      : super(
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            context: context,
            document: queryDocumentHome,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Query$Home);
}

class FetchMoreOptions$Query$Home extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Home({required graphql.UpdateQuery updateQuery})
      : super(updateQuery: updateQuery, document: queryDocumentHome);
}

extension ClientExtension$Query$Home on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Home>> query$Home(
          [Options$Query$Home? options]) async =>
      await this.query(options ?? Options$Query$Home());
  graphql.ObservableQuery<Query$Home> watchQuery$Home(
          [WatchOptions$Query$Home? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$Home());
  void writeQuery$Home({required Query$Home data, bool broadcast = true}) =>
      this.writeQuery(
          graphql.Request(
              operation: graphql.Operation(document: queryDocumentHome)),
          data: data.toJson(),
          broadcast: broadcast);
  Query$Home? readQuery$Home({bool optimistic = true}) {
    final result = this.readQuery(
        graphql.Request(
            operation: graphql.Operation(document: queryDocumentHome)),
        optimistic: optimistic);
    return result == null ? null : Query$Home.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$Home> useQuery$Home(
        [Options$Query$Home? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$Home());
graphql.ObservableQuery<Query$Home> useWatchQuery$Home(
        [WatchOptions$Query$Home? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$Home());

class Query$Home$Widget extends graphql_flutter.Query<Query$Home> {
  Query$Home$Widget(
      {widgets.Key? key,
      Options$Query$Home? options,
      required graphql_flutter.QueryBuilder<Query$Home> builder})
      : super(
            key: key,
            options: options ?? Options$Query$Home(),
            builder: builder);
}

@JsonSerializable(explicitToJson: true)
class Query$Home$latestProducts implements Fragment$PaginatedProductResponse {
  Query$Home$latestProducts(
      {required this.items,
      required this.hasMore,
      required this.total,
      required this.$__typename});

  @override
  factory Query$Home$latestProducts.fromJson(Map<String, dynamic> json) =>
      _$Query$Home$latestProductsFromJson(json);

  final List<Query$Home$latestProducts$items> items;

  final bool hasMore;

  final int total;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$Home$latestProductsToJson(this);
  int get hashCode {
    final l$items = items;
    final l$hasMore = hasMore;
    final l$total = total;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$items.map((v) => v)),
      l$hasMore,
      l$total,
      l$$__typename
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Home$latestProducts) ||
        runtimeType != other.runtimeType) return false;
    final l$items = items;
    final lOther$items = other.items;
    if (l$items.length != lOther$items.length) return false;
    for (int i = 0; i < l$items.length; i++) {
      final l$items$entry = l$items[i];
      final lOther$items$entry = lOther$items[i];
      if (l$items$entry != lOther$items$entry) return false;
    }

    final l$hasMore = hasMore;
    final lOther$hasMore = other.hasMore;
    if (l$hasMore != lOther$hasMore) return false;
    final l$total = total;
    final lOther$total = other.total;
    if (l$total != lOther$total) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$Home$latestProducts
    on Query$Home$latestProducts {
  Query$Home$latestProducts copyWith(
          {List<Query$Home$latestProducts$items>? items,
          bool? hasMore,
          int? total,
          String? $__typename}) =>
      Query$Home$latestProducts(
          items: items == null ? this.items : items,
          hasMore: hasMore == null ? this.hasMore : hasMore,
          total: total == null ? this.total : total,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$Home$latestProducts$items
    implements Fragment$PaginatedProductResponse$items, Fragment$Product {
  Query$Home$latestProducts$items(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.overview,
      required this.author,
      required this.categories,
      required this.$__typename});

  @override
  factory Query$Home$latestProducts$items.fromJson(Map<String, dynamic> json) =>
      _$Query$Home$latestProducts$itemsFromJson(json);

  final String id;

  final String name;

  final double price;

  final String image;

  final String overview;

  final Query$Home$latestProducts$items$author author;

  final List<Query$Home$latestProducts$items$categories> categories;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$Home$latestProducts$itemsToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$price = price;
    final l$image = image;
    final l$overview = overview;
    final l$author = author;
    final l$categories = categories;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$price,
      l$image,
      l$overview,
      l$author,
      Object.hashAll(l$categories.map((v) => v)),
      l$$__typename
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Home$latestProducts$items) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$price = price;
    final lOther$price = other.price;
    if (l$price != lOther$price) return false;
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) return false;
    final l$overview = overview;
    final lOther$overview = other.overview;
    if (l$overview != lOther$overview) return false;
    final l$author = author;
    final lOther$author = other.author;
    if (l$author != lOther$author) return false;
    final l$categories = categories;
    final lOther$categories = other.categories;
    if (l$categories.length != lOther$categories.length) return false;
    for (int i = 0; i < l$categories.length; i++) {
      final l$categories$entry = l$categories[i];
      final lOther$categories$entry = lOther$categories[i];
      if (l$categories$entry != lOther$categories$entry) return false;
    }

    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$Home$latestProducts$items
    on Query$Home$latestProducts$items {
  Query$Home$latestProducts$items copyWith(
          {String? id,
          String? name,
          double? price,
          String? image,
          String? overview,
          Query$Home$latestProducts$items$author? author,
          List<Query$Home$latestProducts$items$categories>? categories,
          String? $__typename}) =>
      Query$Home$latestProducts$items(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          price: price == null ? this.price : price,
          image: image == null ? this.image : image,
          overview: overview == null ? this.overview : overview,
          author: author == null ? this.author : author,
          categories: categories == null ? this.categories : categories,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$Home$latestProducts$items$author
    implements
        Fragment$PaginatedProductResponse$items$author,
        Fragment$Product$author,
        Fragment$Author {
  Query$Home$latestProducts$items$author(
      {required this.id,
      required this.name,
      required this.image,
      required this.overview,
      required this.$__typename});

  @override
  factory Query$Home$latestProducts$items$author.fromJson(
          Map<String, dynamic> json) =>
      _$Query$Home$latestProducts$items$authorFromJson(json);

  final String id;

  final String name;

  final String image;

  final String overview;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$Home$latestProducts$items$authorToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$image = image;
    final l$overview = overview;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$image, l$overview, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Home$latestProducts$items$author) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) return false;
    final l$overview = overview;
    final lOther$overview = other.overview;
    if (l$overview != lOther$overview) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$Home$latestProducts$items$author
    on Query$Home$latestProducts$items$author {
  Query$Home$latestProducts$items$author copyWith(
          {String? id,
          String? name,
          String? image,
          String? overview,
          String? $__typename}) =>
      Query$Home$latestProducts$items$author(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          image: image == null ? this.image : image,
          overview: overview == null ? this.overview : overview,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$Home$latestProducts$items$categories
    implements
        Fragment$PaginatedProductResponse$items$categories,
        Fragment$Product$categories,
        Fragment$Category {
  Query$Home$latestProducts$items$categories(
      {required this.id, required this.name, required this.$__typename});

  @override
  factory Query$Home$latestProducts$items$categories.fromJson(
          Map<String, dynamic> json) =>
      _$Query$Home$latestProducts$items$categoriesFromJson(json);

  final String id;

  final String name;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$Home$latestProducts$items$categoriesToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Home$latestProducts$items$categories) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$Home$latestProducts$items$categories
    on Query$Home$latestProducts$items$categories {
  Query$Home$latestProducts$items$categories copyWith(
          {String? id, String? name, String? $__typename}) =>
      Query$Home$latestProducts$items$categories(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$Home$categories
    implements Fragment$PaginatedCategoryDetailResponse {
  Query$Home$categories(
      {required this.items,
      required this.hasMore,
      required this.total,
      required this.$__typename});

  @override
  factory Query$Home$categories.fromJson(Map<String, dynamic> json) =>
      _$Query$Home$categoriesFromJson(json);

  final List<Query$Home$categories$items> items;

  final bool hasMore;

  final int total;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$Home$categoriesToJson(this);
  int get hashCode {
    final l$items = items;
    final l$hasMore = hasMore;
    final l$total = total;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$items.map((v) => v)),
      l$hasMore,
      l$total,
      l$$__typename
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Home$categories) || runtimeType != other.runtimeType)
      return false;
    final l$items = items;
    final lOther$items = other.items;
    if (l$items.length != lOther$items.length) return false;
    for (int i = 0; i < l$items.length; i++) {
      final l$items$entry = l$items[i];
      final lOther$items$entry = lOther$items[i];
      if (l$items$entry != lOther$items$entry) return false;
    }

    final l$hasMore = hasMore;
    final lOther$hasMore = other.hasMore;
    if (l$hasMore != lOther$hasMore) return false;
    final l$total = total;
    final lOther$total = other.total;
    if (l$total != lOther$total) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$Home$categories on Query$Home$categories {
  Query$Home$categories copyWith(
          {List<Query$Home$categories$items>? items,
          bool? hasMore,
          int? total,
          String? $__typename}) =>
      Query$Home$categories(
          items: items == null ? this.items : items,
          hasMore: hasMore == null ? this.hasMore : hasMore,
          total: total == null ? this.total : total,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$Home$categories$items
    implements
        Fragment$PaginatedCategoryDetailResponse$items,
        Fragment$CategoryDetail {
  Query$Home$categories$items(
      {required this.id,
      required this.name,
      required this.products,
      required this.$__typename});

  @override
  factory Query$Home$categories$items.fromJson(Map<String, dynamic> json) =>
      _$Query$Home$categories$itemsFromJson(json);

  final String id;

  final String name;

  final Query$Home$categories$items$products products;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$Home$categories$itemsToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$products = products;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$products, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Home$categories$items) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$products = products;
    final lOther$products = other.products;
    if (l$products != lOther$products) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$Home$categories$items
    on Query$Home$categories$items {
  Query$Home$categories$items copyWith(
          {String? id,
          String? name,
          Query$Home$categories$items$products? products,
          String? $__typename}) =>
      Query$Home$categories$items(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          products: products == null ? this.products : products,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$Home$categories$items$products
    implements
        Fragment$PaginatedCategoryDetailResponse$items$products,
        Fragment$CategoryDetail$products,
        Fragment$PaginatedProductResponse {
  Query$Home$categories$items$products(
      {required this.items,
      required this.hasMore,
      required this.total,
      required this.$__typename});

  @override
  factory Query$Home$categories$items$products.fromJson(
          Map<String, dynamic> json) =>
      _$Query$Home$categories$items$productsFromJson(json);

  final List<Query$Home$categories$items$products$items> items;

  final bool hasMore;

  final int total;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$Home$categories$items$productsToJson(this);
  int get hashCode {
    final l$items = items;
    final l$hasMore = hasMore;
    final l$total = total;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$items.map((v) => v)),
      l$hasMore,
      l$total,
      l$$__typename
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Home$categories$items$products) ||
        runtimeType != other.runtimeType) return false;
    final l$items = items;
    final lOther$items = other.items;
    if (l$items.length != lOther$items.length) return false;
    for (int i = 0; i < l$items.length; i++) {
      final l$items$entry = l$items[i];
      final lOther$items$entry = lOther$items[i];
      if (l$items$entry != lOther$items$entry) return false;
    }

    final l$hasMore = hasMore;
    final lOther$hasMore = other.hasMore;
    if (l$hasMore != lOther$hasMore) return false;
    final l$total = total;
    final lOther$total = other.total;
    if (l$total != lOther$total) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$Home$categories$items$products
    on Query$Home$categories$items$products {
  Query$Home$categories$items$products copyWith(
          {List<Query$Home$categories$items$products$items>? items,
          bool? hasMore,
          int? total,
          String? $__typename}) =>
      Query$Home$categories$items$products(
          items: items == null ? this.items : items,
          hasMore: hasMore == null ? this.hasMore : hasMore,
          total: total == null ? this.total : total,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$Home$categories$items$products$items
    implements
        Fragment$PaginatedCategoryDetailResponse$items$products$items,
        Fragment$CategoryDetail$products$items,
        Fragment$PaginatedProductResponse$items,
        Fragment$Product {
  Query$Home$categories$items$products$items(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.overview,
      required this.author,
      required this.categories,
      required this.$__typename});

  @override
  factory Query$Home$categories$items$products$items.fromJson(
          Map<String, dynamic> json) =>
      _$Query$Home$categories$items$products$itemsFromJson(json);

  final String id;

  final String name;

  final double price;

  final String image;

  final String overview;

  final Query$Home$categories$items$products$items$author author;

  final List<Query$Home$categories$items$products$items$categories> categories;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$Home$categories$items$products$itemsToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$price = price;
    final l$image = image;
    final l$overview = overview;
    final l$author = author;
    final l$categories = categories;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$price,
      l$image,
      l$overview,
      l$author,
      Object.hashAll(l$categories.map((v) => v)),
      l$$__typename
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Home$categories$items$products$items) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$price = price;
    final lOther$price = other.price;
    if (l$price != lOther$price) return false;
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) return false;
    final l$overview = overview;
    final lOther$overview = other.overview;
    if (l$overview != lOther$overview) return false;
    final l$author = author;
    final lOther$author = other.author;
    if (l$author != lOther$author) return false;
    final l$categories = categories;
    final lOther$categories = other.categories;
    if (l$categories.length != lOther$categories.length) return false;
    for (int i = 0; i < l$categories.length; i++) {
      final l$categories$entry = l$categories[i];
      final lOther$categories$entry = lOther$categories[i];
      if (l$categories$entry != lOther$categories$entry) return false;
    }

    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$Home$categories$items$products$items
    on Query$Home$categories$items$products$items {
  Query$Home$categories$items$products$items copyWith(
          {String? id,
          String? name,
          double? price,
          String? image,
          String? overview,
          Query$Home$categories$items$products$items$author? author,
          List<Query$Home$categories$items$products$items$categories>?
              categories,
          String? $__typename}) =>
      Query$Home$categories$items$products$items(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          price: price == null ? this.price : price,
          image: image == null ? this.image : image,
          overview: overview == null ? this.overview : overview,
          author: author == null ? this.author : author,
          categories: categories == null ? this.categories : categories,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$Home$categories$items$products$items$author
    implements
        Fragment$PaginatedCategoryDetailResponse$items$products$items$author,
        Fragment$CategoryDetail$products$items$author,
        Fragment$PaginatedProductResponse$items$author,
        Fragment$Product$author,
        Fragment$Author {
  Query$Home$categories$items$products$items$author(
      {required this.id,
      required this.name,
      required this.image,
      required this.overview,
      required this.$__typename});

  @override
  factory Query$Home$categories$items$products$items$author.fromJson(
          Map<String, dynamic> json) =>
      _$Query$Home$categories$items$products$items$authorFromJson(json);

  final String id;

  final String name;

  final String image;

  final String overview;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$Home$categories$items$products$items$authorToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$image = image;
    final l$overview = overview;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$image, l$overview, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Home$categories$items$products$items$author) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) return false;
    final l$overview = overview;
    final lOther$overview = other.overview;
    if (l$overview != lOther$overview) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$Home$categories$items$products$items$author
    on Query$Home$categories$items$products$items$author {
  Query$Home$categories$items$products$items$author copyWith(
          {String? id,
          String? name,
          String? image,
          String? overview,
          String? $__typename}) =>
      Query$Home$categories$items$products$items$author(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          image: image == null ? this.image : image,
          overview: overview == null ? this.overview : overview,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$Home$categories$items$products$items$categories
    implements
        Fragment$PaginatedCategoryDetailResponse$items$products$items$categories,
        Fragment$CategoryDetail$products$items$categories,
        Fragment$PaginatedProductResponse$items$categories,
        Fragment$Product$categories,
        Fragment$Category {
  Query$Home$categories$items$products$items$categories(
      {required this.id, required this.name, required this.$__typename});

  @override
  factory Query$Home$categories$items$products$items$categories.fromJson(
          Map<String, dynamic> json) =>
      _$Query$Home$categories$items$products$items$categoriesFromJson(json);

  final String id;

  final String name;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$Home$categories$items$products$items$categoriesToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Home$categories$items$products$items$categories) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$Home$categories$items$products$items$categories
    on Query$Home$categories$items$products$items$categories {
  Query$Home$categories$items$products$items$categories copyWith(
          {String? id, String? name, String? $__typename}) =>
      Query$Home$categories$items$products$items$categories(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
