import 'category.fragment.graphql.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:json_annotation/json_annotation.dart';
part 'categories.query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Variables$Query$Categories {
  Variables$Query$Categories({this.skip, this.take});

  @override
  factory Variables$Query$Categories.fromJson(Map<String, dynamic> json) =>
      _$Variables$Query$CategoriesFromJson(json);

  final int? skip;

  final int? take;

  Map<String, dynamic> toJson() => _$Variables$Query$CategoriesToJson(this);
  int get hashCode {
    final l$skip = skip;
    final l$take = take;
    return Object.hashAll([l$skip, l$take]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Variables$Query$Categories) ||
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
class Query$Categories {
  Query$Categories({required this.categories, required this.$__typename});

  @override
  factory Query$Categories.fromJson(Map<String, dynamic> json) =>
      _$Query$CategoriesFromJson(json);

  final Query$Categories$categories categories;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$CategoriesToJson(this);
  int get hashCode {
    final l$categories = categories;
    final l$$__typename = $__typename;
    return Object.hashAll([l$categories, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Categories) || runtimeType != other.runtimeType)
      return false;
    final l$categories = categories;
    final lOther$categories = other.categories;
    if (l$categories != lOther$categories) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$Categories on Query$Categories {
  Query$Categories copyWith(
          {Query$Categories$categories? categories, String? $__typename}) =>
      Query$Categories(
          categories: categories == null ? this.categories : categories,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const queryDocumentCategories = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Categories'),
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
            name: NameNode(value: 'categories'),
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
                  name: NameNode(value: 'PaginatedCategoryResponse'),
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
  fragmentDefinitionPaginatedCategoryResponse,
  fragmentDefinitionCategory,
]);
Query$Categories _parserFn$Query$Categories(Map<String, dynamic> data) =>
    Query$Categories.fromJson(data);

class Options$Query$Categories extends graphql.QueryOptions<Query$Categories> {
  Options$Query$Categories(
      {String? operationName,
      Variables$Query$Categories? variables,
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
            document: queryDocumentCategories,
            parserFn: _parserFn$Query$Categories);
}

class WatchOptions$Query$Categories
    extends graphql.WatchQueryOptions<Query$Categories> {
  WatchOptions$Query$Categories(
      {String? operationName,
      Variables$Query$Categories? variables,
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
            document: queryDocumentCategories,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Query$Categories);
}

class FetchMoreOptions$Query$Categories extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Categories(
      {required graphql.UpdateQuery updateQuery,
      Variables$Query$Categories? variables})
      : super(
            updateQuery: updateQuery,
            variables: variables?.toJson() ?? {},
            document: queryDocumentCategories);
}

extension ClientExtension$Query$Categories on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Categories>> query$Categories(
          [Options$Query$Categories? options]) async =>
      await this.query(options ?? Options$Query$Categories());
  graphql.ObservableQuery<Query$Categories> watchQuery$Categories(
          [WatchOptions$Query$Categories? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$Categories());
  void writeQuery$Categories(
          {required Query$Categories data,
          Variables$Query$Categories? variables,
          bool broadcast = true}) =>
      this.writeQuery(
          graphql.Request(
              operation: graphql.Operation(document: queryDocumentCategories),
              variables: variables?.toJson() ?? const {}),
          data: data.toJson(),
          broadcast: broadcast);
  Query$Categories? readQuery$Categories(
      {Variables$Query$Categories? variables, bool optimistic = true}) {
    final result = this.readQuery(
        graphql.Request(
            operation: graphql.Operation(document: queryDocumentCategories),
            variables: variables?.toJson() ?? const {}),
        optimistic: optimistic);
    return result == null ? null : Query$Categories.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$Categories> useQuery$Categories(
        [Options$Query$Categories? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$Categories());
graphql.ObservableQuery<Query$Categories> useWatchQuery$Categories(
        [WatchOptions$Query$Categories? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$Categories());

class Query$Categories$Widget extends graphql_flutter.Query<Query$Categories> {
  Query$Categories$Widget(
      {widgets.Key? key,
      Options$Query$Categories? options,
      required graphql_flutter.QueryBuilder<Query$Categories> builder})
      : super(
            key: key,
            options: options ?? Options$Query$Categories(),
            builder: builder);
}

@JsonSerializable(explicitToJson: true)
class Query$Categories$categories
    implements Fragment$PaginatedCategoryResponse {
  Query$Categories$categories(
      {required this.items,
      required this.hasMore,
      required this.total,
      required this.$__typename});

  @override
  factory Query$Categories$categories.fromJson(Map<String, dynamic> json) =>
      _$Query$Categories$categoriesFromJson(json);

  final List<Query$Categories$categories$items> items;

  final bool hasMore;

  final int total;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$Categories$categoriesToJson(this);
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
    if (!(other is Query$Categories$categories) ||
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

extension UtilityExtension$Query$Categories$categories
    on Query$Categories$categories {
  Query$Categories$categories copyWith(
          {List<Query$Categories$categories$items>? items,
          bool? hasMore,
          int? total,
          String? $__typename}) =>
      Query$Categories$categories(
          items: items == null ? this.items : items,
          hasMore: hasMore == null ? this.hasMore : hasMore,
          total: total == null ? this.total : total,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$Categories$categories$items
    implements Fragment$PaginatedCategoryResponse$items, Fragment$Category {
  Query$Categories$categories$items(
      {required this.id, required this.name, required this.$__typename});

  @override
  factory Query$Categories$categories$items.fromJson(
          Map<String, dynamic> json) =>
      _$Query$Categories$categories$itemsFromJson(json);

  final String id;

  final String name;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$Categories$categories$itemsToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Categories$categories$items) ||
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

extension UtilityExtension$Query$Categories$categories$items
    on Query$Categories$categories$items {
  Query$Categories$categories$items copyWith(
          {String? id, String? name, String? $__typename}) =>
      Query$Categories$categories$items(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
