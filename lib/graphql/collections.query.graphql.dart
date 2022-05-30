import 'collection.fragment.graphql.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:json_annotation/json_annotation.dart';
part 'collections.query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Variables$Query$Collections {
  Variables$Query$Collections({this.skip, this.take});

  @override
  factory Variables$Query$Collections.fromJson(Map<String, dynamic> json) =>
      _$Variables$Query$CollectionsFromJson(json);

  final int? skip;

  final int? take;

  Map<String, dynamic> toJson() => _$Variables$Query$CollectionsToJson(this);
  int get hashCode {
    final l$skip = skip;
    final l$take = take;
    return Object.hashAll([l$skip, l$take]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Variables$Query$Collections) ||
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
class Query$Collections {
  Query$Collections({required this.collections, required this.$__typename});

  @override
  factory Query$Collections.fromJson(Map<String, dynamic> json) =>
      _$Query$CollectionsFromJson(json);

  final Query$Collections$collections collections;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$CollectionsToJson(this);
  int get hashCode {
    final l$collections = collections;
    final l$$__typename = $__typename;
    return Object.hashAll([l$collections, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Collections) || runtimeType != other.runtimeType)
      return false;
    final l$collections = collections;
    final lOther$collections = other.collections;
    if (l$collections != lOther$collections) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$Collections on Query$Collections {
  Query$Collections copyWith(
          {Query$Collections$collections? collections, String? $__typename}) =>
      Query$Collections(
          collections: collections == null ? this.collections : collections,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const queryDocumentCollections = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Collections'),
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
            name: NameNode(value: 'collections'),
            alias: null,
            arguments: [
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
                  name: NameNode(value: 'PaginatedCollectionResponse'),
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
  fragmentDefinitionPaginatedCollectionResponse,
  fragmentDefinitionCollection,
]);
Query$Collections _parserFn$Query$Collections(Map<String, dynamic> data) =>
    Query$Collections.fromJson(data);

class Options$Query$Collections
    extends graphql.QueryOptions<Query$Collections> {
  Options$Query$Collections(
      {String? operationName,
      Variables$Query$Collections? variables,
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
            document: queryDocumentCollections,
            parserFn: _parserFn$Query$Collections);
}

class WatchOptions$Query$Collections
    extends graphql.WatchQueryOptions<Query$Collections> {
  WatchOptions$Query$Collections(
      {String? operationName,
      Variables$Query$Collections? variables,
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
            document: queryDocumentCollections,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Query$Collections);
}

class FetchMoreOptions$Query$Collections extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Collections(
      {required graphql.UpdateQuery updateQuery,
      Variables$Query$Collections? variables})
      : super(
            updateQuery: updateQuery,
            variables: variables?.toJson() ?? {},
            document: queryDocumentCollections);
}

extension ClientExtension$Query$Collections on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Collections>> query$Collections(
          [Options$Query$Collections? options]) async =>
      await this.query(options ?? Options$Query$Collections());
  graphql.ObservableQuery<Query$Collections> watchQuery$Collections(
          [WatchOptions$Query$Collections? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$Collections());
  void writeQuery$Collections(
          {required Query$Collections data,
          Variables$Query$Collections? variables,
          bool broadcast = true}) =>
      this.writeQuery(
          graphql.Request(
              operation: graphql.Operation(document: queryDocumentCollections),
              variables: variables?.toJson() ?? const {}),
          data: data.toJson(),
          broadcast: broadcast);
  Query$Collections? readQuery$Collections(
      {Variables$Query$Collections? variables, bool optimistic = true}) {
    final result = this.readQuery(
        graphql.Request(
            operation: graphql.Operation(document: queryDocumentCollections),
            variables: variables?.toJson() ?? const {}),
        optimistic: optimistic);
    return result == null ? null : Query$Collections.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$Collections> useQuery$Collections(
        [Options$Query$Collections? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$Collections());
graphql.ObservableQuery<Query$Collections> useWatchQuery$Collections(
        [WatchOptions$Query$Collections? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$Collections());

class Query$Collections$Widget
    extends graphql_flutter.Query<Query$Collections> {
  Query$Collections$Widget(
      {widgets.Key? key,
      Options$Query$Collections? options,
      required graphql_flutter.QueryBuilder<Query$Collections> builder})
      : super(
            key: key,
            options: options ?? Options$Query$Collections(),
            builder: builder);
}

@JsonSerializable(explicitToJson: true)
class Query$Collections$collections
    implements Fragment$PaginatedCollectionResponse {
  Query$Collections$collections(
      {required this.items,
      required this.hasMore,
      required this.total,
      required this.$__typename});

  @override
  factory Query$Collections$collections.fromJson(Map<String, dynamic> json) =>
      _$Query$Collections$collectionsFromJson(json);

  final List<Query$Collections$collections$items> items;

  final bool hasMore;

  final int total;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$Collections$collectionsToJson(this);
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
    if (!(other is Query$Collections$collections) ||
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

extension UtilityExtension$Query$Collections$collections
    on Query$Collections$collections {
  Query$Collections$collections copyWith(
          {List<Query$Collections$collections$items>? items,
          bool? hasMore,
          int? total,
          String? $__typename}) =>
      Query$Collections$collections(
          items: items == null ? this.items : items,
          hasMore: hasMore == null ? this.hasMore : hasMore,
          total: total == null ? this.total : total,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$Collections$collections$items
    implements Fragment$PaginatedCollectionResponse$items, Fragment$Collection {
  Query$Collections$collections$items(
      {required this.id,
      required this.image,
      required this.name,
      required this.$__typename});

  @override
  factory Query$Collections$collections$items.fromJson(
          Map<String, dynamic> json) =>
      _$Query$Collections$collections$itemsFromJson(json);

  final String id;

  final String image;

  final String name;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$Collections$collections$itemsToJson(this);
  int get hashCode {
    final l$id = id;
    final l$image = image;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$image, l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Collections$collections$items) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$Collections$collections$items
    on Query$Collections$collections$items {
  Query$Collections$collections$items copyWith(
          {String? id, String? image, String? name, String? $__typename}) =>
      Query$Collections$collections$items(
          id: id == null ? this.id : id,
          image: image == null ? this.image : image,
          name: name == null ? this.name : name,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
