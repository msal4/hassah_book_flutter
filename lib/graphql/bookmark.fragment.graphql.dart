import 'author.fragment.graphql.dart';
import 'category.fragment.graphql.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:hassah_book_flutter/common/utils/coercers.dart';
import 'package:json_annotation/json_annotation.dart';
import 'product.fragment.graphql.dart';
part 'bookmark.fragment.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Fragment$Bookmark {
  Fragment$Bookmark(
      {required this.id,
      required this.product,
      required this.createdAt,
      required this.$__typename});

  @override
  factory Fragment$Bookmark.fromJson(Map<String, dynamic> json) =>
      _$Fragment$BookmarkFromJson(json);

  final String id;

  final Fragment$Bookmark$product product;

  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime createdAt;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Fragment$BookmarkToJson(this);
  int get hashCode {
    final l$id = id;
    final l$product = product;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$product, l$createdAt, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Fragment$Bookmark) || runtimeType != other.runtimeType)
      return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$product = product;
    final lOther$product = other.product;
    if (l$product != lOther$product) return false;
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Fragment$Bookmark on Fragment$Bookmark {
  Fragment$Bookmark copyWith(
          {String? id,
          Fragment$Bookmark$product? product,
          DateTime? createdAt,
          String? $__typename}) =>
      Fragment$Bookmark(
          id: id == null ? this.id : id,
          product: product == null ? this.product : product,
          createdAt: createdAt == null ? this.createdAt : createdAt,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const fragmentDefinitionBookmark = FragmentDefinitionNode(
    name: NameNode(value: 'Bookmark'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(name: NameNode(value: 'Favorite'), isNonNull: false)),
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
const queryDocumentBookmark = DocumentNode(definitions: [
  fragmentDefinitionBookmark,
  fragmentDefinitionProduct,
  fragmentDefinitionAuthor,
  fragmentDefinitionCategory,
]);

extension ClientExtension$Fragment$Bookmark on graphql.GraphQLClient {
  void writeFragment$Bookmark(
          {required Fragment$Bookmark data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'Bookmark', document: queryDocumentBookmark)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$Bookmark? readFragment$Bookmark(
      {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'Bookmark', document: queryDocumentBookmark)),
        optimistic: optimistic);
    return result == null ? null : Fragment$Bookmark.fromJson(result);
  }
}

@JsonSerializable(explicitToJson: true)
class Fragment$Bookmark$product implements Fragment$Product {
  Fragment$Bookmark$product(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.overview,
      required this.author,
      required this.categories,
      required this.$__typename});

  @override
  factory Fragment$Bookmark$product.fromJson(Map<String, dynamic> json) =>
      _$Fragment$Bookmark$productFromJson(json);

  final String id;

  final String name;

  final double price;

  final String image;

  final String overview;

  final Fragment$Bookmark$product$author author;

  final List<Fragment$Bookmark$product$categories> categories;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Fragment$Bookmark$productToJson(this);
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
    if (!(other is Fragment$Bookmark$product) ||
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

extension UtilityExtension$Fragment$Bookmark$product
    on Fragment$Bookmark$product {
  Fragment$Bookmark$product copyWith(
          {String? id,
          String? name,
          double? price,
          String? image,
          String? overview,
          Fragment$Bookmark$product$author? author,
          List<Fragment$Bookmark$product$categories>? categories,
          String? $__typename}) =>
      Fragment$Bookmark$product(
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
class Fragment$Bookmark$product$author
    implements Fragment$Product$author, Fragment$Author {
  Fragment$Bookmark$product$author(
      {required this.id,
      required this.name,
      required this.image,
      required this.overview,
      required this.$__typename});

  @override
  factory Fragment$Bookmark$product$author.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$Bookmark$product$authorFromJson(json);

  final String id;

  final String name;

  final String image;

  final String overview;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$Bookmark$product$authorToJson(this);
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
    if (!(other is Fragment$Bookmark$product$author) ||
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

extension UtilityExtension$Fragment$Bookmark$product$author
    on Fragment$Bookmark$product$author {
  Fragment$Bookmark$product$author copyWith(
          {String? id,
          String? name,
          String? image,
          String? overview,
          String? $__typename}) =>
      Fragment$Bookmark$product$author(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          image: image == null ? this.image : image,
          overview: overview == null ? this.overview : overview,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Fragment$Bookmark$product$categories
    implements Fragment$Product$categories, Fragment$Category {
  Fragment$Bookmark$product$categories(
      {required this.id, required this.name, required this.$__typename});

  @override
  factory Fragment$Bookmark$product$categories.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$Bookmark$product$categoriesFromJson(json);

  final String id;

  final String name;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$Bookmark$product$categoriesToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Fragment$Bookmark$product$categories) ||
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

extension UtilityExtension$Fragment$Bookmark$product$categories
    on Fragment$Bookmark$product$categories {
  Fragment$Bookmark$product$categories copyWith(
          {String? id, String? name, String? $__typename}) =>
      Fragment$Bookmark$product$categories(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Fragment$PaginatedBookmarkResponse {
  Fragment$PaginatedBookmarkResponse(
      {required this.items,
      required this.hasMore,
      required this.total,
      required this.$__typename});

  @override
  factory Fragment$PaginatedBookmarkResponse.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedBookmarkResponseFromJson(json);

  final List<Fragment$PaginatedBookmarkResponse$items> items;

  final bool hasMore;

  final int total;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedBookmarkResponseToJson(this);
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
    if (!(other is Fragment$PaginatedBookmarkResponse) ||
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

extension UtilityExtension$Fragment$PaginatedBookmarkResponse
    on Fragment$PaginatedBookmarkResponse {
  Fragment$PaginatedBookmarkResponse copyWith(
          {List<Fragment$PaginatedBookmarkResponse$items>? items,
          bool? hasMore,
          int? total,
          String? $__typename}) =>
      Fragment$PaginatedBookmarkResponse(
          items: items == null ? this.items : items,
          hasMore: hasMore == null ? this.hasMore : hasMore,
          total: total == null ? this.total : total,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const fragmentDefinitionPaginatedBookmarkResponse = FragmentDefinitionNode(
    name: NameNode(value: 'PaginatedBookmarkResponse'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
            name: NameNode(value: 'PaginatedFavoriteResponse'),
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
                name: NameNode(value: 'Bookmark'), directives: []),
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
const queryDocumentPaginatedBookmarkResponse = DocumentNode(definitions: [
  fragmentDefinitionPaginatedBookmarkResponse,
  fragmentDefinitionBookmark,
  fragmentDefinitionProduct,
  fragmentDefinitionAuthor,
  fragmentDefinitionCategory,
]);

extension ClientExtension$Fragment$PaginatedBookmarkResponse
    on graphql.GraphQLClient {
  void writeFragment$PaginatedBookmarkResponse(
          {required Fragment$PaginatedBookmarkResponse data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'PaginatedBookmarkResponse',
                  document: queryDocumentPaginatedBookmarkResponse)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$PaginatedBookmarkResponse? readFragment$PaginatedBookmarkResponse(
      {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'PaginatedBookmarkResponse',
                document: queryDocumentPaginatedBookmarkResponse)),
        optimistic: optimistic);
    return result == null
        ? null
        : Fragment$PaginatedBookmarkResponse.fromJson(result);
  }
}

@JsonSerializable(explicitToJson: true)
class Fragment$PaginatedBookmarkResponse$items implements Fragment$Bookmark {
  Fragment$PaginatedBookmarkResponse$items(
      {required this.id,
      required this.product,
      required this.createdAt,
      required this.$__typename});

  @override
  factory Fragment$PaginatedBookmarkResponse$items.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedBookmarkResponse$itemsFromJson(json);

  final String id;

  final Fragment$PaginatedBookmarkResponse$items$product product;

  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime createdAt;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedBookmarkResponse$itemsToJson(this);
  int get hashCode {
    final l$id = id;
    final l$product = product;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$product, l$createdAt, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Fragment$PaginatedBookmarkResponse$items) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$product = product;
    final lOther$product = other.product;
    if (l$product != lOther$product) return false;
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Fragment$PaginatedBookmarkResponse$items
    on Fragment$PaginatedBookmarkResponse$items {
  Fragment$PaginatedBookmarkResponse$items copyWith(
          {String? id,
          Fragment$PaginatedBookmarkResponse$items$product? product,
          DateTime? createdAt,
          String? $__typename}) =>
      Fragment$PaginatedBookmarkResponse$items(
          id: id == null ? this.id : id,
          product: product == null ? this.product : product,
          createdAt: createdAt == null ? this.createdAt : createdAt,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Fragment$PaginatedBookmarkResponse$items$product
    implements Fragment$Bookmark$product, Fragment$Product {
  Fragment$PaginatedBookmarkResponse$items$product(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.overview,
      required this.author,
      required this.categories,
      required this.$__typename});

  @override
  factory Fragment$PaginatedBookmarkResponse$items$product.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedBookmarkResponse$items$productFromJson(json);

  final String id;

  final String name;

  final double price;

  final String image;

  final String overview;

  final Fragment$PaginatedBookmarkResponse$items$product$author author;

  final List<Fragment$PaginatedBookmarkResponse$items$product$categories>
      categories;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedBookmarkResponse$items$productToJson(this);
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
    if (!(other is Fragment$PaginatedBookmarkResponse$items$product) ||
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

extension UtilityExtension$Fragment$PaginatedBookmarkResponse$items$product
    on Fragment$PaginatedBookmarkResponse$items$product {
  Fragment$PaginatedBookmarkResponse$items$product copyWith(
          {String? id,
          String? name,
          double? price,
          String? image,
          String? overview,
          Fragment$PaginatedBookmarkResponse$items$product$author? author,
          List<Fragment$PaginatedBookmarkResponse$items$product$categories>?
              categories,
          String? $__typename}) =>
      Fragment$PaginatedBookmarkResponse$items$product(
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
class Fragment$PaginatedBookmarkResponse$items$product$author
    implements
        Fragment$Bookmark$product$author,
        Fragment$Product$author,
        Fragment$Author {
  Fragment$PaginatedBookmarkResponse$items$product$author(
      {required this.id,
      required this.name,
      required this.image,
      required this.overview,
      required this.$__typename});

  @override
  factory Fragment$PaginatedBookmarkResponse$items$product$author.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedBookmarkResponse$items$product$authorFromJson(json);

  final String id;

  final String name;

  final String image;

  final String overview;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedBookmarkResponse$items$product$authorToJson(this);
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
    if (!(other is Fragment$PaginatedBookmarkResponse$items$product$author) ||
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

extension UtilityExtension$Fragment$PaginatedBookmarkResponse$items$product$author
    on Fragment$PaginatedBookmarkResponse$items$product$author {
  Fragment$PaginatedBookmarkResponse$items$product$author copyWith(
          {String? id,
          String? name,
          String? image,
          String? overview,
          String? $__typename}) =>
      Fragment$PaginatedBookmarkResponse$items$product$author(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          image: image == null ? this.image : image,
          overview: overview == null ? this.overview : overview,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Fragment$PaginatedBookmarkResponse$items$product$categories
    implements
        Fragment$Bookmark$product$categories,
        Fragment$Product$categories,
        Fragment$Category {
  Fragment$PaginatedBookmarkResponse$items$product$categories(
      {required this.id, required this.name, required this.$__typename});

  @override
  factory Fragment$PaginatedBookmarkResponse$items$product$categories.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedBookmarkResponse$items$product$categoriesFromJson(
          json);

  final String id;

  final String name;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedBookmarkResponse$items$product$categoriesToJson(this);
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
            is Fragment$PaginatedBookmarkResponse$items$product$categories) ||
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

extension UtilityExtension$Fragment$PaginatedBookmarkResponse$items$product$categories
    on Fragment$PaginatedBookmarkResponse$items$product$categories {
  Fragment$PaginatedBookmarkResponse$items$product$categories copyWith(
          {String? id, String? name, String? $__typename}) =>
      Fragment$PaginatedBookmarkResponse$items$product$categories(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
