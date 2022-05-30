import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:json_annotation/json_annotation.dart';
part 'remove_bookmark.query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Variables$Mutation$RemoveBookmark {
  Variables$Mutation$RemoveBookmark({required this.productId});

  @override
  factory Variables$Mutation$RemoveBookmark.fromJson(
          Map<String, dynamic> json) =>
      _$Variables$Mutation$RemoveBookmarkFromJson(json);

  final String productId;

  Map<String, dynamic> toJson() =>
      _$Variables$Mutation$RemoveBookmarkToJson(this);
  int get hashCode {
    final l$productId = productId;
    return Object.hashAll([l$productId]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Variables$Mutation$RemoveBookmark) ||
        runtimeType != other.runtimeType) return false;
    final l$productId = productId;
    final lOther$productId = other.productId;
    if (l$productId != lOther$productId) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Mutation$RemoveBookmark {
  Mutation$RemoveBookmark(
      {required this.removeBookmark, required this.$__typename});

  @override
  factory Mutation$RemoveBookmark.fromJson(Map<String, dynamic> json) =>
      _$Mutation$RemoveBookmarkFromJson(json);

  final bool removeBookmark;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Mutation$RemoveBookmarkToJson(this);
  int get hashCode {
    final l$removeBookmark = removeBookmark;
    final l$$__typename = $__typename;
    return Object.hashAll([l$removeBookmark, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Mutation$RemoveBookmark) || runtimeType != other.runtimeType)
      return false;
    final l$removeBookmark = removeBookmark;
    final lOther$removeBookmark = other.removeBookmark;
    if (l$removeBookmark != lOther$removeBookmark) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Mutation$RemoveBookmark on Mutation$RemoveBookmark {
  Mutation$RemoveBookmark copyWith(
          {bool? removeBookmark, String? $__typename}) =>
      Mutation$RemoveBookmark(
          removeBookmark:
              removeBookmark == null ? this.removeBookmark : removeBookmark,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const queryDocumentRemoveBookmark = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'RemoveBookmark'),
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
            name: NameNode(value: 'removeFavorite'),
            alias: NameNode(value: 'removeBookmark'),
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
Mutation$RemoveBookmark _parserFn$Mutation$RemoveBookmark(
        Map<String, dynamic> data) =>
    Mutation$RemoveBookmark.fromJson(data);
typedef OnMutationCompleted$Mutation$RemoveBookmark = FutureOr<void> Function(
    dynamic, Mutation$RemoveBookmark?);

class Options$Mutation$RemoveBookmark
    extends graphql.MutationOptions<Mutation$RemoveBookmark> {
  Options$Mutation$RemoveBookmark(
      {String? operationName,
      required Variables$Mutation$RemoveBookmark variables,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      OnMutationCompleted$Mutation$RemoveBookmark? onCompleted,
      graphql.OnMutationUpdate<Mutation$RemoveBookmark>? update,
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
                : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$RemoveBookmark(data)),
            update: update,
            onError: onError,
            document: queryDocumentRemoveBookmark,
            parserFn: _parserFn$Mutation$RemoveBookmark);

  final OnMutationCompleted$Mutation$RemoveBookmark? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed
      ];
}

class WatchOptions$Mutation$RemoveBookmark
    extends graphql.WatchQueryOptions<Mutation$RemoveBookmark> {
  WatchOptions$Mutation$RemoveBookmark(
      {String? operationName,
      required Variables$Mutation$RemoveBookmark variables,
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
            document: queryDocumentRemoveBookmark,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Mutation$RemoveBookmark);
}

extension ClientExtension$Mutation$RemoveBookmark on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$RemoveBookmark>> mutate$RemoveBookmark(
          Options$Mutation$RemoveBookmark options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$RemoveBookmark> watchMutation$RemoveBookmark(
          WatchOptions$Mutation$RemoveBookmark options) =>
      this.watchMutation(options);
}

class Mutation$RemoveBookmark$HookResult {
  Mutation$RemoveBookmark$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$RemoveBookmark runMutation;

  final graphql.QueryResult<Mutation$RemoveBookmark> result;
}

Mutation$RemoveBookmark$HookResult useMutation$RemoveBookmark(
    [WidgetOptions$Mutation$RemoveBookmark? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$RemoveBookmark());
  return Mutation$RemoveBookmark$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$RemoveBookmark>
    useWatchMutation$RemoveBookmark(
            WatchOptions$Mutation$RemoveBookmark options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$RemoveBookmark
    extends graphql.MutationOptions<Mutation$RemoveBookmark> {
  WidgetOptions$Mutation$RemoveBookmark(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      OnMutationCompleted$Mutation$RemoveBookmark? onCompleted,
      graphql.OnMutationUpdate<Mutation$RemoveBookmark>? update,
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
                : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$RemoveBookmark(data)),
            update: update,
            onError: onError,
            document: queryDocumentRemoveBookmark,
            parserFn: _parserFn$Mutation$RemoveBookmark);

  final OnMutationCompleted$Mutation$RemoveBookmark? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed
      ];
}

typedef RunMutation$Mutation$RemoveBookmark
    = graphql.MultiSourceResult<Mutation$RemoveBookmark>
        Function(Variables$Mutation$RemoveBookmark, {Object? optimisticResult});
typedef Builder$Mutation$RemoveBookmark = widgets.Widget Function(
    RunMutation$Mutation$RemoveBookmark,
    graphql.QueryResult<Mutation$RemoveBookmark>?);

class Mutation$RemoveBookmark$Widget
    extends graphql_flutter.Mutation<Mutation$RemoveBookmark> {
  Mutation$RemoveBookmark$Widget(
      {widgets.Key? key,
      WidgetOptions$Mutation$RemoveBookmark? options,
      required Builder$Mutation$RemoveBookmark builder})
      : super(
            key: key,
            options: options ?? WidgetOptions$Mutation$RemoveBookmark(),
            builder: (run, result) => builder(
                (variables, {optimisticResult}) =>
                    run(variables.toJson(), optimisticResult: optimisticResult),
                result));
}
