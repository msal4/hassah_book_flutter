import 'author.fragment.graphql.dart';
import 'category.fragment.graphql.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:json_annotation/json_annotation.dart';
import 'product.fragment.graphql.dart';
part 'products.query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Query$Products {
  Query$Products({required this.products, required this.$__typename});

  @override
  factory Query$Products.fromJson(Map<String, dynamic> json) =>
      _$Query$ProductsFromJson(json);

  final Query$Products$products products;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$ProductsToJson(this);
  int get hashCode {
    final l$products = products;
    final l$$__typename = $__typename;
    return Object.hashAll([l$products, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Products) || runtimeType != other.runtimeType)
      return false;
    final l$products = products;
    final lOther$products = other.products;
    if (l$products != lOther$products) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$Products on Query$Products {
  Query$Products copyWith(
          {Query$Products$products? products, String? $__typename}) =>
      Query$Products(
          products: products == null ? this.products : products,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const queryDocumentProducts = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Products'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'products'),
            alias: null,
            arguments: [],
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
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  fragmentDefinitionPaginatedProductResponse,
  fragmentDefinitionProduct,
  fragmentDefinitionAuthor,
  fragmentDefinitionCategory,
]);
Query$Products _parserFn$Query$Products(Map<String, dynamic> data) =>
    Query$Products.fromJson(data);

class Options$Query$Products extends graphql.QueryOptions<Query$Products> {
  Options$Query$Products(
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
            document: queryDocumentProducts,
            parserFn: _parserFn$Query$Products);
}

class WatchOptions$Query$Products
    extends graphql.WatchQueryOptions<Query$Products> {
  WatchOptions$Query$Products(
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
            document: queryDocumentProducts,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Query$Products);
}

class FetchMoreOptions$Query$Products extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Products({required graphql.UpdateQuery updateQuery})
      : super(updateQuery: updateQuery, document: queryDocumentProducts);
}

extension ClientExtension$Query$Products on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Products>> query$Products(
          [Options$Query$Products? options]) async =>
      await this.query(options ?? Options$Query$Products());
  graphql.ObservableQuery<Query$Products> watchQuery$Products(
          [WatchOptions$Query$Products? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$Products());
  void writeQuery$Products(
          {required Query$Products data, bool broadcast = true}) =>
      this.writeQuery(
          graphql.Request(
              operation: graphql.Operation(document: queryDocumentProducts)),
          data: data.toJson(),
          broadcast: broadcast);
  Query$Products? readQuery$Products({bool optimistic = true}) {
    final result = this.readQuery(
        graphql.Request(
            operation: graphql.Operation(document: queryDocumentProducts)),
        optimistic: optimistic);
    return result == null ? null : Query$Products.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$Products> useQuery$Products(
        [Options$Query$Products? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$Products());
graphql.ObservableQuery<Query$Products> useWatchQuery$Products(
        [WatchOptions$Query$Products? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$Products());

class Query$Products$Widget extends graphql_flutter.Query<Query$Products> {
  Query$Products$Widget(
      {widgets.Key? key,
      Options$Query$Products? options,
      required graphql_flutter.QueryBuilder<Query$Products> builder})
      : super(
            key: key,
            options: options ?? Options$Query$Products(),
            builder: builder);
}

@JsonSerializable(explicitToJson: true)
class Query$Products$products implements Fragment$PaginatedProductResponse {
  Query$Products$products(
      {required this.items,
      required this.hasMore,
      required this.total,
      required this.$__typename});

  @override
  factory Query$Products$products.fromJson(Map<String, dynamic> json) =>
      _$Query$Products$productsFromJson(json);

  final List<Query$Products$products$items> items;

  final bool hasMore;

  final int total;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$Products$productsToJson(this);
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
    if (!(other is Query$Products$products) || runtimeType != other.runtimeType)
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

extension UtilityExtension$Query$Products$products on Query$Products$products {
  Query$Products$products copyWith(
          {List<Query$Products$products$items>? items,
          bool? hasMore,
          int? total,
          String? $__typename}) =>
      Query$Products$products(
          items: items == null ? this.items : items,
          hasMore: hasMore == null ? this.hasMore : hasMore,
          total: total == null ? this.total : total,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$Products$products$items
    implements Fragment$PaginatedProductResponse$items, Fragment$Product {
  Query$Products$products$items(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.overview,
      required this.author,
      required this.categories,
      required this.$__typename});

  @override
  factory Query$Products$products$items.fromJson(Map<String, dynamic> json) =>
      _$Query$Products$products$itemsFromJson(json);

  final String id;

  final String name;

  final double price;

  final String image;

  final String overview;

  final Query$Products$products$items$author author;

  final List<Query$Products$products$items$categories> categories;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$Products$products$itemsToJson(this);
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
    if (!(other is Query$Products$products$items) ||
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

extension UtilityExtension$Query$Products$products$items
    on Query$Products$products$items {
  Query$Products$products$items copyWith(
          {String? id,
          String? name,
          double? price,
          String? image,
          String? overview,
          Query$Products$products$items$author? author,
          List<Query$Products$products$items$categories>? categories,
          String? $__typename}) =>
      Query$Products$products$items(
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
class Query$Products$products$items$author
    implements
        Fragment$PaginatedProductResponse$items$author,
        Fragment$Product$author,
        Fragment$Author {
  Query$Products$products$items$author(
      {required this.id,
      required this.name,
      required this.image,
      required this.overview,
      required this.$__typename});

  @override
  factory Query$Products$products$items$author.fromJson(
          Map<String, dynamic> json) =>
      _$Query$Products$products$items$authorFromJson(json);

  final String id;

  final String name;

  final String image;

  final String overview;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$Products$products$items$authorToJson(this);
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
    if (!(other is Query$Products$products$items$author) ||
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

extension UtilityExtension$Query$Products$products$items$author
    on Query$Products$products$items$author {
  Query$Products$products$items$author copyWith(
          {String? id,
          String? name,
          String? image,
          String? overview,
          String? $__typename}) =>
      Query$Products$products$items$author(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          image: image == null ? this.image : image,
          overview: overview == null ? this.overview : overview,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$Products$products$items$categories
    implements
        Fragment$PaginatedProductResponse$items$categories,
        Fragment$Product$categories,
        Fragment$Category {
  Query$Products$products$items$categories(
      {required this.id, required this.name, required this.$__typename});

  @override
  factory Query$Products$products$items$categories.fromJson(
          Map<String, dynamic> json) =>
      _$Query$Products$products$items$categoriesFromJson(json);

  final String id;

  final String name;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$Products$products$items$categoriesToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Products$products$items$categories) ||
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

extension UtilityExtension$Query$Products$products$items$categories
    on Query$Products$products$items$categories {
  Query$Products$products$items$categories copyWith(
          {String? id, String? name, String? $__typename}) =>
      Query$Products$products$items$categories(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
