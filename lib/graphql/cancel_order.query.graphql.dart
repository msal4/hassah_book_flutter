import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:json_annotation/json_annotation.dart';
part 'cancel_order.query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Variables$Mutation$CancelOrder {
  Variables$Mutation$CancelOrder({required this.id});

  @override
  factory Variables$Mutation$CancelOrder.fromJson(Map<String, dynamic> json) =>
      _$Variables$Mutation$CancelOrderFromJson(json);

  final String id;

  Map<String, dynamic> toJson() => _$Variables$Mutation$CancelOrderToJson(this);
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Variables$Mutation$CancelOrder) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Mutation$CancelOrder {
  Mutation$CancelOrder({required this.cancelOrder, required this.$__typename});

  @override
  factory Mutation$CancelOrder.fromJson(Map<String, dynamic> json) =>
      _$Mutation$CancelOrderFromJson(json);

  final bool cancelOrder;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Mutation$CancelOrderToJson(this);
  int get hashCode {
    final l$cancelOrder = cancelOrder;
    final l$$__typename = $__typename;
    return Object.hashAll([l$cancelOrder, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Mutation$CancelOrder) || runtimeType != other.runtimeType)
      return false;
    final l$cancelOrder = cancelOrder;
    final lOther$cancelOrder = other.cancelOrder;
    if (l$cancelOrder != lOther$cancelOrder) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Mutation$CancelOrder on Mutation$CancelOrder {
  Mutation$CancelOrder copyWith({bool? cancelOrder, String? $__typename}) =>
      Mutation$CancelOrder(
          cancelOrder: cancelOrder == null ? this.cancelOrder : cancelOrder,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const queryDocumentCancelOrder = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CancelOrder'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'id')),
            type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'cancelOrder'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'orderId'),
                  value: VariableNode(name: NameNode(value: 'id')))
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
Mutation$CancelOrder _parserFn$Mutation$CancelOrder(
        Map<String, dynamic> data) =>
    Mutation$CancelOrder.fromJson(data);
typedef OnMutationCompleted$Mutation$CancelOrder = FutureOr<void> Function(
    dynamic, Mutation$CancelOrder?);

class Options$Mutation$CancelOrder
    extends graphql.MutationOptions<Mutation$CancelOrder> {
  Options$Mutation$CancelOrder(
      {String? operationName,
      required Variables$Mutation$CancelOrder variables,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      OnMutationCompleted$Mutation$CancelOrder? onCompleted,
      graphql.OnMutationUpdate<Mutation$CancelOrder>? update,
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
                    data == null ? null : _parserFn$Mutation$CancelOrder(data)),
            update: update,
            onError: onError,
            document: queryDocumentCancelOrder,
            parserFn: _parserFn$Mutation$CancelOrder);

  final OnMutationCompleted$Mutation$CancelOrder? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed
      ];
}

class WatchOptions$Mutation$CancelOrder
    extends graphql.WatchQueryOptions<Mutation$CancelOrder> {
  WatchOptions$Mutation$CancelOrder(
      {String? operationName,
      required Variables$Mutation$CancelOrder variables,
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
            document: queryDocumentCancelOrder,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Mutation$CancelOrder);
}

extension ClientExtension$Mutation$CancelOrder on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CancelOrder>> mutate$CancelOrder(
          Options$Mutation$CancelOrder options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$CancelOrder> watchMutation$CancelOrder(
          WatchOptions$Mutation$CancelOrder options) =>
      this.watchMutation(options);
}

class Mutation$CancelOrder$HookResult {
  Mutation$CancelOrder$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$CancelOrder runMutation;

  final graphql.QueryResult<Mutation$CancelOrder> result;
}

Mutation$CancelOrder$HookResult useMutation$CancelOrder(
    [WidgetOptions$Mutation$CancelOrder? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$CancelOrder());
  return Mutation$CancelOrder$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CancelOrder> useWatchMutation$CancelOrder(
        WatchOptions$Mutation$CancelOrder options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CancelOrder
    extends graphql.MutationOptions<Mutation$CancelOrder> {
  WidgetOptions$Mutation$CancelOrder(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      OnMutationCompleted$Mutation$CancelOrder? onCompleted,
      graphql.OnMutationUpdate<Mutation$CancelOrder>? update,
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
                    data == null ? null : _parserFn$Mutation$CancelOrder(data)),
            update: update,
            onError: onError,
            document: queryDocumentCancelOrder,
            parserFn: _parserFn$Mutation$CancelOrder);

  final OnMutationCompleted$Mutation$CancelOrder? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed
      ];
}

typedef RunMutation$Mutation$CancelOrder
    = graphql.MultiSourceResult<Mutation$CancelOrder>
        Function(Variables$Mutation$CancelOrder, {Object? optimisticResult});
typedef Builder$Mutation$CancelOrder = widgets.Widget Function(
    RunMutation$Mutation$CancelOrder,
    graphql.QueryResult<Mutation$CancelOrder>?);

class Mutation$CancelOrder$Widget
    extends graphql_flutter.Mutation<Mutation$CancelOrder> {
  Mutation$CancelOrder$Widget(
      {widgets.Key? key,
      WidgetOptions$Mutation$CancelOrder? options,
      required Builder$Mutation$CancelOrder builder})
      : super(
            key: key,
            options: options ?? WidgetOptions$Mutation$CancelOrder(),
            builder: (run, result) => builder(
                (variables, {optimisticResult}) =>
                    run(variables.toJson(), optimisticResult: optimisticResult),
                result));
}
