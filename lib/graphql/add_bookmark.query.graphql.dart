import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:json_annotation/json_annotation.dart';
part 'add_bookmark.query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Variables$Mutation$AddBookmark {
  Variables$Mutation$AddBookmark({required this.productId});

  @override
  factory Variables$Mutation$AddBookmark.fromJson(Map<String, dynamic> json) =>
      _$Variables$Mutation$AddBookmarkFromJson(json);

  final String productId;

  Map<String, dynamic> toJson() => _$Variables$Mutation$AddBookmarkToJson(this);
  int get hashCode {
    final l$productId = productId;
    return Object.hashAll([l$productId]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Variables$Mutation$AddBookmark) ||
        runtimeType != other.runtimeType) return false;
    final l$productId = productId;
    final lOther$productId = other.productId;
    if (l$productId != lOther$productId) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Mutation$AddBookmark {
  Mutation$AddBookmark({required this.addBookmark, required this.$__typename});

  @override
  factory Mutation$AddBookmark.fromJson(Map<String, dynamic> json) =>
      _$Mutation$AddBookmarkFromJson(json);

  final bool addBookmark;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Mutation$AddBookmarkToJson(this);
  int get hashCode {
    final l$addBookmark = addBookmark;
    final l$$__typename = $__typename;
    return Object.hashAll([l$addBookmark, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Mutation$AddBookmark) || runtimeType != other.runtimeType)
      return false;
    final l$addBookmark = addBookmark;
    final lOther$addBookmark = other.addBookmark;
    if (l$addBookmark != lOther$addBookmark) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Mutation$AddBookmark on Mutation$AddBookmark {
  Mutation$AddBookmark copyWith({bool? addBookmark, String? $__typename}) =>
      Mutation$AddBookmark(
          addBookmark: addBookmark == null ? this.addBookmark : addBookmark,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const queryDocumentAddBookmark = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'AddBookmark'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'productId')),
            type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'addFavorite'),
            alias: NameNode(value: 'addBookmark'),
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'productId'),
                  value: VariableNode(name: NameNode(value: 'productId')))
            ],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
]);
Mutation$AddBookmark _parserFn$Mutation$AddBookmark(
        Map<String, dynamic> data) =>
    Mutation$AddBookmark.fromJson(data);
typedef OnMutationCompleted$Mutation$AddBookmark = FutureOr<void> Function(
    dynamic, Mutation$AddBookmark?);

class Options$Mutation$AddBookmark
    extends graphql.MutationOptions<Mutation$AddBookmark> {
  Options$Mutation$AddBookmark(
      {String? operationName,
      required Variables$Mutation$AddBookmark variables,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      OnMutationCompleted$Mutation$AddBookmark? onCompleted,
      graphql.OnMutationUpdate<Mutation$AddBookmark>? update,
      graphql.OnError? onError})
      : onCompletedWithParsed = onCompleted,
        super(
            variables: variables.toJson(),
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            context: context,
            onCompleted: onCompleted == null
                ? null
                : (data) => onCompleted(data,
                    data == null ? null : _parserFn$Mutation$AddBookmark(data)),
            update: update,
            onError: onError,
            document: queryDocumentAddBookmark,
            parserFn: _parserFn$Mutation$AddBookmark);

  final OnMutationCompleted$Mutation$AddBookmark? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed
      ];
}

class WatchOptions$Mutation$AddBookmark
    extends graphql.WatchQueryOptions<Mutation$AddBookmark> {
  WatchOptions$Mutation$AddBookmark(
      {String? operationName,
      required Variables$Mutation$AddBookmark variables,
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
            document: queryDocumentAddBookmark,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Mutation$AddBookmark);
}

extension ClientExtension$Mutation$AddBookmark on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$AddBookmark>> mutate$AddBookmark(
          Options$Mutation$AddBookmark options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$AddBookmark> watchMutation$AddBookmark(
          WatchOptions$Mutation$AddBookmark options) =>
      this.watchMutation(options);
}

class Mutation$AddBookmark$HookResult {
  Mutation$AddBookmark$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$AddBookmark runMutation;

  final graphql.QueryResult<Mutation$AddBookmark> result;
}

Mutation$AddBookmark$HookResult useMutation$AddBookmark(
    [WidgetOptions$Mutation$AddBookmark? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$AddBookmark());
  return Mutation$AddBookmark$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$AddBookmark> useWatchMutation$AddBookmark(
        WatchOptions$Mutation$AddBookmark options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$AddBookmark
    extends graphql.MutationOptions<Mutation$AddBookmark> {
  WidgetOptions$Mutation$AddBookmark(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      OnMutationCompleted$Mutation$AddBookmark? onCompleted,
      graphql.OnMutationUpdate<Mutation$AddBookmark>? update,
      graphql.OnError? onError})
      : onCompletedWithParsed = onCompleted,
        super(
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            context: context,
            onCompleted: onCompleted == null
                ? null
                : (data) => onCompleted(data,
                    data == null ? null : _parserFn$Mutation$AddBookmark(data)),
            update: update,
            onError: onError,
            document: queryDocumentAddBookmark,
            parserFn: _parserFn$Mutation$AddBookmark);

  final OnMutationCompleted$Mutation$AddBookmark? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed
      ];
}

typedef RunMutation$Mutation$AddBookmark
    = graphql.MultiSourceResult<Mutation$AddBookmark>
        Function(Variables$Mutation$AddBookmark, {Object? optimisticResult});
typedef Builder$Mutation$AddBookmark = widgets.Widget Function(
    RunMutation$Mutation$AddBookmark,
    graphql.QueryResult<Mutation$AddBookmark>?);

class Mutation$AddBookmark$Widget
    extends graphql_flutter.Mutation<Mutation$AddBookmark> {
  Mutation$AddBookmark$Widget(
      {widgets.Key? key,
      WidgetOptions$Mutation$AddBookmark? options,
      required Builder$Mutation$AddBookmark builder})
      : super(
            key: key,
            options: options ?? WidgetOptions$Mutation$AddBookmark(),
            builder: (run, result) => builder(
                (variables, {optimisticResult}) =>
                    run(variables.toJson(), optimisticResult: optimisticResult),
                result));
}
