import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:json_annotation/json_annotation.dart';
part 'create_request.query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Variables$Mutation$CreateRequest {
  Variables$Mutation$CreateRequest({required this.content});

  @override
  factory Variables$Mutation$CreateRequest.fromJson(
          Map<String, dynamic> json) =>
      _$Variables$Mutation$CreateRequestFromJson(json);

  final String content;

  Map<String, dynamic> toJson() =>
      _$Variables$Mutation$CreateRequestToJson(this);
  int get hashCode {
    final l$content = content;
    return Object.hashAll([l$content]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Variables$Mutation$CreateRequest) ||
        runtimeType != other.runtimeType) return false;
    final l$content = content;
    final lOther$content = other.content;
    if (l$content != lOther$content) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Mutation$CreateRequest {
  Mutation$CreateRequest(
      {required this.createRequest, required this.$__typename});

  @override
  factory Mutation$CreateRequest.fromJson(Map<String, dynamic> json) =>
      _$Mutation$CreateRequestFromJson(json);

  final Mutation$CreateRequest$createRequest createRequest;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Mutation$CreateRequestToJson(this);
  int get hashCode {
    final l$createRequest = createRequest;
    final l$$__typename = $__typename;
    return Object.hashAll([l$createRequest, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Mutation$CreateRequest) || runtimeType != other.runtimeType)
      return false;
    final l$createRequest = createRequest;
    final lOther$createRequest = other.createRequest;
    if (l$createRequest != lOther$createRequest) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Mutation$CreateRequest on Mutation$CreateRequest {
  Mutation$CreateRequest copyWith(
          {Mutation$CreateRequest$createRequest? createRequest,
          String? $__typename}) =>
      Mutation$CreateRequest(
          createRequest:
              createRequest == null ? this.createRequest : createRequest,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const queryDocumentCreateRequest = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreateRequest'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'content')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'createRequest'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'data'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'content'),
                        value: VariableNode(name: NameNode(value: 'content')))
                  ]))
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
]);
Mutation$CreateRequest _parserFn$Mutation$CreateRequest(
        Map<String, dynamic> data) =>
    Mutation$CreateRequest.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateRequest = FutureOr<void> Function(
    dynamic, Mutation$CreateRequest?);

class Options$Mutation$CreateRequest
    extends graphql.MutationOptions<Mutation$CreateRequest> {
  Options$Mutation$CreateRequest(
      {String? operationName,
      required Variables$Mutation$CreateRequest variables,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      OnMutationCompleted$Mutation$CreateRequest? onCompleted,
      graphql.OnMutationUpdate<Mutation$CreateRequest>? update,
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
                        : _parserFn$Mutation$CreateRequest(data)),
            update: update,
            onError: onError,
            document: queryDocumentCreateRequest,
            parserFn: _parserFn$Mutation$CreateRequest);

  final OnMutationCompleted$Mutation$CreateRequest? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed
      ];
}

class WatchOptions$Mutation$CreateRequest
    extends graphql.WatchQueryOptions<Mutation$CreateRequest> {
  WatchOptions$Mutation$CreateRequest(
      {String? operationName,
      required Variables$Mutation$CreateRequest variables,
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
            document: queryDocumentCreateRequest,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Mutation$CreateRequest);
}

extension ClientExtension$Mutation$CreateRequest on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateRequest>> mutate$CreateRequest(
          Options$Mutation$CreateRequest options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$CreateRequest> watchMutation$CreateRequest(
          WatchOptions$Mutation$CreateRequest options) =>
      this.watchMutation(options);
}

class Mutation$CreateRequest$HookResult {
  Mutation$CreateRequest$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$CreateRequest runMutation;

  final graphql.QueryResult<Mutation$CreateRequest> result;
}

Mutation$CreateRequest$HookResult useMutation$CreateRequest(
    [WidgetOptions$Mutation$CreateRequest? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$CreateRequest());
  return Mutation$CreateRequest$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateRequest> useWatchMutation$CreateRequest(
        WatchOptions$Mutation$CreateRequest options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateRequest
    extends graphql.MutationOptions<Mutation$CreateRequest> {
  WidgetOptions$Mutation$CreateRequest(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      OnMutationCompleted$Mutation$CreateRequest? onCompleted,
      graphql.OnMutationUpdate<Mutation$CreateRequest>? update,
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
                        : _parserFn$Mutation$CreateRequest(data)),
            update: update,
            onError: onError,
            document: queryDocumentCreateRequest,
            parserFn: _parserFn$Mutation$CreateRequest);

  final OnMutationCompleted$Mutation$CreateRequest? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed
      ];
}

typedef RunMutation$Mutation$CreateRequest
    = graphql.MultiSourceResult<Mutation$CreateRequest>
        Function(Variables$Mutation$CreateRequest, {Object? optimisticResult});
typedef Builder$Mutation$CreateRequest = widgets.Widget Function(
    RunMutation$Mutation$CreateRequest,
    graphql.QueryResult<Mutation$CreateRequest>?);

class Mutation$CreateRequest$Widget
    extends graphql_flutter.Mutation<Mutation$CreateRequest> {
  Mutation$CreateRequest$Widget(
      {widgets.Key? key,
      WidgetOptions$Mutation$CreateRequest? options,
      required Builder$Mutation$CreateRequest builder})
      : super(
            key: key,
            options: options ?? WidgetOptions$Mutation$CreateRequest(),
            builder: (run, result) => builder(
                (variables, {optimisticResult}) =>
                    run(variables.toJson(), optimisticResult: optimisticResult),
                result));
}

@JsonSerializable(explicitToJson: true)
class Mutation$CreateRequest$createRequest {
  Mutation$CreateRequest$createRequest(
      {required this.id, required this.$__typename});

  @override
  factory Mutation$CreateRequest$createRequest.fromJson(
          Map<String, dynamic> json) =>
      _$Mutation$CreateRequest$createRequestFromJson(json);

  final String id;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Mutation$CreateRequest$createRequestToJson(this);
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Mutation$CreateRequest$createRequest) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Mutation$CreateRequest$createRequest
    on Mutation$CreateRequest$createRequest {
  Mutation$CreateRequest$createRequest copyWith(
          {String? id, String? $__typename}) =>
      Mutation$CreateRequest$createRequest(
          id: id == null ? this.id : id,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
