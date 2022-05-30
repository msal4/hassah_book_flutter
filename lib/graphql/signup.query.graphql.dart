import '../schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:json_annotation/json_annotation.dart';
part 'signup.query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Variables$Mutation$Signup {
  Variables$Mutation$Signup({required this.data});

  @override
  factory Variables$Mutation$Signup.fromJson(Map<String, dynamic> json) =>
      _$Variables$Mutation$SignupFromJson(json);

  final Input$RegisterInput data;

  Map<String, dynamic> toJson() => _$Variables$Mutation$SignupToJson(this);
  int get hashCode {
    final l$data = data;
    return Object.hashAll([l$data]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Variables$Mutation$Signup) ||
        runtimeType != other.runtimeType) return false;
    final l$data = data;
    final lOther$data = other.data;
    if (l$data != lOther$data) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Mutation$Signup {
  Mutation$Signup({required this.register, required this.$__typename});

  @override
  factory Mutation$Signup.fromJson(Map<String, dynamic> json) =>
      _$Mutation$SignupFromJson(json);

  final Mutation$Signup$register register;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Mutation$SignupToJson(this);
  int get hashCode {
    final l$register = register;
    final l$$__typename = $__typename;
    return Object.hashAll([l$register, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Mutation$Signup) || runtimeType != other.runtimeType)
      return false;
    final l$register = register;
    final lOther$register = other.register;
    if (l$register != lOther$register) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Mutation$Signup on Mutation$Signup {
  Mutation$Signup copyWith(
          {Mutation$Signup$register? register, String? $__typename}) =>
      Mutation$Signup(
          register: register == null ? this.register : register,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const queryDocumentSignup = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'Signup'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'data')),
            type: NamedTypeNode(
                name: NameNode(value: 'RegisterInput'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'register'),
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
                  name: NameNode(value: 'name'),
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
Mutation$Signup _parserFn$Mutation$Signup(Map<String, dynamic> data) =>
    Mutation$Signup.fromJson(data);
typedef OnMutationCompleted$Mutation$Signup = FutureOr<void> Function(
    dynamic, Mutation$Signup?);

class Options$Mutation$Signup extends graphql.MutationOptions<Mutation$Signup> {
  Options$Mutation$Signup(
      {String? operationName,
      required Variables$Mutation$Signup variables,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      OnMutationCompleted$Mutation$Signup? onCompleted,
      graphql.OnMutationUpdate<Mutation$Signup>? update,
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
                    data == null ? null : _parserFn$Mutation$Signup(data)),
            update: update,
            onError: onError,
            document: queryDocumentSignup,
            parserFn: _parserFn$Mutation$Signup);

  final OnMutationCompleted$Mutation$Signup? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed
      ];
}

class WatchOptions$Mutation$Signup
    extends graphql.WatchQueryOptions<Mutation$Signup> {
  WatchOptions$Mutation$Signup(
      {String? operationName,
      required Variables$Mutation$Signup variables,
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
            document: queryDocumentSignup,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Mutation$Signup);
}

extension ClientExtension$Mutation$Signup on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$Signup>> mutate$Signup(
          Options$Mutation$Signup options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$Signup> watchMutation$Signup(
          WatchOptions$Mutation$Signup options) =>
      this.watchMutation(options);
}

class Mutation$Signup$HookResult {
  Mutation$Signup$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$Signup runMutation;

  final graphql.QueryResult<Mutation$Signup> result;
}

Mutation$Signup$HookResult useMutation$Signup(
    [WidgetOptions$Mutation$Signup? options]) {
  final result =
      graphql_flutter.useMutation(options ?? WidgetOptions$Mutation$Signup());
  return Mutation$Signup$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$Signup> useWatchMutation$Signup(
        WatchOptions$Mutation$Signup options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$Signup
    extends graphql.MutationOptions<Mutation$Signup> {
  WidgetOptions$Mutation$Signup(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      OnMutationCompleted$Mutation$Signup? onCompleted,
      graphql.OnMutationUpdate<Mutation$Signup>? update,
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
                    data == null ? null : _parserFn$Mutation$Signup(data)),
            update: update,
            onError: onError,
            document: queryDocumentSignup,
            parserFn: _parserFn$Mutation$Signup);

  final OnMutationCompleted$Mutation$Signup? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed
      ];
}

typedef RunMutation$Mutation$Signup = graphql.MultiSourceResult<Mutation$Signup>
    Function(Variables$Mutation$Signup, {Object? optimisticResult});
typedef Builder$Mutation$Signup = widgets.Widget Function(
    RunMutation$Mutation$Signup, graphql.QueryResult<Mutation$Signup>?);

class Mutation$Signup$Widget extends graphql_flutter.Mutation<Mutation$Signup> {
  Mutation$Signup$Widget(
      {widgets.Key? key,
      WidgetOptions$Mutation$Signup? options,
      required Builder$Mutation$Signup builder})
      : super(
            key: key,
            options: options ?? WidgetOptions$Mutation$Signup(),
            builder: (run, result) => builder(
                (variables, {optimisticResult}) =>
                    run(variables.toJson(), optimisticResult: optimisticResult),
                result));
}

@JsonSerializable(explicitToJson: true)
class Mutation$Signup$register {
  Mutation$Signup$register(
      {required this.id, required this.name, required this.$__typename});

  @override
  factory Mutation$Signup$register.fromJson(Map<String, dynamic> json) =>
      _$Mutation$Signup$registerFromJson(json);

  final String id;

  final String name;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Mutation$Signup$registerToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Mutation$Signup$register) ||
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

extension UtilityExtension$Mutation$Signup$register
    on Mutation$Signup$register {
  Mutation$Signup$register copyWith(
          {String? id, String? name, String? $__typename}) =>
      Mutation$Signup$register(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
