import '../schema.graphql.dart';
import 'author.fragment.graphql.dart';
import 'category.fragment.graphql.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:hassah_book_flutter/common/utils/coercers.dart';
import 'package:json_annotation/json_annotation.dart';
import 'product.fragment.graphql.dart';
part 'order.fragment.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Fragment$PaginatedOrderResponse {
  Fragment$PaginatedOrderResponse(
      {required this.items,
      required this.hasMore,
      required this.total,
      required this.$__typename});

  @override
  factory Fragment$PaginatedOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$Fragment$PaginatedOrderResponseFromJson(json);

  final List<Fragment$PaginatedOrderResponse$items> items;

  final bool hasMore;

  final int total;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedOrderResponseToJson(this);
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
    if (!(other is Fragment$PaginatedOrderResponse) ||
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

extension UtilityExtension$Fragment$PaginatedOrderResponse
    on Fragment$PaginatedOrderResponse {
  Fragment$PaginatedOrderResponse copyWith(
          {List<Fragment$PaginatedOrderResponse$items>? items,
          bool? hasMore,
          int? total,
          String? $__typename}) =>
      Fragment$PaginatedOrderResponse(
          items: items == null ? this.items : items,
          hasMore: hasMore == null ? this.hasMore : hasMore,
          total: total == null ? this.total : total,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const fragmentDefinitionPaginatedOrderResponse = FragmentDefinitionNode(
    name: NameNode(value: 'PaginatedOrderResponse'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
            name: NameNode(value: 'PaginatedOrderResponse'), isNonNull: false)),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
          name: NameNode(value: 'items'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FragmentSpreadNode(name: NameNode(value: 'Order'), directives: []),
            FieldNode(
                name: NameNode(value: 'purchases'),
                alias: null,
                arguments: [
                  ArgumentNode(
                      name: NameNode(value: 'take'),
                      value: IntValueNode(value: '1'))
                ],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                      name: NameNode(value: 'items'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: SelectionSetNode(selections: [
                        FieldNode(
                            name: NameNode(value: 'product'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: SelectionSetNode(selections: [
                              FieldNode(
                                  name: NameNode(value: 'image'),
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
                  FieldNode(
                      name: NameNode(value: 'hasMore'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null),
                  FieldNode(
                      name: NameNode(value: 'total'),
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
      FieldNode(
          name: NameNode(value: 'hasMore'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'total'),
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
    ]));
const queryDocumentPaginatedOrderResponse = DocumentNode(definitions: [
  fragmentDefinitionPaginatedOrderResponse,
  fragmentDefinitionOrder,
]);

extension ClientExtension$Fragment$PaginatedOrderResponse
    on graphql.GraphQLClient {
  void writeFragment$PaginatedOrderResponse(
          {required Fragment$PaginatedOrderResponse data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'PaginatedOrderResponse',
                  document: queryDocumentPaginatedOrderResponse)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$PaginatedOrderResponse? readFragment$PaginatedOrderResponse(
      {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'PaginatedOrderResponse',
                document: queryDocumentPaginatedOrderResponse)),
        optimistic: optimistic);
    return result == null
        ? null
        : Fragment$PaginatedOrderResponse.fromJson(result);
  }
}

@JsonSerializable(explicitToJson: true)
class Fragment$PaginatedOrderResponse$items implements Fragment$Order {
  Fragment$PaginatedOrderResponse$items(
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
  factory Fragment$PaginatedOrderResponse$items.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedOrderResponse$itemsFromJson(json);

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

  final Fragment$PaginatedOrderResponse$items$purchases purchases;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedOrderResponse$itemsToJson(this);
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
    if (!(other is Fragment$PaginatedOrderResponse$items) ||
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

extension UtilityExtension$Fragment$PaginatedOrderResponse$items
    on Fragment$PaginatedOrderResponse$items {
  Fragment$PaginatedOrderResponse$items copyWith(
          {String? id,
          String? Function()? phone,
          int? orderNumber,
          String? province,
          String? address,
          Enum$OrderStatus? status,
          double? totalPrice,
          DateTime? createdAt,
          String? $__typename,
          Fragment$PaginatedOrderResponse$items$purchases? purchases}) =>
      Fragment$PaginatedOrderResponse$items(
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
class Fragment$PaginatedOrderResponse$items$purchases {
  Fragment$PaginatedOrderResponse$items$purchases(
      {required this.items,
      required this.hasMore,
      required this.total,
      required this.$__typename});

  @override
  factory Fragment$PaginatedOrderResponse$items$purchases.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedOrderResponse$items$purchasesFromJson(json);

  final List<Fragment$PaginatedOrderResponse$items$purchases$items> items;

  final bool hasMore;

  final int total;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedOrderResponse$items$purchasesToJson(this);
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
    if (!(other is Fragment$PaginatedOrderResponse$items$purchases) ||
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

extension UtilityExtension$Fragment$PaginatedOrderResponse$items$purchases
    on Fragment$PaginatedOrderResponse$items$purchases {
  Fragment$PaginatedOrderResponse$items$purchases copyWith(
          {List<Fragment$PaginatedOrderResponse$items$purchases$items>? items,
          bool? hasMore,
          int? total,
          String? $__typename}) =>
      Fragment$PaginatedOrderResponse$items$purchases(
          items: items == null ? this.items : items,
          hasMore: hasMore == null ? this.hasMore : hasMore,
          total: total == null ? this.total : total,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Fragment$PaginatedOrderResponse$items$purchases$items {
  Fragment$PaginatedOrderResponse$items$purchases$items(
      {required this.product, required this.$__typename});

  @override
  factory Fragment$PaginatedOrderResponse$items$purchases$items.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedOrderResponse$items$purchases$itemsFromJson(json);

  final Fragment$PaginatedOrderResponse$items$purchases$items$product product;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedOrderResponse$items$purchases$itemsToJson(this);
  int get hashCode {
    final l$product = product;
    final l$$__typename = $__typename;
    return Object.hashAll([l$product, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Fragment$PaginatedOrderResponse$items$purchases$items) ||
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

extension UtilityExtension$Fragment$PaginatedOrderResponse$items$purchases$items
    on Fragment$PaginatedOrderResponse$items$purchases$items {
  Fragment$PaginatedOrderResponse$items$purchases$items copyWith(
          {Fragment$PaginatedOrderResponse$items$purchases$items$product?
              product,
          String? $__typename}) =>
      Fragment$PaginatedOrderResponse$items$purchases$items(
          product: product == null ? this.product : product,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Fragment$PaginatedOrderResponse$items$purchases$items$product {
  Fragment$PaginatedOrderResponse$items$purchases$items$product(
      {required this.image, required this.$__typename});

  @override
  factory Fragment$PaginatedOrderResponse$items$purchases$items$product.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedOrderResponse$items$purchases$items$productFromJson(
          json);

  final String image;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedOrderResponse$items$purchases$items$productToJson(
          this);
  int get hashCode {
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([l$image, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other
            is Fragment$PaginatedOrderResponse$items$purchases$items$product) ||
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

extension UtilityExtension$Fragment$PaginatedOrderResponse$items$purchases$items$product
    on Fragment$PaginatedOrderResponse$items$purchases$items$product {
  Fragment$PaginatedOrderResponse$items$purchases$items$product copyWith(
          {String? image, String? $__typename}) =>
      Fragment$PaginatedOrderResponse$items$purchases$items$product(
          image: image == null ? this.image : image,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Fragment$Order {
  Fragment$Order(
      {required this.id,
      this.phone,
      required this.orderNumber,
      required this.province,
      required this.address,
      required this.status,
      required this.totalPrice,
      required this.createdAt,
      required this.$__typename});

  @override
  factory Fragment$Order.fromJson(Map<String, dynamic> json) =>
      _$Fragment$OrderFromJson(json);

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

  Map<String, dynamic> toJson() => _$Fragment$OrderToJson(this);
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
    return Object.hashAll([
      l$id,
      l$phone,
      l$orderNumber,
      l$province,
      l$address,
      l$status,
      l$totalPrice,
      l$createdAt,
      l$$__typename
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Fragment$Order) || runtimeType != other.runtimeType)
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
    return true;
  }
}

extension UtilityExtension$Fragment$Order on Fragment$Order {
  Fragment$Order copyWith(
          {String? id,
          String? Function()? phone,
          int? orderNumber,
          String? province,
          String? address,
          Enum$OrderStatus? status,
          double? totalPrice,
          DateTime? createdAt,
          String? $__typename}) =>
      Fragment$Order(
          id: id == null ? this.id : id,
          phone: phone == null ? this.phone : phone(),
          orderNumber: orderNumber == null ? this.orderNumber : orderNumber,
          province: province == null ? this.province : province,
          address: address == null ? this.address : address,
          status: status == null ? this.status : status,
          totalPrice: totalPrice == null ? this.totalPrice : totalPrice,
          createdAt: createdAt == null ? this.createdAt : createdAt,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const fragmentDefinitionOrder = FragmentDefinitionNode(
    name: NameNode(value: 'Order'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(name: NameNode(value: 'Order'), isNonNull: false)),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
          name: NameNode(value: 'id'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'phone'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'orderNumber'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'province'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'address'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'status'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'totalPrice'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'createdAt'),
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
    ]));
const queryDocumentOrder = DocumentNode(definitions: [
  fragmentDefinitionOrder,
]);

extension ClientExtension$Fragment$Order on graphql.GraphQLClient {
  void writeFragment$Order(
          {required Fragment$Order data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'Order', document: queryDocumentOrder)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$Order? readFragment$Order(
      {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'Order', document: queryDocumentOrder)),
        optimistic: optimistic);
    return result == null ? null : Fragment$Order.fromJson(result);
  }
}

@JsonSerializable(explicitToJson: true)
class Fragment$PaginatedPurchaseResponse {
  Fragment$PaginatedPurchaseResponse(
      {required this.items,
      required this.hasMore,
      required this.total,
      required this.$__typename});

  @override
  factory Fragment$PaginatedPurchaseResponse.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedPurchaseResponseFromJson(json);

  final List<Fragment$PaginatedPurchaseResponse$items> items;

  final bool hasMore;

  final int total;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedPurchaseResponseToJson(this);
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
    if (!(other is Fragment$PaginatedPurchaseResponse) ||
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

extension UtilityExtension$Fragment$PaginatedPurchaseResponse
    on Fragment$PaginatedPurchaseResponse {
  Fragment$PaginatedPurchaseResponse copyWith(
          {List<Fragment$PaginatedPurchaseResponse$items>? items,
          bool? hasMore,
          int? total,
          String? $__typename}) =>
      Fragment$PaginatedPurchaseResponse(
          items: items == null ? this.items : items,
          hasMore: hasMore == null ? this.hasMore : hasMore,
          total: total == null ? this.total : total,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const fragmentDefinitionPaginatedPurchaseResponse = FragmentDefinitionNode(
    name: NameNode(value: 'PaginatedPurchaseResponse'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
            name: NameNode(value: 'PaginatedPurchaseResponse'),
            isNonNull: false)),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
          name: NameNode(value: 'items'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FragmentSpreadNode(
                name: NameNode(value: 'Purchase'), directives: []),
            FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null)
          ])),
      FieldNode(
          name: NameNode(value: 'hasMore'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'total'),
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
    ]));
const queryDocumentPaginatedPurchaseResponse = DocumentNode(definitions: [
  fragmentDefinitionPaginatedPurchaseResponse,
  fragmentDefinitionPurchase,
  fragmentDefinitionProduct,
  fragmentDefinitionAuthor,
  fragmentDefinitionCategory,
]);

extension ClientExtension$Fragment$PaginatedPurchaseResponse
    on graphql.GraphQLClient {
  void writeFragment$PaginatedPurchaseResponse(
          {required Fragment$PaginatedPurchaseResponse data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'PaginatedPurchaseResponse',
                  document: queryDocumentPaginatedPurchaseResponse)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$PaginatedPurchaseResponse? readFragment$PaginatedPurchaseResponse(
      {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'PaginatedPurchaseResponse',
                document: queryDocumentPaginatedPurchaseResponse)),
        optimistic: optimistic);
    return result == null
        ? null
        : Fragment$PaginatedPurchaseResponse.fromJson(result);
  }
}

@JsonSerializable(explicitToJson: true)
class Fragment$PaginatedPurchaseResponse$items implements Fragment$Purchase {
  Fragment$PaginatedPurchaseResponse$items(
      {required this.id,
      required this.product,
      required this.quantity,
      required this.$__typename});

  @override
  factory Fragment$PaginatedPurchaseResponse$items.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedPurchaseResponse$itemsFromJson(json);

  final String id;

  final Fragment$PaginatedPurchaseResponse$items$product product;

  final int quantity;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedPurchaseResponse$itemsToJson(this);
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
    if (!(other is Fragment$PaginatedPurchaseResponse$items) ||
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

extension UtilityExtension$Fragment$PaginatedPurchaseResponse$items
    on Fragment$PaginatedPurchaseResponse$items {
  Fragment$PaginatedPurchaseResponse$items copyWith(
          {String? id,
          Fragment$PaginatedPurchaseResponse$items$product? product,
          int? quantity,
          String? $__typename}) =>
      Fragment$PaginatedPurchaseResponse$items(
          id: id == null ? this.id : id,
          product: product == null ? this.product : product,
          quantity: quantity == null ? this.quantity : quantity,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Fragment$PaginatedPurchaseResponse$items$product
    implements Fragment$Purchase$product, Fragment$Product {
  Fragment$PaginatedPurchaseResponse$items$product(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.overview,
      required this.author,
      required this.categories,
      required this.$__typename});

  @override
  factory Fragment$PaginatedPurchaseResponse$items$product.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedPurchaseResponse$items$productFromJson(json);

  final String id;

  final String name;

  final double price;

  final String image;

  final String overview;

  final Fragment$PaginatedPurchaseResponse$items$product$author author;

  final List<Fragment$PaginatedPurchaseResponse$items$product$categories>
      categories;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedPurchaseResponse$items$productToJson(this);
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
    if (!(other is Fragment$PaginatedPurchaseResponse$items$product) ||
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

extension UtilityExtension$Fragment$PaginatedPurchaseResponse$items$product
    on Fragment$PaginatedPurchaseResponse$items$product {
  Fragment$PaginatedPurchaseResponse$items$product copyWith(
          {String? id,
          String? name,
          double? price,
          String? image,
          String? overview,
          Fragment$PaginatedPurchaseResponse$items$product$author? author,
          List<Fragment$PaginatedPurchaseResponse$items$product$categories>?
              categories,
          String? $__typename}) =>
      Fragment$PaginatedPurchaseResponse$items$product(
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
class Fragment$PaginatedPurchaseResponse$items$product$author
    implements
        Fragment$Purchase$product$author,
        Fragment$Product$author,
        Fragment$Author {
  Fragment$PaginatedPurchaseResponse$items$product$author(
      {required this.id,
      required this.name,
      required this.image,
      required this.overview,
      required this.$__typename});

  @override
  factory Fragment$PaginatedPurchaseResponse$items$product$author.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedPurchaseResponse$items$product$authorFromJson(json);

  final String id;

  final String name;

  final String image;

  final String overview;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedPurchaseResponse$items$product$authorToJson(this);
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
    if (!(other is Fragment$PaginatedPurchaseResponse$items$product$author) ||
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

extension UtilityExtension$Fragment$PaginatedPurchaseResponse$items$product$author
    on Fragment$PaginatedPurchaseResponse$items$product$author {
  Fragment$PaginatedPurchaseResponse$items$product$author copyWith(
          {String? id,
          String? name,
          String? image,
          String? overview,
          String? $__typename}) =>
      Fragment$PaginatedPurchaseResponse$items$product$author(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          image: image == null ? this.image : image,
          overview: overview == null ? this.overview : overview,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Fragment$PaginatedPurchaseResponse$items$product$categories
    implements
        Fragment$Purchase$product$categories,
        Fragment$Product$categories,
        Fragment$Category {
  Fragment$PaginatedPurchaseResponse$items$product$categories(
      {required this.id, required this.name, required this.$__typename});

  @override
  factory Fragment$PaginatedPurchaseResponse$items$product$categories.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedPurchaseResponse$items$product$categoriesFromJson(
          json);

  final String id;

  final String name;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedPurchaseResponse$items$product$categoriesToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other
            is Fragment$PaginatedPurchaseResponse$items$product$categories) ||
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

extension UtilityExtension$Fragment$PaginatedPurchaseResponse$items$product$categories
    on Fragment$PaginatedPurchaseResponse$items$product$categories {
  Fragment$PaginatedPurchaseResponse$items$product$categories copyWith(
          {String? id, String? name, String? $__typename}) =>
      Fragment$PaginatedPurchaseResponse$items$product$categories(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Fragment$Purchase {
  Fragment$Purchase(
      {required this.id,
      required this.product,
      required this.quantity,
      required this.$__typename});

  @override
  factory Fragment$Purchase.fromJson(Map<String, dynamic> json) =>
      _$Fragment$PurchaseFromJson(json);

  final String id;

  final Fragment$Purchase$product product;

  final int quantity;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Fragment$PurchaseToJson(this);
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
    if (!(other is Fragment$Purchase) || runtimeType != other.runtimeType)
      return false;
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

extension UtilityExtension$Fragment$Purchase on Fragment$Purchase {
  Fragment$Purchase copyWith(
          {String? id,
          Fragment$Purchase$product? product,
          int? quantity,
          String? $__typename}) =>
      Fragment$Purchase(
          id: id == null ? this.id : id,
          product: product == null ? this.product : product,
          quantity: quantity == null ? this.quantity : quantity,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const fragmentDefinitionPurchase = FragmentDefinitionNode(
    name: NameNode(value: 'Purchase'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(name: NameNode(value: 'Purchase'), isNonNull: false)),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
          name: NameNode(value: 'id'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'product'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FragmentSpreadNode(
                name: NameNode(value: 'Product'), directives: []),
            FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null)
          ])),
      FieldNode(
          name: NameNode(value: 'quantity'),
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
    ]));
const queryDocumentPurchase = DocumentNode(definitions: [
  fragmentDefinitionPurchase,
  fragmentDefinitionProduct,
  fragmentDefinitionAuthor,
  fragmentDefinitionCategory,
]);

extension ClientExtension$Fragment$Purchase on graphql.GraphQLClient {
  void writeFragment$Purchase(
          {required Fragment$Purchase data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'Purchase', document: queryDocumentPurchase)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$Purchase? readFragment$Purchase(
      {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'Purchase', document: queryDocumentPurchase)),
        optimistic: optimistic);
    return result == null ? null : Fragment$Purchase.fromJson(result);
  }
}

@JsonSerializable(explicitToJson: true)
class Fragment$Purchase$product implements Fragment$Product {
  Fragment$Purchase$product(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.overview,
      required this.author,
      required this.categories,
      required this.$__typename});

  @override
  factory Fragment$Purchase$product.fromJson(Map<String, dynamic> json) =>
      _$Fragment$Purchase$productFromJson(json);

  final String id;

  final String name;

  final double price;

  final String image;

  final String overview;

  final Fragment$Purchase$product$author author;

  final List<Fragment$Purchase$product$categories> categories;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Fragment$Purchase$productToJson(this);
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
    if (!(other is Fragment$Purchase$product) ||
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

extension UtilityExtension$Fragment$Purchase$product
    on Fragment$Purchase$product {
  Fragment$Purchase$product copyWith(
          {String? id,
          String? name,
          double? price,
          String? image,
          String? overview,
          Fragment$Purchase$product$author? author,
          List<Fragment$Purchase$product$categories>? categories,
          String? $__typename}) =>
      Fragment$Purchase$product(
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
class Fragment$Purchase$product$author
    implements Fragment$Product$author, Fragment$Author {
  Fragment$Purchase$product$author(
      {required this.id,
      required this.name,
      required this.image,
      required this.overview,
      required this.$__typename});

  @override
  factory Fragment$Purchase$product$author.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$Purchase$product$authorFromJson(json);

  final String id;

  final String name;

  final String image;

  final String overview;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$Purchase$product$authorToJson(this);
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
    if (!(other is Fragment$Purchase$product$author) ||
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

extension UtilityExtension$Fragment$Purchase$product$author
    on Fragment$Purchase$product$author {
  Fragment$Purchase$product$author copyWith(
          {String? id,
          String? name,
          String? image,
          String? overview,
          String? $__typename}) =>
      Fragment$Purchase$product$author(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          image: image == null ? this.image : image,
          overview: overview == null ? this.overview : overview,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Fragment$Purchase$product$categories
    implements Fragment$Product$categories, Fragment$Category {
  Fragment$Purchase$product$categories(
      {required this.id, required this.name, required this.$__typename});

  @override
  factory Fragment$Purchase$product$categories.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$Purchase$product$categoriesFromJson(json);

  final String id;

  final String name;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$Purchase$product$categoriesToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Fragment$Purchase$product$categories) ||
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

extension UtilityExtension$Fragment$Purchase$product$categories
    on Fragment$Purchase$product$categories {
  Fragment$Purchase$product$categories copyWith(
          {String? id, String? name, String? $__typename}) =>
      Fragment$Purchase$product$categories(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
