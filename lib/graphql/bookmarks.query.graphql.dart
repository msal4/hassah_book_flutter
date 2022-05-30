import 'author.fragment.graphql.dart';
import 'bookmark.fragment.graphql.dart';
import 'category.fragment.graphql.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:hassah_book_flutter/common/utils/coercers.dart';
import 'package:json_annotation/json_annotation.dart';
import 'product.fragment.graphql.dart';
part 'bookmarks.query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Variables$Query$Bookmarks {
  Variables$Query$Bookmarks({this.skip, this.take});

  @override
  factory Variables$Query$Bookmarks.fromJson(Map<String, dynamic> json) =>
      _$Variables$Query$BookmarksFromJson(json);

  final int? skip;

  final int? take;

  Map<String, dynamic> toJson() => _$Variables$Query$BookmarksToJson(this);
  int get hashCode {
    final l$skip = skip;
    final l$take = take;
    return Object.hashAll([l$skip, l$take]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Variables$Query$Bookmarks) ||
        runtimeType != other.runtimeType) return false;
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
class Query$Bookmarks {
  Query$Bookmarks({required this.bookmarks, required this.$__typename});

  @override
  factory Query$Bookmarks.fromJson(Map<String, dynamic> json) =>
      _$Query$BookmarksFromJson(json);

  final Query$Bookmarks$bookmarks bookmarks;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$BookmarksToJson(this);
  int get hashCode {
    final l$bookmarks = bookmarks;
    final l$$__typename = $__typename;
    return Object.hashAll([l$bookmarks, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Bookmarks) || runtimeType != other.runtimeType)
      return false;
    final l$bookmarks = bookmarks;
    final lOther$bookmarks = other.bookmarks;
    if (l$bookmarks != lOther$bookmarks) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$Bookmarks on Query$Bookmarks {
  Query$Bookmarks copyWith(
          {Query$Bookmarks$bookmarks? bookmarks, String? $__typename}) =>
      Query$Bookmarks(
          bookmarks: bookmarks == null ? this.bookmarks : bookmarks,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const queryDocumentBookmarks = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Bookmarks'),
      variableDefinitions: [
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
            name: NameNode(value: 'favorites'),
            alias: NameNode(value: 'bookmarks'),
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'skip'),
                  value: VariableNode(name: NameNode(value: 'skip'))),
              ArgumentNode(
                  name: NameNode(value: 'take'),
                  value: VariableNode(name: NameNode(value: 'take'))),
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
                  name: NameNode(value: 'PaginatedBookmarkResponse'),
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
  fragmentDefinitionPaginatedBookmarkResponse,
  fragmentDefinitionBookmark,
  fragmentDefinitionProduct,
  fragmentDefinitionAuthor,
  fragmentDefinitionCategory,
]);
Query$Bookmarks _parserFn$Query$Bookmarks(Map<String, dynamic> data) =>
    Query$Bookmarks.fromJson(data);

class Options$Query$Bookmarks extends graphql.QueryOptions<Query$Bookmarks> {
  Options$Query$Bookmarks(
      {String? operationName,
      Variables$Query$Bookmarks? variables,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      Duration? pollInterval,
      graphql.Context? context})
      : super(
            variables: variables?.toJson() ?? {},
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            pollInterval: pollInterval,
            context: context,
            document: queryDocumentBookmarks,
            parserFn: _parserFn$Query$Bookmarks);
}

class WatchOptions$Query$Bookmarks
    extends graphql.WatchQueryOptions<Query$Bookmarks> {
  WatchOptions$Query$Bookmarks(
      {String? operationName,
      Variables$Query$Bookmarks? variables,
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
            variables: variables?.toJson() ?? {},
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            context: context,
            document: queryDocumentBookmarks,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Query$Bookmarks);
}

class FetchMoreOptions$Query$Bookmarks extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Bookmarks(
      {required graphql.UpdateQuery updateQuery,
      Variables$Query$Bookmarks? variables})
      : super(
            updateQuery: updateQuery,
            variables: variables?.toJson() ?? {},
            document: queryDocumentBookmarks);
}

extension ClientExtension$Query$Bookmarks on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Bookmarks>> query$Bookmarks(
          [Options$Query$Bookmarks? options]) async =>
      await this.query(options ?? Options$Query$Bookmarks());
  graphql.ObservableQuery<Query$Bookmarks> watchQuery$Bookmarks(
          [WatchOptions$Query$Bookmarks? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$Bookmarks());
  void writeQuery$Bookmarks(
          {required Query$Bookmarks data,
          Variables$Query$Bookmarks? variables,
          bool broadcast = true}) =>
      this.writeQuery(
          graphql.Request(
              operation: graphql.Operation(document: queryDocumentBookmarks),
              variables: variables?.toJson() ?? const {}),
          data: data.toJson(),
          broadcast: broadcast);
  Query$Bookmarks? readQuery$Bookmarks(
      {Variables$Query$Bookmarks? variables, bool optimistic = true}) {
    final result = this.readQuery(
        graphql.Request(
            operation: graphql.Operation(document: queryDocumentBookmarks),
            variables: variables?.toJson() ?? const {}),
        optimistic: optimistic);
    return result == null ? null : Query$Bookmarks.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$Bookmarks> useQuery$Bookmarks(
        [Options$Query$Bookmarks? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$Bookmarks());
graphql.ObservableQuery<Query$Bookmarks> useWatchQuery$Bookmarks(
        [WatchOptions$Query$Bookmarks? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$Bookmarks());

class Query$Bookmarks$Widget extends graphql_flutter.Query<Query$Bookmarks> {
  Query$Bookmarks$Widget(
      {widgets.Key? key,
      Options$Query$Bookmarks? options,
      required graphql_flutter.QueryBuilder<Query$Bookmarks> builder})
      : super(
            key: key,
            options: options ?? Options$Query$Bookmarks(),
            builder: builder);
}

@JsonSerializable(explicitToJson: true)
class Query$Bookmarks$bookmarks implements Fragment$PaginatedBookmarkResponse {
  Query$Bookmarks$bookmarks(
      {required this.items,
      required this.hasMore,
      required this.total,
      required this.$__typename});

  @override
  factory Query$Bookmarks$bookmarks.fromJson(Map<String, dynamic> json) =>
      _$Query$Bookmarks$bookmarksFromJson(json);

  final List<Query$Bookmarks$bookmarks$items> items;

  final bool hasMore;

  final int total;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$Bookmarks$bookmarksToJson(this);
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
    if (!(other is Query$Bookmarks$bookmarks) ||
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

extension UtilityExtension$Query$Bookmarks$bookmarks
    on Query$Bookmarks$bookmarks {
  Query$Bookmarks$bookmarks copyWith(
          {List<Query$Bookmarks$bookmarks$items>? items,
          bool? hasMore,
          int? total,
          String? $__typename}) =>
      Query$Bookmarks$bookmarks(
          items: items == null ? this.items : items,
          hasMore: hasMore == null ? this.hasMore : hasMore,
          total: total == null ? this.total : total,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$Bookmarks$bookmarks$items
    implements Fragment$PaginatedBookmarkResponse$items, Fragment$Bookmark {
  Query$Bookmarks$bookmarks$items(
      {required this.id,
      required this.product,
      required this.createdAt,
      required this.$__typename});

  @override
  factory Query$Bookmarks$bookmarks$items.fromJson(Map<String, dynamic> json) =>
      _$Query$Bookmarks$bookmarks$itemsFromJson(json);

  final String id;

  final Query$Bookmarks$bookmarks$items$product product;

  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime createdAt;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$Bookmarks$bookmarks$itemsToJson(this);
  int get hashCode {
    final l$id = id;
    final l$product = product;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$product, l$createdAt, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Bookmarks$bookmarks$items) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$product = product;
    final lOther$product = other.product;
    if (l$product != lOther$product) return false;
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$Bookmarks$bookmarks$items
    on Query$Bookmarks$bookmarks$items {
  Query$Bookmarks$bookmarks$items copyWith(
          {String? id,
          Query$Bookmarks$bookmarks$items$product? product,
          DateTime? createdAt,
          String? $__typename}) =>
      Query$Bookmarks$bookmarks$items(
          id: id == null ? this.id : id,
          product: product == null ? this.product : product,
          createdAt: createdAt == null ? this.createdAt : createdAt,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$Bookmarks$bookmarks$items$product
    implements
        Fragment$PaginatedBookmarkResponse$items$product,
        Fragment$Bookmark$product,
        Fragment$Product {
  Query$Bookmarks$bookmarks$items$product(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.overview,
      required this.author,
      required this.categories,
      required this.$__typename});

  @override
  factory Query$Bookmarks$bookmarks$items$product.fromJson(
          Map<String, dynamic> json) =>
      _$Query$Bookmarks$bookmarks$items$productFromJson(json);

  final String id;

  final String name;

  final double price;

  final String image;

  final String overview;

  final Query$Bookmarks$bookmarks$items$product$author author;

  final List<Query$Bookmarks$bookmarks$items$product$categories> categories;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$Bookmarks$bookmarks$items$productToJson(this);
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
    if (!(other is Query$Bookmarks$bookmarks$items$product) ||
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

extension UtilityExtension$Query$Bookmarks$bookmarks$items$product
    on Query$Bookmarks$bookmarks$items$product {
  Query$Bookmarks$bookmarks$items$product copyWith(
          {String? id,
          String? name,
          double? price,
          String? image,
          String? overview,
          Query$Bookmarks$bookmarks$items$product$author? author,
          List<Query$Bookmarks$bookmarks$items$product$categories>? categories,
          String? $__typename}) =>
      Query$Bookmarks$bookmarks$items$product(
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
class Query$Bookmarks$bookmarks$items$product$author
    implements
        Fragment$PaginatedBookmarkResponse$items$product$author,
        Fragment$Bookmark$product$author,
        Fragment$Product$author,
        Fragment$Author {
  Query$Bookmarks$bookmarks$items$product$author(
      {required this.id,
      required this.name,
      required this.image,
      required this.overview,
      required this.$__typename});

  @override
  factory Query$Bookmarks$bookmarks$items$product$author.fromJson(
          Map<String, dynamic> json) =>
      _$Query$Bookmarks$bookmarks$items$product$authorFromJson(json);

  final String id;

  final String name;

  final String image;

  final String overview;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$Bookmarks$bookmarks$items$product$authorToJson(this);
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
    if (!(other is Query$Bookmarks$bookmarks$items$product$author) ||
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

extension UtilityExtension$Query$Bookmarks$bookmarks$items$product$author
    on Query$Bookmarks$bookmarks$items$product$author {
  Query$Bookmarks$bookmarks$items$product$author copyWith(
          {String? id,
          String? name,
          String? image,
          String? overview,
          String? $__typename}) =>
      Query$Bookmarks$bookmarks$items$product$author(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          image: image == null ? this.image : image,
          overview: overview == null ? this.overview : overview,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$Bookmarks$bookmarks$items$product$categories
    implements
        Fragment$PaginatedBookmarkResponse$items$product$categories,
        Fragment$Bookmark$product$categories,
        Fragment$Product$categories,
        Fragment$Category {
  Query$Bookmarks$bookmarks$items$product$categories(
      {required this.id, required this.name, required this.$__typename});

  @override
  factory Query$Bookmarks$bookmarks$items$product$categories.fromJson(
          Map<String, dynamic> json) =>
      _$Query$Bookmarks$bookmarks$items$product$categoriesFromJson(json);

  final String id;

  final String name;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$Bookmarks$bookmarks$items$product$categoriesToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Bookmarks$bookmarks$items$product$categories) ||
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

extension UtilityExtension$Query$Bookmarks$bookmarks$items$product$categories
    on Query$Bookmarks$bookmarks$items$product$categories {
  Query$Bookmarks$bookmarks$items$product$categories copyWith(
          {String? id, String? name, String? $__typename}) =>
      Query$Bookmarks$bookmarks$items$product$categories(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
