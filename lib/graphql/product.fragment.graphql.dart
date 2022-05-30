import '../schema.graphql.dart';
import 'author.fragment.graphql.dart';
import 'category.fragment.graphql.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:hassah_book_flutter/common/utils/coercers.dart';
import 'package:json_annotation/json_annotation.dart';
import 'product_detail.query.graphql.dart';
part 'product.fragment.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Fragment$Product {
  Fragment$Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.overview,
      required this.author,
      required this.categories,
      required this.$__typename});

  @override
  factory Fragment$Product.fromJson(Map<String, dynamic> json) =>
      _$Fragment$ProductFromJson(json);

  final String id;

  final String name;

  final double price;

  final String image;

  final String overview;

  final Fragment$Product$author author;

  final List<Fragment$Product$categories> categories;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Fragment$ProductToJson(this);
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
    if (!(other is Fragment$Product) || runtimeType != other.runtimeType)
      return false;
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

extension UtilityExtension$Fragment$Product on Fragment$Product {
  Fragment$Product copyWith(
          {String? id,
          String? name,
          double? price,
          String? image,
          String? overview,
          Fragment$Product$author? author,
          List<Fragment$Product$categories>? categories,
          String? $__typename}) =>
      Fragment$Product(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          price: price == null ? this.price : price,
          image: image == null ? this.image : image,
          overview: overview == null ? this.overview : overview,
          author: author == null ? this.author : author,
          categories: categories == null ? this.categories : categories,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const fragmentDefinitionProduct = FragmentDefinitionNode(
    name: NameNode(value: 'Product'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(name: NameNode(value: 'Product'), isNonNull: false)),
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
          name: NameNode(value: 'price'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'image'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'overview'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'author'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FragmentSpreadNode(name: NameNode(value: 'Author'), directives: []),
            FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null)
          ])),
      FieldNode(
          name: NameNode(value: 'categories'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FragmentSpreadNode(
                name: NameNode(value: 'Category'), directives: []),
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
    ]));
const queryDocumentProduct = DocumentNode(definitions: [
  fragmentDefinitionProduct,
  fragmentDefinitionAuthor,
  fragmentDefinitionCategory,
]);

extension ClientExtension$Fragment$Product on graphql.GraphQLClient {
  void writeFragment$Product(
          {required Fragment$Product data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'Product', document: queryDocumentProduct)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$Product? readFragment$Product(
      {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'Product', document: queryDocumentProduct)),
        optimistic: optimistic);
    return result == null ? null : Fragment$Product.fromJson(result);
  }
}

@JsonSerializable(explicitToJson: true)
class Fragment$Product$author implements Fragment$Author {
  Fragment$Product$author(
      {required this.id,
      required this.name,
      required this.image,
      required this.overview,
      required this.$__typename});

  @override
  factory Fragment$Product$author.fromJson(Map<String, dynamic> json) =>
      _$Fragment$Product$authorFromJson(json);

  final String id;

  final String name;

  final String image;

  final String overview;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Fragment$Product$authorToJson(this);
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
    if (!(other is Fragment$Product$author) || runtimeType != other.runtimeType)
      return false;
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

extension UtilityExtension$Fragment$Product$author on Fragment$Product$author {
  Fragment$Product$author copyWith(
          {String? id,
          String? name,
          String? image,
          String? overview,
          String? $__typename}) =>
      Fragment$Product$author(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          image: image == null ? this.image : image,
          overview: overview == null ? this.overview : overview,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Fragment$Product$categories implements Fragment$Category {
  Fragment$Product$categories(
      {required this.id, required this.name, required this.$__typename});

  @override
  factory Fragment$Product$categories.fromJson(Map<String, dynamic> json) =>
      _$Fragment$Product$categoriesFromJson(json);

  final String id;

  final String name;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Fragment$Product$categoriesToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Fragment$Product$categories) ||
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

extension UtilityExtension$Fragment$Product$categories
    on Fragment$Product$categories {
  Fragment$Product$categories copyWith(
          {String? id, String? name, String? $__typename}) =>
      Fragment$Product$categories(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Fragment$ProductDetail implements Fragment$Product {
  Fragment$ProductDetail(
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
  factory Fragment$ProductDetail.fromJson(Map<String, dynamic> json) =>
      _$Fragment$ProductDetailFromJson(json);

  final String id;

  final String name;

  final double price;

  final String image;

  final String overview;

  final Fragment$ProductDetail$author author;

  final List<Fragment$ProductDetail$categories> categories;

  @JsonKey(name: '__typename')
  final String $__typename;

  final bool isFavorite;

  final String language;

  @JsonKey(unknownEnumValue: Enum$ProductStatus.$unknown)
  final Enum$ProductStatus status;

  final int? pages;

  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime publishedAt;

  Map<String, dynamic> toJson() => _$Fragment$ProductDetailToJson(this);
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
    if (!(other is Fragment$ProductDetail) || runtimeType != other.runtimeType)
      return false;
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

extension UtilityExtension$Fragment$ProductDetail on Fragment$ProductDetail {
  Fragment$ProductDetail copyWith(
          {String? id,
          String? name,
          double? price,
          String? image,
          String? overview,
          Fragment$ProductDetail$author? author,
          List<Fragment$ProductDetail$categories>? categories,
          String? $__typename,
          bool? isFavorite,
          String? language,
          Enum$ProductStatus? status,
          int? Function()? pages,
          DateTime? publishedAt}) =>
      Fragment$ProductDetail(
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

const fragmentDefinitionProductDetail = FragmentDefinitionNode(
    name: NameNode(value: 'ProductDetail'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(name: NameNode(value: 'Product'), isNonNull: false)),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FragmentSpreadNode(name: NameNode(value: 'Product'), directives: []),
      FieldNode(
          name: NameNode(value: 'isFavorite'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'language'),
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
          name: NameNode(value: 'pages'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'publishedAt'),
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
const queryDocumentProductDetail = DocumentNode(definitions: [
  fragmentDefinitionProductDetail,
  fragmentDefinitionProduct,
  fragmentDefinitionAuthor,
  fragmentDefinitionCategory,
]);

extension ClientExtension$Fragment$ProductDetail on graphql.GraphQLClient {
  void writeFragment$ProductDetail(
          {required Fragment$ProductDetail data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'ProductDetail',
                  document: queryDocumentProductDetail)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$ProductDetail? readFragment$ProductDetail(
      {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'ProductDetail',
                document: queryDocumentProductDetail)),
        optimistic: optimistic);
    return result == null ? null : Fragment$ProductDetail.fromJson(result);
  }
}

@JsonSerializable(explicitToJson: true)
class Fragment$ProductDetail$author
    implements Fragment$Product$author, Fragment$Author {
  Fragment$ProductDetail$author(
      {required this.id,
      required this.name,
      required this.image,
      required this.overview,
      required this.$__typename});

  @override
  factory Fragment$ProductDetail$author.fromJson(Map<String, dynamic> json) =>
      _$Fragment$ProductDetail$authorFromJson(json);

  final String id;

  final String name;

  final String image;

  final String overview;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Fragment$ProductDetail$authorToJson(this);
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
    if (!(other is Fragment$ProductDetail$author) ||
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

extension UtilityExtension$Fragment$ProductDetail$author
    on Fragment$ProductDetail$author {
  Fragment$ProductDetail$author copyWith(
          {String? id,
          String? name,
          String? image,
          String? overview,
          String? $__typename}) =>
      Fragment$ProductDetail$author(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          image: image == null ? this.image : image,
          overview: overview == null ? this.overview : overview,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Fragment$ProductDetail$categories
    implements Fragment$Product$categories, Fragment$Category {
  Fragment$ProductDetail$categories(
      {required this.id, required this.name, required this.$__typename});

  @override
  factory Fragment$ProductDetail$categories.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$ProductDetail$categoriesFromJson(json);

  final String id;

  final String name;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$ProductDetail$categoriesToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Fragment$ProductDetail$categories) ||
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

extension UtilityExtension$Fragment$ProductDetail$categories
    on Fragment$ProductDetail$categories {
  Fragment$ProductDetail$categories copyWith(
          {String? id, String? name, String? $__typename}) =>
      Fragment$ProductDetail$categories(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Fragment$PaginatedProductResponse {
  Fragment$PaginatedProductResponse(
      {required this.items,
      required this.hasMore,
      required this.total,
      required this.$__typename});

  @override
  factory Fragment$PaginatedProductResponse.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedProductResponseFromJson(json);

  final List<Fragment$PaginatedProductResponse$items> items;

  final bool hasMore;

  final int total;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedProductResponseToJson(this);
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
    if (!(other is Fragment$PaginatedProductResponse) ||
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

extension UtilityExtension$Fragment$PaginatedProductResponse
    on Fragment$PaginatedProductResponse {
  Fragment$PaginatedProductResponse copyWith(
          {List<Fragment$PaginatedProductResponse$items>? items,
          bool? hasMore,
          int? total,
          String? $__typename}) =>
      Fragment$PaginatedProductResponse(
          items: items == null ? this.items : items,
          hasMore: hasMore == null ? this.hasMore : hasMore,
          total: total == null ? this.total : total,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const fragmentDefinitionPaginatedProductResponse = FragmentDefinitionNode(
    name: NameNode(value: 'PaginatedProductResponse'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
            name: NameNode(value: 'PaginatedProductResponse'),
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
                name: NameNode(value: 'Product'), directives: []),
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
const queryDocumentPaginatedProductResponse = DocumentNode(definitions: [
  fragmentDefinitionPaginatedProductResponse,
  fragmentDefinitionProduct,
  fragmentDefinitionAuthor,
  fragmentDefinitionCategory,
]);

extension ClientExtension$Fragment$PaginatedProductResponse
    on graphql.GraphQLClient {
  void writeFragment$PaginatedProductResponse(
          {required Fragment$PaginatedProductResponse data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'PaginatedProductResponse',
                  document: queryDocumentPaginatedProductResponse)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$PaginatedProductResponse? readFragment$PaginatedProductResponse(
      {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'PaginatedProductResponse',
                document: queryDocumentPaginatedProductResponse)),
        optimistic: optimistic);
    return result == null
        ? null
        : Fragment$PaginatedProductResponse.fromJson(result);
  }
}

@JsonSerializable(explicitToJson: true)
class Fragment$PaginatedProductResponse$items implements Fragment$Product {
  Fragment$PaginatedProductResponse$items(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.overview,
      required this.author,
      required this.categories,
      required this.$__typename});

  @override
  factory Fragment$PaginatedProductResponse$items.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedProductResponse$itemsFromJson(json);

  final String id;

  final String name;

  final double price;

  final String image;

  final String overview;

  final Fragment$PaginatedProductResponse$items$author author;

  final List<Fragment$PaginatedProductResponse$items$categories> categories;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedProductResponse$itemsToJson(this);
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
    if (!(other is Fragment$PaginatedProductResponse$items) ||
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

extension UtilityExtension$Fragment$PaginatedProductResponse$items
    on Fragment$PaginatedProductResponse$items {
  Fragment$PaginatedProductResponse$items copyWith(
          {String? id,
          String? name,
          double? price,
          String? image,
          String? overview,
          Fragment$PaginatedProductResponse$items$author? author,
          List<Fragment$PaginatedProductResponse$items$categories>? categories,
          String? $__typename}) =>
      Fragment$PaginatedProductResponse$items(
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
class Fragment$PaginatedProductResponse$items$author
    implements Fragment$Product$author, Fragment$Author {
  Fragment$PaginatedProductResponse$items$author(
      {required this.id,
      required this.name,
      required this.image,
      required this.overview,
      required this.$__typename});

  @override
  factory Fragment$PaginatedProductResponse$items$author.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedProductResponse$items$authorFromJson(json);

  final String id;

  final String name;

  final String image;

  final String overview;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedProductResponse$items$authorToJson(this);
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
    if (!(other is Fragment$PaginatedProductResponse$items$author) ||
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

extension UtilityExtension$Fragment$PaginatedProductResponse$items$author
    on Fragment$PaginatedProductResponse$items$author {
  Fragment$PaginatedProductResponse$items$author copyWith(
          {String? id,
          String? name,
          String? image,
          String? overview,
          String? $__typename}) =>
      Fragment$PaginatedProductResponse$items$author(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          image: image == null ? this.image : image,
          overview: overview == null ? this.overview : overview,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Fragment$PaginatedProductResponse$items$categories
    implements Fragment$Product$categories, Fragment$Category {
  Fragment$PaginatedProductResponse$items$categories(
      {required this.id, required this.name, required this.$__typename});

  @override
  factory Fragment$PaginatedProductResponse$items$categories.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedProductResponse$items$categoriesFromJson(json);

  final String id;

  final String name;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedProductResponse$items$categoriesToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Fragment$PaginatedProductResponse$items$categories) ||
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

extension UtilityExtension$Fragment$PaginatedProductResponse$items$categories
    on Fragment$PaginatedProductResponse$items$categories {
  Fragment$PaginatedProductResponse$items$categories copyWith(
          {String? id, String? name, String? $__typename}) =>
      Fragment$PaginatedProductResponse$items$categories(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
