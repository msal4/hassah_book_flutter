import '../schema.graphql.dart';
import 'author.fragment.graphql.dart';
import 'category.fragment.graphql.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:hassah_book_flutter/common/utils/coercers.dart';
import 'package:json_annotation/json_annotation.dart';
import 'product.fragment.graphql.dart';
part 'product_detail.query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Variables$Query$ProductDetail {
  Variables$Query$ProductDetail({required this.id});

  @override
  factory Variables$Query$ProductDetail.fromJson(Map<String, dynamic> json) =>
      _$Variables$Query$ProductDetailFromJson(json);

  final String id;

  Map<String, dynamic> toJson() => _$Variables$Query$ProductDetailToJson(this);
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Variables$Query$ProductDetail) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Query$ProductDetail {
  Query$ProductDetail({this.product, required this.$__typename});

  @override
  factory Query$ProductDetail.fromJson(Map<String, dynamic> json) =>
      _$Query$ProductDetailFromJson(json);

  final Query$ProductDetail$product? product;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$ProductDetailToJson(this);
  int get hashCode {
    final l$product = product;
    final l$$__typename = $__typename;
    return Object.hashAll([l$product, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$ProductDetail) || runtimeType != other.runtimeType)
      return false;
    final l$product = product;
    final lOther$product = other.product;
    if (l$product != lOther$product) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$ProductDetail on Query$ProductDetail {
  Query$ProductDetail copyWith(
          {Query$ProductDetail$product? Function()? product,
          String? $__typename}) =>
      Query$ProductDetail(
          product: product == null ? this.product : product(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const queryDocumentProductDetail = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'ProductDetail'),
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
            name: NameNode(value: 'product'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'id'),
                  value: VariableNode(name: NameNode(value: 'id')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                  name: NameNode(value: 'ProductDetail'), directives: []),
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
  fragmentDefinitionProductDetail,
  fragmentDefinitionProduct,
  fragmentDefinitionAuthor,
  fragmentDefinitionCategory,
]);
Query$ProductDetail _parserFn$Query$ProductDetail(Map<String, dynamic> data) =>
    Query$ProductDetail.fromJson(data);

class Options$Query$ProductDetail
    extends graphql.QueryOptions<Query$ProductDetail> {
  Options$Query$ProductDetail(
      {String? operationName,
      required Variables$Query$ProductDetail variables,
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
            document: queryDocumentProductDetail,
            parserFn: _parserFn$Query$ProductDetail);
}

class WatchOptions$Query$ProductDetail
    extends graphql.WatchQueryOptions<Query$ProductDetail> {
  WatchOptions$Query$ProductDetail(
      {String? operationName,
      required Variables$Query$ProductDetail variables,
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
            document: queryDocumentProductDetail,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Query$ProductDetail);
}

class FetchMoreOptions$Query$ProductDetail extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$ProductDetail(
      {required graphql.UpdateQuery updateQuery,
      required Variables$Query$ProductDetail variables})
      : super(
            updateQuery: updateQuery,
            variables: variables.toJson(),
            document: queryDocumentProductDetail);
}

extension ClientExtension$Query$ProductDetail on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$ProductDetail>> query$ProductDetail(
          Options$Query$ProductDetail options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$ProductDetail> watchQuery$ProductDetail(
          WatchOptions$Query$ProductDetail options) =>
      this.watchQuery(options);
  void writeQuery$ProductDetail(
          {required Query$ProductDetail data,
          required Variables$Query$ProductDetail variables,
          bool broadcast = true}) =>
      this.writeQuery(
          graphql.Request(
              operation:
                  graphql.Operation(document: queryDocumentProductDetail),
              variables: variables.toJson()),
          data: data.toJson(),
          broadcast: broadcast);
  Query$ProductDetail? readQuery$ProductDetail(
      {required Variables$Query$ProductDetail variables,
      bool optimistic = true}) {
    final result = this.readQuery(
        graphql.Request(
            operation: graphql.Operation(document: queryDocumentProductDetail),
            variables: variables.toJson()),
        optimistic: optimistic);
    return result == null ? null : Query$ProductDetail.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$ProductDetail> useQuery$ProductDetail(
        Options$Query$ProductDetail options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$ProductDetail> useWatchQuery$ProductDetail(
        WatchOptions$Query$ProductDetail options) =>
    graphql_flutter.useWatchQuery(options);

class Query$ProductDetail$Widget
    extends graphql_flutter.Query<Query$ProductDetail> {
  Query$ProductDetail$Widget(
      {widgets.Key? key,
      required Options$Query$ProductDetail options,
      required graphql_flutter.QueryBuilder<Query$ProductDetail> builder})
      : super(key: key, options: options, builder: builder);
}

@JsonSerializable(explicitToJson: true)
class Query$ProductDetail$product
    implements Fragment$ProductDetail, Fragment$Product {
  Query$ProductDetail$product(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.overview,
      required this.author,
      required this.categories,
      required this.$__typename,
      required this.isFavorite,
      required this.language,
      required this.status,
      this.pages,
      required this.publishedAt});

  @override
  factory Query$ProductDetail$product.fromJson(Map<String, dynamic> json) =>
      _$Query$ProductDetail$productFromJson(json);

  final String id;

  final String name;

  final double price;

  final String image;

  final String overview;

  final Query$ProductDetail$product$author author;

  final List<Query$ProductDetail$product$categories> categories;

  @JsonKey(name: '__typename')
  final String $__typename;

  final bool isFavorite;

  final String language;

  @JsonKey(unknownEnumValue: Enum$ProductStatus.$unknown)
  final Enum$ProductStatus status;

  final int? pages;

  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime publishedAt;

  Map<String, dynamic> toJson() => _$Query$ProductDetail$productToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$price = price;
    final l$image = image;
    final l$overview = overview;
    final l$author = author;
    final l$categories = categories;
    final l$$__typename = $__typename;
    final l$isFavorite = isFavorite;
    final l$language = language;
    final l$status = status;
    final l$pages = pages;
    final l$publishedAt = publishedAt;
    return Object.hashAll([
      l$id,
      l$name,
      l$price,
      l$image,
      l$overview,
      l$author,
      Object.hashAll(l$categories.map((v) => v)),
      l$$__typename,
      l$isFavorite,
      l$language,
      l$status,
      l$pages,
      l$publishedAt
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$ProductDetail$product) ||
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
    final l$isFavorite = isFavorite;
    final lOther$isFavorite = other.isFavorite;
    if (l$isFavorite != lOther$isFavorite) return false;
    final l$language = language;
    final lOther$language = other.language;
    if (l$language != lOther$language) return false;
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) return false;
    final l$pages = pages;
    final lOther$pages = other.pages;
    if (l$pages != lOther$pages) return false;
    final l$publishedAt = publishedAt;
    final lOther$publishedAt = other.publishedAt;
    if (l$publishedAt != lOther$publishedAt) return false;
    return true;
  }
}

extension UtilityExtension$Query$ProductDetail$product
    on Query$ProductDetail$product {
  Query$ProductDetail$product copyWith(
          {String? id,
          String? name,
          double? price,
          String? image,
          String? overview,
          Query$ProductDetail$product$author? author,
          List<Query$ProductDetail$product$categories>? categories,
          String? $__typename,
          bool? isFavorite,
          String? language,
          Enum$ProductStatus? status,
          int? Function()? pages,
          DateTime? publishedAt}) =>
      Query$ProductDetail$product(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          price: price == null ? this.price : price,
          image: image == null ? this.image : image,
          overview: overview == null ? this.overview : overview,
          author: author == null ? this.author : author,
          categories: categories == null ? this.categories : categories,
          $__typename: $__typename == null ? this.$__typename : $__typename,
          isFavorite: isFavorite == null ? this.isFavorite : isFavorite,
          language: language == null ? this.language : language,
          status: status == null ? this.status : status,
          pages: pages == null ? this.pages : pages(),
          publishedAt: publishedAt == null ? this.publishedAt : publishedAt);
}

@JsonSerializable(explicitToJson: true)
class Query$ProductDetail$product$author
    implements
        Fragment$ProductDetail$author,
        Fragment$Product$author,
        Fragment$Author {
  Query$ProductDetail$product$author(
      {required this.id,
      required this.name,
      required this.image,
      required this.overview,
      required this.$__typename});

  @override
  factory Query$ProductDetail$product$author.fromJson(
          Map<String, dynamic> json) =>
      _$Query$ProductDetail$product$authorFromJson(json);

  final String id;

  final String name;

  final String image;

  final String overview;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$ProductDetail$product$authorToJson(this);
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
    if (!(other is Query$ProductDetail$product$author) ||
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

extension UtilityExtension$Query$ProductDetail$product$author
    on Query$ProductDetail$product$author {
  Query$ProductDetail$product$author copyWith(
          {String? id,
          String? name,
          String? image,
          String? overview,
          String? $__typename}) =>
      Query$ProductDetail$product$author(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          image: image == null ? this.image : image,
          overview: overview == null ? this.overview : overview,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$ProductDetail$product$categories
    implements
        Fragment$ProductDetail$categories,
        Fragment$Product$categories,
        Fragment$Category {
  Query$ProductDetail$product$categories(
      {required this.id, required this.name, required this.$__typename});

  @override
  factory Query$ProductDetail$product$categories.fromJson(
          Map<String, dynamic> json) =>
      _$Query$ProductDetail$product$categoriesFromJson(json);

  final String id;

  final String name;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$ProductDetail$product$categoriesToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$ProductDetail$product$categories) ||
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

extension UtilityExtension$Query$ProductDetail$product$categories
    on Query$ProductDetail$product$categories {
  Query$ProductDetail$product$categories copyWith(
          {String? id, String? name, String? $__typename}) =>
      Query$ProductDetail$product$categories(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
