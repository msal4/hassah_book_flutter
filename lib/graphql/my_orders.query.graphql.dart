import '../schema.graphql.dart';
import 'order.fragment.graphql.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:hassah_book_flutter/common/utils/coercers.dart';
import 'package:json_annotation/json_annotation.dart';
part 'my_orders.query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Variables$Query$MyOrders {
  Variables$Query$MyOrders({this.skip, this.take});

  @override
  factory Variables$Query$MyOrders.fromJson(Map<String, dynamic> json) =>
      _$Variables$Query$MyOrdersFromJson(json);

  final int? skip;

  final int? take;

  Map<String, dynamic> toJson() => _$Variables$Query$MyOrdersToJson(this);
  int get hashCode {
    final l$skip = skip;
    final l$take = take;
    return Object.hashAll([l$skip, l$take]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Variables$Query$MyOrders) ||
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
class Query$MyOrders {
  Query$MyOrders({required this.myOrders, required this.$__typename});

  @override
  factory Query$MyOrders.fromJson(Map<String, dynamic> json) =>
      _$Query$MyOrdersFromJson(json);

  final Query$MyOrders$myOrders myOrders;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$MyOrdersToJson(this);
  int get hashCode {
    final l$myOrders = myOrders;
    final l$$__typename = $__typename;
    return Object.hashAll([l$myOrders, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$MyOrders) || runtimeType != other.runtimeType)
      return false;
    final l$myOrders = myOrders;
    final lOther$myOrders = other.myOrders;
    if (l$myOrders != lOther$myOrders) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$MyOrders on Query$MyOrders {
  Query$MyOrders copyWith(
          {Query$MyOrders$myOrders? myOrders, String? $__typename}) =>
      Query$MyOrders(
          myOrders: myOrders == null ? this.myOrders : myOrders,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const queryDocumentMyOrders = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'MyOrders'),
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
            name: NameNode(value: 'myOrders'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'skip'),
                  value: VariableNode(name: NameNode(value: 'skip'))),
              ArgumentNode(
                  name: NameNode(value: 'take'),
                  value: VariableNode(name: NameNode(value: 'take'))),
              ArgumentNode(
                  name: NameNode(value: 'order'),
                  value: ListValueNode(values: [
                    ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'field'),
                          value: StringValueNode(
                              value: 'createdAt', isBlock: false)),
                      ObjectFieldNode(
                          name: NameNode(value: 'order'),
                          value: EnumValueNode(name: NameNode(value: 'DESC')))
                    ])
                  ]))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                  name: NameNode(value: 'PaginatedOrderResponse'),
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
  fragmentDefinitionPaginatedOrderResponse,
  fragmentDefinitionOrder,
]);
Query$MyOrders _parserFn$Query$MyOrders(Map<String, dynamic> data) =>
    Query$MyOrders.fromJson(data);

class Options$Query$MyOrders extends graphql.QueryOptions<Query$MyOrders> {
  Options$Query$MyOrders(
      {String? operationName,
      Variables$Query$MyOrders? variables,
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
            document: queryDocumentMyOrders,
            parserFn: _parserFn$Query$MyOrders);
}

class WatchOptions$Query$MyOrders
    extends graphql.WatchQueryOptions<Query$MyOrders> {
  WatchOptions$Query$MyOrders(
      {String? operationName,
      Variables$Query$MyOrders? variables,
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
            document: queryDocumentMyOrders,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Query$MyOrders);
}

class FetchMoreOptions$Query$MyOrders extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$MyOrders(
      {required graphql.UpdateQuery updateQuery,
      Variables$Query$MyOrders? variables})
      : super(
            updateQuery: updateQuery,
            variables: variables?.toJson() ?? {},
            document: queryDocumentMyOrders);
}

extension ClientExtension$Query$MyOrders on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$MyOrders>> query$MyOrders(
          [Options$Query$MyOrders? options]) async =>
      await this.query(options ?? Options$Query$MyOrders());
  graphql.ObservableQuery<Query$MyOrders> watchQuery$MyOrders(
          [WatchOptions$Query$MyOrders? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$MyOrders());
  void writeQuery$MyOrders(
          {required Query$MyOrders data,
          Variables$Query$MyOrders? variables,
          bool broadcast = true}) =>
      this.writeQuery(
          graphql.Request(
              operation: graphql.Operation(document: queryDocumentMyOrders),
              variables: variables?.toJson() ?? const {}),
          data: data.toJson(),
          broadcast: broadcast);
  Query$MyOrders? readQuery$MyOrders(
      {Variables$Query$MyOrders? variables, bool optimistic = true}) {
    final result = this.readQuery(
        graphql.Request(
            operation: graphql.Operation(document: queryDocumentMyOrders),
            variables: variables?.toJson() ?? const {}),
        optimistic: optimistic);
    return result == null ? null : Query$MyOrders.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$MyOrders> useQuery$MyOrders(
        [Options$Query$MyOrders? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$MyOrders());
graphql.ObservableQuery<Query$MyOrders> useWatchQuery$MyOrders(
        [WatchOptions$Query$MyOrders? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$MyOrders());

class Query$MyOrders$Widget extends graphql_flutter.Query<Query$MyOrders> {
  Query$MyOrders$Widget(
      {widgets.Key? key,
      Options$Query$MyOrders? options,
      required graphql_flutter.QueryBuilder<Query$MyOrders> builder})
      : super(
            key: key,
            options: options ?? Options$Query$MyOrders(),
            builder: builder);
}

@JsonSerializable(explicitToJson: true)
class Query$MyOrders$myOrders implements Fragment$PaginatedOrderResponse {
  Query$MyOrders$myOrders(
      {required this.items,
      required this.hasMore,
      required this.total,
      required this.$__typename});

  @override
  factory Query$MyOrders$myOrders.fromJson(Map<String, dynamic> json) =>
      _$Query$MyOrders$myOrdersFromJson(json);

  final List<Query$MyOrders$myOrders$items> items;

  final bool hasMore;

  final int total;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$MyOrders$myOrdersToJson(this);
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
    if (!(other is Query$MyOrders$myOrders) || runtimeType != other.runtimeType)
      return false;
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

extension UtilityExtension$Query$MyOrders$myOrders on Query$MyOrders$myOrders {
  Query$MyOrders$myOrders copyWith(
          {List<Query$MyOrders$myOrders$items>? items,
          bool? hasMore,
          int? total,
          String? $__typename}) =>
      Query$MyOrders$myOrders(
          items: items == null ? this.items : items,
          hasMore: hasMore == null ? this.hasMore : hasMore,
          total: total == null ? this.total : total,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$MyOrders$myOrders$items
    implements Fragment$PaginatedOrderResponse$items, Fragment$Order {
  Query$MyOrders$myOrders$items(
      {required this.id,
      this.phone,
      required this.orderNumber,
      required this.province,
      required this.address,
      required this.status,
      required this.totalPrice,
      required this.createdAt,
      required this.$__typename,
      required this.purchases});

  @override
  factory Query$MyOrders$myOrders$items.fromJson(Map<String, dynamic> json) =>
      _$Query$MyOrders$myOrders$itemsFromJson(json);

  final String id;

  final String? phone;

  final int orderNumber;

  final String province;

  final String address;

  @JsonKey(unknownEnumValue: Enum$OrderStatus.$unknown)
  final Enum$OrderStatus status;

  final double totalPrice;

  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime createdAt;

  @JsonKey(name: '__typename')
  final String $__typename;

  final Query$MyOrders$myOrders$items$purchases purchases;

  Map<String, dynamic> toJson() => _$Query$MyOrders$myOrders$itemsToJson(this);
  int get hashCode {
    final l$id = id;
    final l$phone = phone;
    final l$orderNumber = orderNumber;
    final l$province = province;
    final l$address = address;
    final l$status = status;
    final l$totalPrice = totalPrice;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    final l$purchases = purchases;
    return Object.hashAll([
      l$id,
      l$phone,
      l$orderNumber,
      l$province,
      l$address,
      l$status,
      l$totalPrice,
      l$createdAt,
      l$$__typename,
      l$purchases
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$MyOrders$myOrders$items) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) return false;
    final l$orderNumber = orderNumber;
    final lOther$orderNumber = other.orderNumber;
    if (l$orderNumber != lOther$orderNumber) return false;
    final l$province = province;
    final lOther$province = other.province;
    if (l$province != lOther$province) return false;
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) return false;
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) return false;
    final l$totalPrice = totalPrice;
    final lOther$totalPrice = other.totalPrice;
    if (l$totalPrice != lOther$totalPrice) return false;
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    final l$purchases = purchases;
    final lOther$purchases = other.purchases;
    if (l$purchases != lOther$purchases) return false;
    return true;
  }
}

extension UtilityExtension$Query$MyOrders$myOrders$items
    on Query$MyOrders$myOrders$items {
  Query$MyOrders$myOrders$items copyWith(
          {String? id,
          String? Function()? phone,
          int? orderNumber,
          String? province,
          String? address,
          Enum$OrderStatus? status,
          double? totalPrice,
          DateTime? createdAt,
          String? $__typename,
          Query$MyOrders$myOrders$items$purchases? purchases}) =>
      Query$MyOrders$myOrders$items(
          id: id == null ? this.id : id,
          phone: phone == null ? this.phone : phone(),
          orderNumber: orderNumber == null ? this.orderNumber : orderNumber,
          province: province == null ? this.province : province,
          address: address == null ? this.address : address,
          status: status == null ? this.status : status,
          totalPrice: totalPrice == null ? this.totalPrice : totalPrice,
          createdAt: createdAt == null ? this.createdAt : createdAt,
          $__typename: $__typename == null ? this.$__typename : $__typename,
          purchases: purchases == null ? this.purchases : purchases);
}

@JsonSerializable(explicitToJson: true)
class Query$MyOrders$myOrders$items$purchases
    implements Fragment$PaginatedOrderResponse$items$purchases {
  Query$MyOrders$myOrders$items$purchases(
      {required this.items,
      required this.hasMore,
      required this.total,
      required this.$__typename});

  @override
  factory Query$MyOrders$myOrders$items$purchases.fromJson(
          Map<String, dynamic> json) =>
      _$Query$MyOrders$myOrders$items$purchasesFromJson(json);

  final List<Query$MyOrders$myOrders$items$purchases$items> items;

  final bool hasMore;

  final int total;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$MyOrders$myOrders$items$purchasesToJson(this);
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
    if (!(other is Query$MyOrders$myOrders$items$purchases) ||
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

extension UtilityExtension$Query$MyOrders$myOrders$items$purchases
    on Query$MyOrders$myOrders$items$purchases {
  Query$MyOrders$myOrders$items$purchases copyWith(
          {List<Query$MyOrders$myOrders$items$purchases$items>? items,
          bool? hasMore,
          int? total,
          String? $__typename}) =>
      Query$MyOrders$myOrders$items$purchases(
          items: items == null ? this.items : items,
          hasMore: hasMore == null ? this.hasMore : hasMore,
          total: total == null ? this.total : total,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$MyOrders$myOrders$items$purchases$items
    implements Fragment$PaginatedOrderResponse$items$purchases$items {
  Query$MyOrders$myOrders$items$purchases$items(
      {required this.product, required this.$__typename});

  @override
  factory Query$MyOrders$myOrders$items$purchases$items.fromJson(
          Map<String, dynamic> json) =>
      _$Query$MyOrders$myOrders$items$purchases$itemsFromJson(json);

  final Query$MyOrders$myOrders$items$purchases$items$product product;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$MyOrders$myOrders$items$purchases$itemsToJson(this);
  int get hashCode {
    final l$product = product;
    final l$$__typename = $__typename;
    return Object.hashAll([l$product, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$MyOrders$myOrders$items$purchases$items) ||
        runtimeType != other.runtimeType) return false;
    final l$product = product;
    final lOther$product = other.product;
    if (l$product != lOther$product) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$MyOrders$myOrders$items$purchases$items
    on Query$MyOrders$myOrders$items$purchases$items {
  Query$MyOrders$myOrders$items$purchases$items copyWith(
          {Query$MyOrders$myOrders$items$purchases$items$product? product,
          String? $__typename}) =>
      Query$MyOrders$myOrders$items$purchases$items(
          product: product == null ? this.product : product,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$MyOrders$myOrders$items$purchases$items$product
    implements Fragment$PaginatedOrderResponse$items$purchases$items$product {
  Query$MyOrders$myOrders$items$purchases$items$product(
      {required this.image, required this.$__typename});

  @override
  factory Query$MyOrders$myOrders$items$purchases$items$product.fromJson(
          Map<String, dynamic> json) =>
      _$Query$MyOrders$myOrders$items$purchases$items$productFromJson(json);

  final String image;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$MyOrders$myOrders$items$purchases$items$productToJson(this);
  int get hashCode {
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([l$image, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$MyOrders$myOrders$items$purchases$items$product) ||
        runtimeType != other.runtimeType) return false;
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$MyOrders$myOrders$items$purchases$items$product
    on Query$MyOrders$myOrders$items$purchases$items$product {
  Query$MyOrders$myOrders$items$purchases$items$product copyWith(
          {String? image, String? $__typename}) =>
      Query$MyOrders$myOrders$items$purchases$items$product(
          image: image == null ? this.image : image,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
