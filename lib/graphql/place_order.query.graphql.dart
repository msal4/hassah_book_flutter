import '../schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:json_annotation/json_annotation.dart';
part 'place_order.query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Variables$Mutation$PlaceOrder {
  Variables$Mutation$PlaceOrder({required this.data});

  @override
  factory Variables$Mutation$PlaceOrder.fromJson(Map<String, dynamic> json) =>
      _$Variables$Mutation$PlaceOrderFromJson(json);

  final Input$PlaceOrderInput data;

  Map<String, dynamic> toJson() => _$Variables$Mutation$PlaceOrderToJson(this);
  int get hashCode {
    final l$data = data;
    return Object.hashAll([l$data]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Variables$Mutation$PlaceOrder) ||
        runtimeType != other.runtimeType) return false;
    final l$data = data;
    final lOther$data = other.data;
    if (l$data != lOther$data) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Mutation$PlaceOrder {
  Mutation$PlaceOrder({required this.placeOrder, required this.$__typename});

  @override
  factory Mutation$PlaceOrder.fromJson(Map<String, dynamic> json) =>
      _$Mutation$PlaceOrderFromJson(json);

  final Mutation$PlaceOrder$placeOrder placeOrder;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Mutation$PlaceOrderToJson(this);
  int get hashCode {
    final l$placeOrder = placeOrder;
    final l$$__typename = $__typename;
    return Object.hashAll([l$placeOrder, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Mutation$PlaceOrder) || runtimeType != other.runtimeType)
      return false;
    final l$placeOrder = placeOrder;
    final lOther$placeOrder = other.placeOrder;
    if (l$placeOrder != lOther$placeOrder) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Mutation$PlaceOrder on Mutation$PlaceOrder {
  Mutation$PlaceOrder copyWith(
          {Mutation$PlaceOrder$placeOrder? placeOrder, String? $__typename}) =>
      Mutation$PlaceOrder(
          placeOrder: placeOrder == null ? this.placeOrder : placeOrder,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const queryDocumentPlaceOrder = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'PlaceOrder'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'data')),
            type: NamedTypeNode(
                name: NameNode(value: 'PlaceOrderInput'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'placeOrder'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'data'),
                  value: VariableNode(name: NameNode(value: 'data')))
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
Mutation$PlaceOrder _parserFn$Mutation$PlaceOrder(Map<String, dynamic> data) =>
    Mutation$PlaceOrder.fromJson(data);
typedef OnMutationCompleted$Mutation$PlaceOrder = FutureOr<void> Function(
    dynamic, Mutation$PlaceOrder?);

class Options$Mutation$PlaceOrder
    extends graphql.MutationOptions<Mutation$PlaceOrder> {
  Options$Mutation$PlaceOrder(
      {String? operationName,
      required Variables$Mutation$PlaceOrder variables,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      OnMutationCompleted$Mutation$PlaceOrder? onCompleted,
      graphql.OnMutationUpdate<Mutation$PlaceOrder>? update,
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
                    data == null ? null : _parserFn$Mutation$PlaceOrder(data)),
            update: update,
            onError: onError,
            document: queryDocumentPlaceOrder,
            parserFn: _parserFn$Mutation$PlaceOrder);

  final OnMutationCompleted$Mutation$PlaceOrder? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed
      ];
}

class WatchOptions$Mutation$PlaceOrder
    extends graphql.WatchQueryOptions<Mutation$PlaceOrder> {
  WatchOptions$Mutation$PlaceOrder(
      {String? operationName,
      required Variables$Mutation$PlaceOrder variables,
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
            document: queryDocumentPlaceOrder,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Mutation$PlaceOrder);
}

extension ClientExtension$Mutation$PlaceOrder on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$PlaceOrder>> mutate$PlaceOrder(
          Options$Mutation$PlaceOrder options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$PlaceOrder> watchMutation$PlaceOrder(
          WatchOptions$Mutation$PlaceOrder options) =>
      this.watchMutation(options);
}

class Mutation$PlaceOrder$HookResult {
  Mutation$PlaceOrder$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$PlaceOrder runMutation;

  final graphql.QueryResult<Mutation$PlaceOrder> result;
}

Mutation$PlaceOrder$HookResult useMutation$PlaceOrder(
    [WidgetOptions$Mutation$PlaceOrder? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$PlaceOrder());
  return Mutation$PlaceOrder$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$PlaceOrder> useWatchMutation$PlaceOrder(
        WatchOptions$Mutation$PlaceOrder options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$PlaceOrder
    extends graphql.MutationOptions<Mutation$PlaceOrder> {
  WidgetOptions$Mutation$PlaceOrder(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      OnMutationCompleted$Mutation$PlaceOrder? onCompleted,
      graphql.OnMutationUpdate<Mutation$PlaceOrder>? update,
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
                    data == null ? null : _parserFn$Mutation$PlaceOrder(data)),
            update: update,
            onError: onError,
            document: queryDocumentPlaceOrder,
            parserFn: _parserFn$Mutation$PlaceOrder);

  final OnMutationCompleted$Mutation$PlaceOrder? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed
      ];
}

typedef RunMutation$Mutation$PlaceOrder
    = graphql.MultiSourceResult<Mutation$PlaceOrder>
        Function(Variables$Mutation$PlaceOrder, {Object? optimisticResult});
typedef Builder$Mutation$PlaceOrder = widgets.Widget Function(
    RunMutation$Mutation$PlaceOrder, graphql.QueryResult<Mutation$PlaceOrder>?);

class Mutation$PlaceOrder$Widget
    extends graphql_flutter.Mutation<Mutation$PlaceOrder> {
  Mutation$PlaceOrder$Widget(
      {widgets.Key? key,
      WidgetOptions$Mutation$PlaceOrder? options,
      required Builder$Mutation$PlaceOrder builder})
      : super(
            key: key,
            options: options ?? WidgetOptions$Mutation$PlaceOrder(),
            builder: (run, result) => builder(
                (variables, {optimisticResult}) =>
                    run(variables.toJson(), optimisticResult: optimisticResult),
                result));
}

@JsonSerializable(explicitToJson: true)
class Mutation$PlaceOrder$placeOrder {
  Mutation$PlaceOrder$placeOrder({required this.id, required this.$__typename});

  @override
  factory Mutation$PlaceOrder$placeOrder.fromJson(Map<String, dynamic> json) =>
      _$Mutation$PlaceOrder$placeOrderFromJson(json);

  final String id;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Mutation$PlaceOrder$placeOrderToJson(this);
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Mutation$PlaceOrder$placeOrder) ||
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

extension UtilityExtension$Mutation$PlaceOrder$placeOrder
    on Mutation$PlaceOrder$placeOrder {
  Mutation$PlaceOrder$placeOrder copyWith({String? id, String? $__typename}) =>
      Mutation$PlaceOrder$placeOrder(
          id: id == null ? this.id : id,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
