import '../schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:json_annotation/json_annotation.dart';
part 'send_verification_code.query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Variables$Mutation$SendVerificationCode {
  Variables$Mutation$SendVerificationCode({required this.data});

  @override
  factory Variables$Mutation$SendVerificationCode.fromJson(
          Map<String, dynamic> json) =>
      _$Variables$Mutation$SendVerificationCodeFromJson(json);

  final Input$SendVerificationCodeInput data;

  Map<String, dynamic> toJson() =>
      _$Variables$Mutation$SendVerificationCodeToJson(this);
  int get hashCode {
    final l$data = data;
    return Object.hashAll([l$data]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Variables$Mutation$SendVerificationCode) ||
        runtimeType != other.runtimeType) return false;
    final l$data = data;
    final lOther$data = other.data;
    if (l$data != lOther$data) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Mutation$SendVerificationCode {
  Mutation$SendVerificationCode(
      {required this.sendVerificationCode, required this.$__typename});

  @override
  factory Mutation$SendVerificationCode.fromJson(Map<String, dynamic> json) =>
      _$Mutation$SendVerificationCodeFromJson(json);

  final Mutation$SendVerificationCode$sendVerificationCode sendVerificationCode;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Mutation$SendVerificationCodeToJson(this);
  int get hashCode {
    final l$sendVerificationCode = sendVerificationCode;
    final l$$__typename = $__typename;
    return Object.hashAll([l$sendVerificationCode, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Mutation$SendVerificationCode) ||
        runtimeType != other.runtimeType) return false;
    final l$sendVerificationCode = sendVerificationCode;
    final lOther$sendVerificationCode = other.sendVerificationCode;
    if (l$sendVerificationCode != lOther$sendVerificationCode) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Mutation$SendVerificationCode
    on Mutation$SendVerificationCode {
  Mutation$SendVerificationCode copyWith(
          {Mutation$SendVerificationCode$sendVerificationCode?
              sendVerificationCode,
          String? $__typename}) =>
      Mutation$SendVerificationCode(
          sendVerificationCode: sendVerificationCode == null
              ? this.sendVerificationCode
              : sendVerificationCode,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const queryDocumentSendVerificationCode = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SendVerificationCode'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'data')),
            type: NamedTypeNode(
                name: NameNode(value: 'SendVerificationCodeInput'),
                isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'sendVerificationCode'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'data'),
                  value: VariableNode(name: NameNode(value: 'data')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'sessionInfo'),
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
Mutation$SendVerificationCode _parserFn$Mutation$SendVerificationCode(
        Map<String, dynamic> data) =>
    Mutation$SendVerificationCode.fromJson(data);
typedef OnMutationCompleted$Mutation$SendVerificationCode = FutureOr<void>
    Function(dynamic, Mutation$SendVerificationCode?);

class Options$Mutation$SendVerificationCode
    extends graphql.MutationOptions<Mutation$SendVerificationCode> {
  Options$Mutation$SendVerificationCode(
      {String? operationName,
      required Variables$Mutation$SendVerificationCode variables,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      OnMutationCompleted$Mutation$SendVerificationCode? onCompleted,
      graphql.OnMutationUpdate<Mutation$SendVerificationCode>? update,
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
                        : _parserFn$Mutation$SendVerificationCode(data)),
            update: update,
            onError: onError,
            document: queryDocumentSendVerificationCode,
            parserFn: _parserFn$Mutation$SendVerificationCode);

  final OnMutationCompleted$Mutation$SendVerificationCode?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed
      ];
}

class WatchOptions$Mutation$SendVerificationCode
    extends graphql.WatchQueryOptions<Mutation$SendVerificationCode> {
  WatchOptions$Mutation$SendVerificationCode(
      {String? operationName,
      required Variables$Mutation$SendVerificationCode variables,
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
            document: queryDocumentSendVerificationCode,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Mutation$SendVerificationCode);
}

extension ClientExtension$Mutation$SendVerificationCode
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SendVerificationCode>>
      mutate$SendVerificationCode(
              Options$Mutation$SendVerificationCode options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$SendVerificationCode>
      watchMutation$SendVerificationCode(
              WatchOptions$Mutation$SendVerificationCode options) =>
          this.watchMutation(options);
}

class Mutation$SendVerificationCode$HookResult {
  Mutation$SendVerificationCode$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$SendVerificationCode runMutation;

  final graphql.QueryResult<Mutation$SendVerificationCode> result;
}

Mutation$SendVerificationCode$HookResult useMutation$SendVerificationCode(
    [WidgetOptions$Mutation$SendVerificationCode? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$SendVerificationCode());
  return Mutation$SendVerificationCode$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$SendVerificationCode>
    useWatchMutation$SendVerificationCode(
            WatchOptions$Mutation$SendVerificationCode options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$SendVerificationCode
    extends graphql.MutationOptions<Mutation$SendVerificationCode> {
  WidgetOptions$Mutation$SendVerificationCode(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      OnMutationCompleted$Mutation$SendVerificationCode? onCompleted,
      graphql.OnMutationUpdate<Mutation$SendVerificationCode>? update,
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
                        : _parserFn$Mutation$SendVerificationCode(data)),
            update: update,
            onError: onError,
            document: queryDocumentSendVerificationCode,
            parserFn: _parserFn$Mutation$SendVerificationCode);

  final OnMutationCompleted$Mutation$SendVerificationCode?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed
      ];
}

typedef RunMutation$Mutation$SendVerificationCode
    = graphql.MultiSourceResult<Mutation$SendVerificationCode> Function(
        Variables$Mutation$SendVerificationCode,
        {Object? optimisticResult});
typedef Builder$Mutation$SendVerificationCode = widgets.Widget Function(
    RunMutation$Mutation$SendVerificationCode,
    graphql.QueryResult<Mutation$SendVerificationCode>?);

class Mutation$SendVerificationCode$Widget
    extends graphql_flutter.Mutation<Mutation$SendVerificationCode> {
  Mutation$SendVerificationCode$Widget(
      {widgets.Key? key,
      WidgetOptions$Mutation$SendVerificationCode? options,
      required Builder$Mutation$SendVerificationCode builder})
      : super(
            key: key,
            options: options ?? WidgetOptions$Mutation$SendVerificationCode(),
            builder: (run, result) => builder(
                (variables, {optimisticResult}) =>
                    run(variables.toJson(), optimisticResult: optimisticResult),
                result));
}

@JsonSerializable(explicitToJson: true)
class Mutation$SendVerificationCode$sendVerificationCode {
  Mutation$SendVerificationCode$sendVerificationCode(
      {required this.sessionInfo, required this.$__typename});

  @override
  factory Mutation$SendVerificationCode$sendVerificationCode.fromJson(
          Map<String, dynamic> json) =>
      _$Mutation$SendVerificationCode$sendVerificationCodeFromJson(json);

  final String sessionInfo;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Mutation$SendVerificationCode$sendVerificationCodeToJson(this);
  int get hashCode {
    final l$sessionInfo = sessionInfo;
    final l$$__typename = $__typename;
    return Object.hashAll([l$sessionInfo, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Mutation$SendVerificationCode$sendVerificationCode) ||
        runtimeType != other.runtimeType) return false;
    final l$sessionInfo = sessionInfo;
    final lOther$sessionInfo = other.sessionInfo;
    if (l$sessionInfo != lOther$sessionInfo) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Mutation$SendVerificationCode$sendVerificationCode
    on Mutation$SendVerificationCode$sendVerificationCode {
  Mutation$SendVerificationCode$sendVerificationCode copyWith(
          {String? sessionInfo, String? $__typename}) =>
      Mutation$SendVerificationCode$sendVerificationCode(
          sessionInfo: sessionInfo == null ? this.sessionInfo : sessionInfo,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
