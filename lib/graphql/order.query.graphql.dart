import '../schema.graphql.dart';
import 'author.fragment.graphql.dart';
import 'category.fragment.graphql.dart';
import 'order.fragment.graphql.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:hassah_book_flutter/common/utils/coercers.dart';
import 'package:json_annotation/json_annotation.dart';
import 'product.fragment.graphql.dart';
part 'order.query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Variables$Query$Order {
  Variables$Query$Order({required this.id, this.skip, this.take});

  @override
  factory Variables$Query$Order.fromJson(Map<String, dynamic> json) =>
      _$Variables$Query$OrderFromJson(json);

  final String id;

  final int? skip;

  final int? take;

  Map<String, dynamic> toJson() => _$Variables$Query$OrderToJson(this);
  int get hashCode {
    final l$id = id;
    final l$skip = skip;
    final l$take = take;
    return Object.hashAll([l$id, l$skip, l$take]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Variables$Query$Order) || runtimeType != other.runtimeType)
      return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
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
class Query$Order {
  Query$Order({this.order, required this.$__typename});

  @override
  factory Query$Order.fromJson(Map<String, dynamic> json) =>
      _$Query$OrderFromJson(json);

  final Query$Order$order? order;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$OrderToJson(this);
  int get hashCode {
    final l$order = order;
    final l$$__typename = $__typename;
    return Object.hashAll([l$order, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Order) || runtimeType != other.runtimeType)
      return false;
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != lOther$order) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$Order on Query$Order {
  Query$Order copyWith(
          {Query$Order$order? Function()? order, String? $__typename}) =>
      Query$Order(
          order: order == null ? this.order : order(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const queryDocumentOrder = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Order'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'id')),
            type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
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
            name: NameNode(value: 'order'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'id'),
                  value: VariableNode(name: NameNode(value: 'id')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                  name: NameNode(value: 'Order'), directives: []),
              FieldNode(
                  name: NameNode(value: 'purchases'),
                  alias: null,
                  arguments: [
                    ArgumentNode(
                        name: NameNode(value: 'skip'),
                        value: VariableNode(name: NameNode(value: 'skip'))),
                    ArgumentNode(
                        name: NameNode(value: 'take'),
                        value: VariableNode(name: NameNode(value: 'take')))
                  ],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'PaginatedPurchaseResponse'),
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
        FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  fragmentDefinitionOrder,
  fragmentDefinitionPaginatedPurchaseResponse,
  fragmentDefinitionPurchase,
  fragmentDefinitionProduct,
  fragmentDefinitionAuthor,
  fragmentDefinitionCategory,
]);
Query$Order _parserFn$Query$Order(Map<String, dynamic> data) =>
    Query$Order.fromJson(data);

class Options$Query$Order extends graphql.QueryOptions<Query$Order> {
  Options$Query$Order(
      {String? operationName,
      required Variables$Query$Order variables,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      Duration? pollInterval,
      graphql.Context? context})
      : super(
            variables: variables.toJson(),
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            pollInterval: pollInterval,
            context: context,
            document: queryDocumentOrder,
            parserFn: _parserFn$Query$Order);
}

class WatchOptions$Query$Order extends graphql.WatchQueryOptions<Query$Order> {
  WatchOptions$Query$Order(
      {String? operationName,
      required Variables$Query$Order variables,
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
            document: queryDocumentOrder,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Query$Order);
}

class FetchMoreOptions$Query$Order extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Order(
      {required graphql.UpdateQuery updateQuery,
      required Variables$Query$Order variables})
      : super(
            updateQuery: updateQuery,
            variables: variables.toJson(),
            document: queryDocumentOrder);
}

extension ClientExtension$Query$Order on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Order>> query$Order(
          Options$Query$Order options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$Order> watchQuery$Order(
          WatchOptions$Query$Order options) =>
      this.watchQuery(options);
  void writeQuery$Order(
          {required Query$Order data,
          required Variables$Query$Order variables,
          bool broadcast = true}) =>
      this.writeQuery(
          graphql.Request(
              operation: graphql.Operation(document: queryDocumentOrder),
              variables: variables.toJson()),
          data: data.toJson(),
          broadcast: broadcast);
  Query$Order? readQuery$Order(
      {required Variables$Query$Order variables, bool optimistic = true}) {
    final result = this.readQuery(
        graphql.Request(
            operation: graphql.Operation(document: queryDocumentOrder),
            variables: variables.toJson()),
        optimistic: optimistic);
    return result == null ? null : Query$Order.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$Order> useQuery$Order(
        Options$Query$Order options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$Order> useWatchQuery$Order(
        WatchOptions$Query$Order options) =>
    graphql_flutter.useWatchQuery(options);

class Query$Order$Widget extends graphql_flutter.Query<Query$Order> {
  Query$Order$Widget(
      {widgets.Key? key,
      required Options$Query$Order options,
      required graphql_flutter.QueryBuilder<Query$Order> builder})
      : super(key: key, options: options, builder: builder);
}

@JsonSerializable(explicitToJson: true)
class Query$Order$order implements Fragment$Order {
  Query$Order$order(
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
  factory Query$Order$order.fromJson(Map<String, dynamic> json) =>
      _$Query$Order$orderFromJson(json);

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

  final Query$Order$order$purchases purchases;

  Map<String, dynamic> toJson() => _$Query$Order$orderToJson(this);
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
    if (!(other is Query$Order$order) || runtimeType != other.runtimeType)
      return false;
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

extension UtilityExtension$Query$Order$order on Query$Order$order {
  Query$Order$order copyWith(
          {String? id,
          String? Function()? phone,
          int? orderNumber,
          String? province,
          String? address,
          Enum$OrderStatus? status,
          double? totalPrice,
          DateTime? createdAt,
          String? $__typename,
          Query$Order$order$purchases? purchases}) =>
      Query$Order$order(
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
class Query$Order$order$purchases
    implements Fragment$PaginatedPurchaseResponse {
  Query$Order$order$purchases(
      {required this.items,
      required this.hasMore,
      required this.total,
      required this.$__typename});

  @override
  factory Query$Order$order$purchases.fromJson(Map<String, dynamic> json) =>
      _$Query$Order$order$purchasesFromJson(json);

  final List<Query$Order$order$purchases$items> items;

  final bool hasMore;

  final int total;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$Order$order$purchasesToJson(this);
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
    if (!(other is Query$Order$order$purchases) ||
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

extension UtilityExtension$Query$Order$order$purchases
    on Query$Order$order$purchases {
  Query$Order$order$purchases copyWith(
          {List<Query$Order$order$purchases$items>? items,
          bool? hasMore,
          int? total,
          String? $__typename}) =>
      Query$Order$order$purchases(
          items: items == null ? this.items : items,
          hasMore: hasMore == null ? this.hasMore : hasMore,
          total: total == null ? this.total : total,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$Order$order$purchases$items
    implements Fragment$PaginatedPurchaseResponse$items, Fragment$Purchase {
  Query$Order$order$purchases$items(
      {required this.id,
      required this.product,
      required this.quantity,
      required this.$__typename});

  @override
  factory Query$Order$order$purchases$items.fromJson(
          Map<String, dynamic> json) =>
      _$Query$Order$order$purchases$itemsFromJson(json);

  final String id;

  final Query$Order$order$purchases$items$product product;

  final int quantity;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$Order$order$purchases$itemsToJson(this);
  int get hashCode {
    final l$id = id;
    final l$product = product;
    final l$quantity = quantity;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$product, l$quantity, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Order$order$purchases$items) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$product = product;
    final lOther$product = other.product;
    if (l$product != lOther$product) return false;
    final l$quantity = quantity;
    final lOther$quantity = other.quantity;
    if (l$quantity != lOther$quantity) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$Order$order$purchases$items
    on Query$Order$order$purchases$items {
  Query$Order$order$purchases$items copyWith(
          {String? id,
          Query$Order$order$purchases$items$product? product,
          int? quantity,
          String? $__typename}) =>
      Query$Order$order$purchases$items(
          id: id == null ? this.id : id,
          product: product == null ? this.product : product,
          quantity: quantity == null ? this.quantity : quantity,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$Order$order$purchases$items$product
    implements
        Fragment$PaginatedPurchaseResponse$items$product,
        Fragment$Purchase$product,
        Fragment$Product {
  Query$Order$order$purchases$items$product(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.overview,
      required this.author,
      required this.categories,
      required this.$__typename});

  @override
  factory Query$Order$order$purchases$items$product.fromJson(
          Map<String, dynamic> json) =>
      _$Query$Order$order$purchases$items$productFromJson(json);

  final String id;

  final String name;

  final double price;

  final String image;

  final String overview;

  final Query$Order$order$purchases$items$product$author author;

  final List<Query$Order$order$purchases$items$product$categories> categories;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$Order$order$purchases$items$productToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$price = price;
    final l$image = image;
    final l$overview = overview;
    final l$author = author;
    final l$categories = categories;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$price,
      l$image,
      l$overview,
      l$author,
      Object.hashAll(l$categories.map((v) => v)),
      l$$__typename
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Order$order$purchases$items$product) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$price = price;
    final lOther$price = other.price;
    if (l$price != lOther$price) return false;
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) return false;
    final l$overview = overview;
    final lOther$overview = other.overview;
    if (l$overview != lOther$overview) return false;
    final l$author = author;
    final lOther$author = other.author;
    if (l$author != lOther$author) return false;
    final l$categories = categories;
    final lOther$categories = other.categories;
    if (l$categories.length != lOther$categories.length) return false;
    for (int i = 0; i < l$categories.length; i++) {
      final l$categories$entry = l$categories[i];
      final lOther$categories$entry = lOther$categories[i];
      if (l$categories$entry != lOther$categories$entry) return false;
    }

    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$Order$order$purchases$items$product
    on Query$Order$order$purchases$items$product {
  Query$Order$order$purchases$items$product copyWith(
          {String? id,
          String? name,
          double? price,
          String? image,
          String? overview,
          Query$Order$order$purchases$items$product$author? author,
          List<Query$Order$order$purchases$items$product$categories>?
              categories,
          String? $__typename}) =>
      Query$Order$order$purchases$items$product(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          price: price == null ? this.price : price,
          image: image == null ? this.image : image,
          overview: overview == null ? this.overview : overview,
          author: author == null ? this.author : author,
          categories: categories == null ? this.categories : categories,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$Order$order$purchases$items$product$author
    implements
        Fragment$PaginatedPurchaseResponse$items$product$author,
        Fragment$Purchase$product$author,
        Fragment$Product$author,
        Fragment$Author {
  Query$Order$order$purchases$items$product$author(
      {required this.id,
      required this.name,
      required this.image,
      required this.overview,
      required this.$__typename});

  @override
  factory Query$Order$order$purchases$items$product$author.fromJson(
          Map<String, dynamic> json) =>
      _$Query$Order$order$purchases$items$product$authorFromJson(json);

  final String id;

  final String name;

  final String image;

  final String overview;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$Order$order$purchases$items$product$authorToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$image = image;
    final l$overview = overview;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$image, l$overview, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Order$order$purchases$items$product$author) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) return false;
    final l$overview = overview;
    final lOther$overview = other.overview;
    if (l$overview != lOther$overview) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$Order$order$purchases$items$product$author
    on Query$Order$order$purchases$items$product$author {
  Query$Order$order$purchases$items$product$author copyWith(
          {String? id,
          String? name,
          String? image,
          String? overview,
          String? $__typename}) =>
      Query$Order$order$purchases$items$product$author(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          image: image == null ? this.image : image,
          overview: overview == null ? this.overview : overview,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$Order$order$purchases$items$product$categories
    implements
        Fragment$PaginatedPurchaseResponse$items$product$categories,
        Fragment$Purchase$product$categories,
        Fragment$Product$categories,
        Fragment$Category {
  Query$Order$order$purchases$items$product$categories(
      {required this.id, required this.name, required this.$__typename});

  @override
  factory Query$Order$order$purchases$items$product$categories.fromJson(
          Map<String, dynamic> json) =>
      _$Query$Order$order$purchases$items$product$categoriesFromJson(json);

  final String id;

  final String name;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$Order$order$purchases$items$product$categoriesToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Order$order$purchases$items$product$categories) ||
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

extension UtilityExtension$Query$Order$order$purchases$items$product$categories
    on Query$Order$order$purchases$items$product$categories {
  Query$Order$order$purchases$items$product$categories copyWith(
          {String? id, String? name, String? $__typename}) =>
      Query$Order$order$purchases$items$product$categories(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
