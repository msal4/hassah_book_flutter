import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:hassah_book_flutter/common/utils/coercers.dart';
import 'package:json_annotation/json_annotation.dart';
import 'user.fragment.graphql.dart';
part 'me.query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Query$Me {
  Query$Me({required this.me, required this.$__typename});

  @override
  factory Query$Me.fromJson(Map<String, dynamic> json) =>
      _$Query$MeFromJson(json);

  final Query$Me$me me;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$MeToJson(this);
  int get hashCode {
    final l$me = me;
    final l$$__typename = $__typename;
    return Object.hashAll([l$me, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Me) || runtimeType != other.runtimeType) return false;
    final l$me = me;
    final lOther$me = other.me;
    if (l$me != lOther$me) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$Me on Query$Me {
  Query$Me copyWith({Query$Me$me? me, String? $__typename}) => Query$Me(
      me: me == null ? this.me : me,
      $__typename: $__typename == null ? this.$__typename : $__typename);
}

const queryDocumentMe = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Me'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'me'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'User'), directives: []),
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
  fragmentDefinitionUser,
]);
Query$Me _parserFn$Query$Me(Map<String, dynamic> data) =>
    Query$Me.fromJson(data);

class Options$Query$Me extends graphql.QueryOptions<Query$Me> {
  Options$Query$Me(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      Duration? pollInterval,
      graphql.Context? context})
      : super(
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            pollInterval: pollInterval,
            context: context,
            document: queryDocumentMe,
            parserFn: _parserFn$Query$Me);
}

class WatchOptions$Query$Me extends graphql.WatchQueryOptions<Query$Me> {
  WatchOptions$Query$Me(
      {String? operationName,
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
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            context: context,
            document: queryDocumentMe,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Query$Me);
}

class FetchMoreOptions$Query$Me extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Me({required graphql.UpdateQuery updateQuery})
      : super(updateQuery: updateQuery, document: queryDocumentMe);
}

extension ClientExtension$Query$Me on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Me>> query$Me(
          [Options$Query$Me? options]) async =>
      await this.query(options ?? Options$Query$Me());
  graphql.ObservableQuery<Query$Me> watchQuery$Me(
          [WatchOptions$Query$Me? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$Me());
  void writeQuery$Me({required Query$Me data, bool broadcast = true}) =>
      this.writeQuery(
          graphql.Request(
              operation: graphql.Operation(document: queryDocumentMe)),
          data: data.toJson(),
          broadcast: broadcast);
  Query$Me? readQuery$Me({bool optimistic = true}) {
    final result = this.readQuery(
        graphql.Request(
            operation: graphql.Operation(document: queryDocumentMe)),
        optimistic: optimistic);
    return result == null ? null : Query$Me.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$Me> useQuery$Me(
        [Options$Query$Me? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$Me());
graphql.ObservableQuery<Query$Me> useWatchQuery$Me(
        [WatchOptions$Query$Me? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$Me());

class Query$Me$Widget extends graphql_flutter.Query<Query$Me> {
  Query$Me$Widget(
      {widgets.Key? key,
      Options$Query$Me? options,
      required graphql_flutter.QueryBuilder<Query$Me> builder})
      : super(
            key: key, options: options ?? Options$Query$Me(), builder: builder);
}

@JsonSerializable(explicitToJson: true)
class Query$Me$me implements Fragment$User {
  Query$Me$me(
      {required this.id,
      required this.name,
      required this.phone,
      this.province,
      this.address,
      required this.createdAt,
      required this.$__typename});

  @override
  factory Query$Me$me.fromJson(Map<String, dynamic> json) =>
      _$Query$Me$meFromJson(json);

  final String id;

  final String name;

  final String phone;

  final String? province;

  final String? address;

  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime createdAt;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$Me$meToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$phone = phone;
    final l$province = province;
    final l$address = address;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$phone,
      l$province,
      l$address,
      l$createdAt,
      l$$__typename
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Me$me) || runtimeType != other.runtimeType)
      return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) return false;
    final l$province = province;
    final lOther$province = other.province;
    if (l$province != lOther$province) return false;
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) return false;
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$Me$me on Query$Me$me {
  Query$Me$me copyWith(
          {String? id,
          String? name,
          String? phone,
          String? Function()? province,
          String? Function()? address,
          DateTime? createdAt,
          String? $__typename}) =>
      Query$Me$me(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          phone: phone == null ? this.phone : phone,
          province: province == null ? this.province : province(),
          address: address == null ? this.address : address(),
          createdAt: createdAt == null ? this.createdAt : createdAt,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
