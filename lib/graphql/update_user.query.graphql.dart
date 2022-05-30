import '../schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:json_annotation/json_annotation.dart';
part 'update_user.query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Variables$Mutation$UpdateProfile {
  Variables$Mutation$UpdateProfile({required this.data});

  @override
  factory Variables$Mutation$UpdateProfile.fromJson(
          Map<String, dynamic> json) =>
      _$Variables$Mutation$UpdateProfileFromJson(json);

  final Input$UpdateProfileInput data;

  Map<String, dynamic> toJson() =>
      _$Variables$Mutation$UpdateProfileToJson(this);
  int get hashCode {
    final l$data = data;
    return Object.hashAll([l$data]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Variables$Mutation$UpdateProfile) ||
        runtimeType != other.runtimeType) return false;
    final l$data = data;
    final lOther$data = other.data;
    if (l$data != lOther$data) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Mutation$UpdateProfile {
  Mutation$UpdateProfile(
      {required this.updateProfile, required this.$__typename});

  @override
  factory Mutation$UpdateProfile.fromJson(Map<String, dynamic> json) =>
      _$Mutation$UpdateProfileFromJson(json);

  final bool updateProfile;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Mutation$UpdateProfileToJson(this);
  int get hashCode {
    final l$updateProfile = updateProfile;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateProfile, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Mutation$UpdateProfile) || runtimeType != other.runtimeType)
      return false;
    final l$updateProfile = updateProfile;
    final lOther$updateProfile = other.updateProfile;
    if (l$updateProfile != lOther$updateProfile) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Mutation$UpdateProfile on Mutation$UpdateProfile {
  Mutation$UpdateProfile copyWith({bool? updateProfile, String? $__typename}) =>
      Mutation$UpdateProfile(
          updateProfile:
              updateProfile == null ? this.updateProfile : updateProfile,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const queryDocumentUpdateProfile = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateProfile'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'data')),
            type: NamedTypeNode(
                name: NameNode(value: 'UpdateProfileInput'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'updateProfile'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'data'),
                  value: VariableNode(name: NameNode(value: 'data')))
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
Mutation$UpdateProfile _parserFn$Mutation$UpdateProfile(
        Map<String, dynamic> data) =>
    Mutation$UpdateProfile.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateProfile = FutureOr<void> Function(
    dynamic, Mutation$UpdateProfile?);

class Options$Mutation$UpdateProfile
    extends graphql.MutationOptions<Mutation$UpdateProfile> {
  Options$Mutation$UpdateProfile(
      {String? operationName,
      required Variables$Mutation$UpdateProfile variables,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      OnMutationCompleted$Mutation$UpdateProfile? onCompleted,
      graphql.OnMutationUpdate<Mutation$UpdateProfile>? update,
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
                        : _parserFn$Mutation$UpdateProfile(data)),
            update: update,
            onError: onError,
            document: queryDocumentUpdateProfile,
            parserFn: _parserFn$Mutation$UpdateProfile);

  final OnMutationCompleted$Mutation$UpdateProfile? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed
      ];
}

class WatchOptions$Mutation$UpdateProfile
    extends graphql.WatchQueryOptions<Mutation$UpdateProfile> {
  WatchOptions$Mutation$UpdateProfile(
      {String? operationName,
      required Variables$Mutation$UpdateProfile variables,
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
            document: queryDocumentUpdateProfile,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Mutation$UpdateProfile);
}

extension ClientExtension$Mutation$UpdateProfile on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateProfile>> mutate$UpdateProfile(
          Options$Mutation$UpdateProfile options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$UpdateProfile> watchMutation$UpdateProfile(
          WatchOptions$Mutation$UpdateProfile options) =>
      this.watchMutation(options);
}

class Mutation$UpdateProfile$HookResult {
  Mutation$UpdateProfile$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$UpdateProfile runMutation;

  final graphql.QueryResult<Mutation$UpdateProfile> result;
}

Mutation$UpdateProfile$HookResult useMutation$UpdateProfile(
    [WidgetOptions$Mutation$UpdateProfile? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$UpdateProfile());
  return Mutation$UpdateProfile$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateProfile> useWatchMutation$UpdateProfile(
        WatchOptions$Mutation$UpdateProfile options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateProfile
    extends graphql.MutationOptions<Mutation$UpdateProfile> {
  WidgetOptions$Mutation$UpdateProfile(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      OnMutationCompleted$Mutation$UpdateProfile? onCompleted,
      graphql.OnMutationUpdate<Mutation$UpdateProfile>? update,
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
                        : _parserFn$Mutation$UpdateProfile(data)),
            update: update,
            onError: onError,
            document: queryDocumentUpdateProfile,
            parserFn: _parserFn$Mutation$UpdateProfile);

  final OnMutationCompleted$Mutation$UpdateProfile? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed
      ];
}

typedef RunMutation$Mutation$UpdateProfile
    = graphql.MultiSourceResult<Mutation$UpdateProfile>
        Function(Variables$Mutation$UpdateProfile, {Object? optimisticResult});
typedef Builder$Mutation$UpdateProfile = widgets.Widget Function(
    RunMutation$Mutation$UpdateProfile,
    graphql.QueryResult<Mutation$UpdateProfile>?);

class Mutation$UpdateProfile$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateProfile> {
  Mutation$UpdateProfile$Widget(
      {widgets.Key? key,
      WidgetOptions$Mutation$UpdateProfile? options,
      required Builder$Mutation$UpdateProfile builder})
      : super(
            key: key,
            options: options ?? WidgetOptions$Mutation$UpdateProfile(),
            builder: (run, result) => builder(
                (variables, {optimisticResult}) =>
                    run(variables.toJson(), optimisticResult: optimisticResult),
                result));
}
