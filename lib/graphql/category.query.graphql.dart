import '../schema.graphql.dart';
import 'author.fragment.graphql.dart';
import 'category.fragment.graphql.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:json_annotation/json_annotation.dart';
import 'product.fragment.graphql.dart';
part 'category.query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Variables$Query$CategorySearch {
  Variables$Query$CategorySearch(
      {required this.id, this.searchQuery, this.order, this.skip, this.take});

  @override
  factory Variables$Query$CategorySearch.fromJson(Map<String, dynamic> json) =>
      _$Variables$Query$CategorySearchFromJson(json);

  final String id;

  final String? searchQuery;

  final List<Input$OrderByMap>? order;

  final int? skip;

  final int? take;

  Map<String, dynamic> toJson() => _$Variables$Query$CategorySearchToJson(this);
  int get hashCode {
    final l$id = id;
    final l$searchQuery = searchQuery;
    final l$order = order;
    final l$skip = skip;
    final l$take = take;
    return Object.hashAll([
      l$id,
      l$searchQuery,
      l$order == null ? null : Object.hashAll(l$order.map((v) => v)),
      l$skip,
      l$take
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Variables$Query$CategorySearch) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$searchQuery = searchQuery;
    final lOther$searchQuery = other.searchQuery;
    if (l$searchQuery != lOther$searchQuery) return false;
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != null && lOther$order != null) {
      if (l$order.length != lOther$order.length) return false;
      for (int i = 0; i < l$order.length; i++) {
        final l$order$entry = l$order[i];
        final lOther$order$entry = lOther$order[i];
        if (l$order$entry != lOther$order$entry) return false;
      }
    } else if (l$order != lOther$order) {
      return false;
    }

    final l$skip = skip;
    final lOther$skip = other.skip;
    if (l$skip != lOther$skip) return false;
    final l$take = take;
    final lOther$take = other.take;
    if (l$take != lOther$take) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Query$CategorySearch {
  Query$CategorySearch({this.category, required this.$__typename});

  @override
  factory Query$CategorySearch.fromJson(Map<String, dynamic> json) =>
      _$Query$CategorySearchFromJson(json);

  final Query$CategorySearch$category? category;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$CategorySearchToJson(this);
  int get hashCode {
    final l$category = category;
    final l$$__typename = $__typename;
    return Object.hashAll([l$category, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$CategorySearch) || runtimeType != other.runtimeType)
      return false;
    final l$category = category;
    final lOther$category = other.category;
    if (l$category != lOther$category) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$CategorySearch on Query$CategorySearch {
  Query$CategorySearch copyWith(
          {Query$CategorySearch$category? Function()? category,
          String? $__typename}) =>
      Query$CategorySearch(
          category: category == null ? this.category : category(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const queryDocumentCategorySearch = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'CategorySearch'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'id')),
            type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'searchQuery')),
            type: NamedTypeNode(
                name: NameNode(value: 'String'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'order')),
            type: ListTypeNode(
                type: NamedTypeNode(
                    name: NameNode(value: 'OrderByMap'), isNonNull: true),
                isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'skip')),
            type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'take')),
            type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'category'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'id'),
                  value: VariableNode(name: NameNode(value: 'id')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'products'),
                  alias: null,
                  arguments: [
                    ArgumentNode(
                        name: NameNode(value: 'searchQuery'),
                        value:
                            VariableNode(name: NameNode(value: 'searchQuery'))),
                    ArgumentNode(
                        name: NameNode(value: 'order'),
                        value: VariableNode(name: NameNode(value: 'order'))),
                    ArgumentNode(
                        name: NameNode(value: 'skip'),
                        value: VariableNode(name: NameNode(value: 'skip'))),
                    ArgumentNode(
                        name: NameNode(value: 'take'),
                        value: VariableNode(name: NameNode(value: 'take')))
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
Query$CategorySearch _parserFn$Query$CategorySearch(
        Map<String, dynamic> data) =>
    Query$CategorySearch.fromJson(data);

class Options$Query$CategorySearch
    extends graphql.QueryOptions<Query$CategorySearch> {
  Options$Query$CategorySearch(
      {String? operationName,
      required Variables$Query$CategorySearch variables,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      Duration? pollInterval,
      graphql.Context? context})
      : super(
            variables: variables.toJson(),
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            pollInterval: pollInterval,
            context: context,
            document: queryDocumentCategorySearch,
            parserFn: _parserFn$Query$CategorySearch);
}

class WatchOptions$Query$CategorySearch
    extends graphql.WatchQueryOptions<Query$CategorySearch> {
  WatchOptions$Query$CategorySearch(
      {String? operationName,
      required Variables$Query$CategorySearch variables,
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
            variables: variables.toJson(),
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            context: context,
            document: queryDocumentCategorySearch,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Query$CategorySearch);
}

class FetchMoreOptions$Query$CategorySearch extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$CategorySearch(
      {required graphql.UpdateQuery updateQuery,
      required Variables$Query$CategorySearch variables})
      : super(
            updateQuery: updateQuery,
            variables: variables.toJson(),
            document: queryDocumentCategorySearch);
}

extension ClientExtension$Query$CategorySearch on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$CategorySearch>> query$CategorySearch(
          Options$Query$CategorySearch options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$CategorySearch> watchQuery$CategorySearch(
          WatchOptions$Query$CategorySearch options) =>
      this.watchQuery(options);
  void writeQuery$CategorySearch(
          {required Query$CategorySearch data,
          required Variables$Query$CategorySearch variables,
          bool broadcast = true}) =>
      this.writeQuery(
          graphql.Request(
              operation:
                  graphql.Operation(document: queryDocumentCategorySearch),
              variables: variables.toJson()),
          data: data.toJson(),
          broadcast: broadcast);
  Query$CategorySearch? readQuery$CategorySearch(
      {required Variables$Query$CategorySearch variables,
      bool optimistic = true}) {
    final result = this.readQuery(
        graphql.Request(
            operation: graphql.Operation(document: queryDocumentCategorySearch),
            variables: variables.toJson()),
        optimistic: optimistic);
    return result == null ? null : Query$CategorySearch.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$CategorySearch> useQuery$CategorySearch(
        Options$Query$CategorySearch options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$CategorySearch> useWatchQuery$CategorySearch(
        WatchOptions$Query$CategorySearch options) =>
    graphql_flutter.useWatchQuery(options);

class Query$CategorySearch$Widget
    extends graphql_flutter.Query<Query$CategorySearch> {
  Query$CategorySearch$Widget(
      {widgets.Key? key,
      required Options$Query$CategorySearch options,
      required graphql_flutter.QueryBuilder<Query$CategorySearch> builder})
      : super(key: key, options: options, builder: builder);
}

@JsonSerializable(explicitToJson: true)
class Query$CategorySearch$category {
  Query$CategorySearch$category(
      {required this.id,
      required this.name,
      required this.products,
      required this.$__typename});

  @override
  factory Query$CategorySearch$category.fromJson(Map<String, dynamic> json) =>
      _$Query$CategorySearch$categoryFromJson(json);

  final String id;

  final String name;

  final Query$CategorySearch$category$products products;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$CategorySearch$categoryToJson(this);
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
    if (!(other is Query$CategorySearch$category) ||
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

extension UtilityExtension$Query$CategorySearch$category
    on Query$CategorySearch$category {
  Query$CategorySearch$category copyWith(
          {String? id,
          String? name,
          Query$CategorySearch$category$products? products,
          String? $__typename}) =>
      Query$CategorySearch$category(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          products: products == null ? this.products : products,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$CategorySearch$category$products
    implements Fragment$PaginatedProductResponse {
  Query$CategorySearch$category$products(
      {required this.items,
      required this.hasMore,
      required this.total,
      required this.$__typename});

  @override
  factory Query$CategorySearch$category$products.fromJson(
          Map<String, dynamic> json) =>
      _$Query$CategorySearch$category$productsFromJson(json);

  final List<Query$CategorySearch$category$products$items> items;

  final bool hasMore;

  final int total;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$CategorySearch$category$productsToJson(this);
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
    if (!(other is Query$CategorySearch$category$products) ||
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

extension UtilityExtension$Query$CategorySearch$category$products
    on Query$CategorySearch$category$products {
  Query$CategorySearch$category$products copyWith(
          {List<Query$CategorySearch$category$products$items>? items,
          bool? hasMore,
          int? total,
          String? $__typename}) =>
      Query$CategorySearch$category$products(
          items: items == null ? this.items : items,
          hasMore: hasMore == null ? this.hasMore : hasMore,
          total: total == null ? this.total : total,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$CategorySearch$category$products$items
    implements Fragment$PaginatedProductResponse$items, Fragment$Product {
  Query$CategorySearch$category$products$items(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.overview,
      required this.author,
      required this.categories,
      required this.$__typename});

  @override
  factory Query$CategorySearch$category$products$items.fromJson(
          Map<String, dynamic> json) =>
      _$Query$CategorySearch$category$products$itemsFromJson(json);

  final String id;

  final String name;

  final double price;

  final String image;

  final String overview;

  final Query$CategorySearch$category$products$items$author author;

  final List<Query$CategorySearch$category$products$items$categories>
      categories;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$CategorySearch$category$products$itemsToJson(this);
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
    if (!(other is Query$CategorySearch$category$products$items) ||
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

extension UtilityExtension$Query$CategorySearch$category$products$items
    on Query$CategorySearch$category$products$items {
  Query$CategorySearch$category$products$items copyWith(
          {String? id,
          String? name,
          double? price,
          String? image,
          String? overview,
          Query$CategorySearch$category$products$items$author? author,
          List<Query$CategorySearch$category$products$items$categories>?
              categories,
          String? $__typename}) =>
      Query$CategorySearch$category$products$items(
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
class Query$CategorySearch$category$products$items$author
    implements
        Fragment$PaginatedProductResponse$items$author,
        Fragment$Product$author,
        Fragment$Author {
  Query$CategorySearch$category$products$items$author(
      {required this.id,
      required this.name,
      required this.image,
      required this.overview,
      required this.$__typename});

  @override
  factory Query$CategorySearch$category$products$items$author.fromJson(
          Map<String, dynamic> json) =>
      _$Query$CategorySearch$category$products$items$authorFromJson(json);

  final String id;

  final String name;

  final String image;

  final String overview;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$CategorySearch$category$products$items$authorToJson(this);
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
    if (!(other is Query$CategorySearch$category$products$items$author) ||
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

extension UtilityExtension$Query$CategorySearch$category$products$items$author
    on Query$CategorySearch$category$products$items$author {
  Query$CategorySearch$category$products$items$author copyWith(
          {String? id,
          String? name,
          String? image,
          String? overview,
          String? $__typename}) =>
      Query$CategorySearch$category$products$items$author(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          image: image == null ? this.image : image,
          overview: overview == null ? this.overview : overview,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$CategorySearch$category$products$items$categories
    implements
        Fragment$PaginatedProductResponse$items$categories,
        Fragment$Product$categories,
        Fragment$Category {
  Query$CategorySearch$category$products$items$categories(
      {required this.id, required this.name, required this.$__typename});

  @override
  factory Query$CategorySearch$category$products$items$categories.fromJson(
          Map<String, dynamic> json) =>
      _$Query$CategorySearch$category$products$items$categoriesFromJson(json);

  final String id;

  final String name;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$CategorySearch$category$products$items$categoriesToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$CategorySearch$category$products$items$categories) ||
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

extension UtilityExtension$Query$CategorySearch$category$products$items$categories
    on Query$CategorySearch$category$products$items$categories {
  Query$CategorySearch$category$products$items$categories copyWith(
          {String? id, String? name, String? $__typename}) =>
      Query$CategorySearch$category$products$items$categories(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
