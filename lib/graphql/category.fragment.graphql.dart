import 'author.fragment.graphql.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:json_annotation/json_annotation.dart';
import 'product.fragment.graphql.dart';
part 'category.fragment.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Fragment$CategoryDetail {
  Fragment$CategoryDetail(
      {required this.id,
      required this.name,
      required this.products,
      required this.$__typename});

  @override
  factory Fragment$CategoryDetail.fromJson(Map<String, dynamic> json) =>
      _$Fragment$CategoryDetailFromJson(json);

  final String id;

  final String name;

  final Fragment$CategoryDetail$products products;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Fragment$CategoryDetailToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$products = products;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$products, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Fragment$CategoryDetail) || runtimeType != other.runtimeType)
      return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$products = products;
    final lOther$products = other.products;
    if (l$products != lOther$products) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Fragment$CategoryDetail on Fragment$CategoryDetail {
  Fragment$CategoryDetail copyWith(
          {String? id,
          String? name,
          Fragment$CategoryDetail$products? products,
          String? $__typename}) =>
      Fragment$CategoryDetail(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          products: products == null ? this.products : products,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const fragmentDefinitionCategoryDetail = FragmentDefinitionNode(
    name: NameNode(value: 'CategoryDetail'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(name: NameNode(value: 'Category'), isNonNull: false)),
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
          name: NameNode(value: 'products'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FragmentSpreadNode(
                name: NameNode(value: 'PaginatedProductResponse'),
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
    ]));
const queryDocumentCategoryDetail = DocumentNode(definitions: [
  fragmentDefinitionCategoryDetail,
  fragmentDefinitionPaginatedProductResponse,
  fragmentDefinitionProduct,
  fragmentDefinitionAuthor,
  fragmentDefinitionCategory,
]);

extension ClientExtension$Fragment$CategoryDetail on graphql.GraphQLClient {
  void writeFragment$CategoryDetail(
          {required Fragment$CategoryDetail data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'CategoryDetail',
                  document: queryDocumentCategoryDetail)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$CategoryDetail? readFragment$CategoryDetail(
      {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'CategoryDetail',
                document: queryDocumentCategoryDetail)),
        optimistic: optimistic);
    return result == null ? null : Fragment$CategoryDetail.fromJson(result);
  }
}

@JsonSerializable(explicitToJson: true)
class Fragment$CategoryDetail$products
    implements Fragment$PaginatedProductResponse {
  Fragment$CategoryDetail$products(
      {required this.items,
      required this.hasMore,
      required this.total,
      required this.$__typename});

  @override
  factory Fragment$CategoryDetail$products.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$CategoryDetail$productsFromJson(json);

  final List<Fragment$CategoryDetail$products$items> items;

  final bool hasMore;

  final int total;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$CategoryDetail$productsToJson(this);
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
    if (!(other is Fragment$CategoryDetail$products) ||
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

extension UtilityExtension$Fragment$CategoryDetail$products
    on Fragment$CategoryDetail$products {
  Fragment$CategoryDetail$products copyWith(
          {List<Fragment$CategoryDetail$products$items>? items,
          bool? hasMore,
          int? total,
          String? $__typename}) =>
      Fragment$CategoryDetail$products(
          items: items == null ? this.items : items,
          hasMore: hasMore == null ? this.hasMore : hasMore,
          total: total == null ? this.total : total,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Fragment$CategoryDetail$products$items
    implements Fragment$PaginatedProductResponse$items, Fragment$Product {
  Fragment$CategoryDetail$products$items(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.overview,
      required this.author,
      required this.categories,
      required this.$__typename});

  @override
  factory Fragment$CategoryDetail$products$items.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$CategoryDetail$products$itemsFromJson(json);

  final String id;

  final String name;

  final double price;

  final String image;

  final String overview;

  final Fragment$CategoryDetail$products$items$author author;

  final List<Fragment$CategoryDetail$products$items$categories> categories;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$CategoryDetail$products$itemsToJson(this);
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
    if (!(other is Fragment$CategoryDetail$products$items) ||
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

extension UtilityExtension$Fragment$CategoryDetail$products$items
    on Fragment$CategoryDetail$products$items {
  Fragment$CategoryDetail$products$items copyWith(
          {String? id,
          String? name,
          double? price,
          String? image,
          String? overview,
          Fragment$CategoryDetail$products$items$author? author,
          List<Fragment$CategoryDetail$products$items$categories>? categories,
          String? $__typename}) =>
      Fragment$CategoryDetail$products$items(
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
class Fragment$CategoryDetail$products$items$author
    implements
        Fragment$PaginatedProductResponse$items$author,
        Fragment$Product$author,
        Fragment$Author {
  Fragment$CategoryDetail$products$items$author(
      {required this.id,
      required this.name,
      required this.image,
      required this.overview,
      required this.$__typename});

  @override
  factory Fragment$CategoryDetail$products$items$author.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$CategoryDetail$products$items$authorFromJson(json);

  final String id;

  final String name;

  final String image;

  final String overview;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$CategoryDetail$products$items$authorToJson(this);
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
    if (!(other is Fragment$CategoryDetail$products$items$author) ||
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

extension UtilityExtension$Fragment$CategoryDetail$products$items$author
    on Fragment$CategoryDetail$products$items$author {
  Fragment$CategoryDetail$products$items$author copyWith(
          {String? id,
          String? name,
          String? image,
          String? overview,
          String? $__typename}) =>
      Fragment$CategoryDetail$products$items$author(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          image: image == null ? this.image : image,
          overview: overview == null ? this.overview : overview,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Fragment$CategoryDetail$products$items$categories
    implements
        Fragment$PaginatedProductResponse$items$categories,
        Fragment$Product$categories,
        Fragment$Category {
  Fragment$CategoryDetail$products$items$categories(
      {required this.id, required this.name, required this.$__typename});

  @override
  factory Fragment$CategoryDetail$products$items$categories.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$CategoryDetail$products$items$categoriesFromJson(json);

  final String id;

  final String name;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$CategoryDetail$products$items$categoriesToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Fragment$CategoryDetail$products$items$categories) ||
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

extension UtilityExtension$Fragment$CategoryDetail$products$items$categories
    on Fragment$CategoryDetail$products$items$categories {
  Fragment$CategoryDetail$products$items$categories copyWith(
          {String? id, String? name, String? $__typename}) =>
      Fragment$CategoryDetail$products$items$categories(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Fragment$PaginatedCategoryDetailResponse {
  Fragment$PaginatedCategoryDetailResponse(
      {required this.items,
      required this.hasMore,
      required this.total,
      required this.$__typename});

  @override
  factory Fragment$PaginatedCategoryDetailResponse.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedCategoryDetailResponseFromJson(json);

  final List<Fragment$PaginatedCategoryDetailResponse$items> items;

  final bool hasMore;

  final int total;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedCategoryDetailResponseToJson(this);
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
    if (!(other is Fragment$PaginatedCategoryDetailResponse) ||
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

extension UtilityExtension$Fragment$PaginatedCategoryDetailResponse
    on Fragment$PaginatedCategoryDetailResponse {
  Fragment$PaginatedCategoryDetailResponse copyWith(
          {List<Fragment$PaginatedCategoryDetailResponse$items>? items,
          bool? hasMore,
          int? total,
          String? $__typename}) =>
      Fragment$PaginatedCategoryDetailResponse(
          items: items == null ? this.items : items,
          hasMore: hasMore == null ? this.hasMore : hasMore,
          total: total == null ? this.total : total,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const fragmentDefinitionPaginatedCategoryDetailResponse =
    FragmentDefinitionNode(
        name: NameNode(value: 'PaginatedCategoryDetailResponse'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(
                name: NameNode(value: 'PaginatedCategoryResponse'),
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
                    name: NameNode(value: 'CategoryDetail'), directives: []),
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
const queryDocumentPaginatedCategoryDetailResponse = DocumentNode(definitions: [
  fragmentDefinitionPaginatedCategoryDetailResponse,
  fragmentDefinitionCategoryDetail,
  fragmentDefinitionPaginatedProductResponse,
  fragmentDefinitionProduct,
  fragmentDefinitionAuthor,
  fragmentDefinitionCategory,
]);

extension ClientExtension$Fragment$PaginatedCategoryDetailResponse
    on graphql.GraphQLClient {
  void writeFragment$PaginatedCategoryDetailResponse(
          {required Fragment$PaginatedCategoryDetailResponse data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'PaginatedCategoryDetailResponse',
                  document: queryDocumentPaginatedCategoryDetailResponse)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$PaginatedCategoryDetailResponse?
      readFragment$PaginatedCategoryDetailResponse(
          {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'PaginatedCategoryDetailResponse',
                document: queryDocumentPaginatedCategoryDetailResponse)),
        optimistic: optimistic);
    return result == null
        ? null
        : Fragment$PaginatedCategoryDetailResponse.fromJson(result);
  }
}

@JsonSerializable(explicitToJson: true)
class Fragment$PaginatedCategoryDetailResponse$items
    implements Fragment$CategoryDetail {
  Fragment$PaginatedCategoryDetailResponse$items(
      {required this.id,
      required this.name,
      required this.products,
      required this.$__typename});

  @override
  factory Fragment$PaginatedCategoryDetailResponse$items.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedCategoryDetailResponse$itemsFromJson(json);

  final String id;

  final String name;

  final Fragment$PaginatedCategoryDetailResponse$items$products products;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedCategoryDetailResponse$itemsToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$products = products;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$products, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Fragment$PaginatedCategoryDetailResponse$items) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$products = products;
    final lOther$products = other.products;
    if (l$products != lOther$products) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Fragment$PaginatedCategoryDetailResponse$items
    on Fragment$PaginatedCategoryDetailResponse$items {
  Fragment$PaginatedCategoryDetailResponse$items copyWith(
          {String? id,
          String? name,
          Fragment$PaginatedCategoryDetailResponse$items$products? products,
          String? $__typename}) =>
      Fragment$PaginatedCategoryDetailResponse$items(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          products: products == null ? this.products : products,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Fragment$PaginatedCategoryDetailResponse$items$products
    implements
        Fragment$CategoryDetail$products,
        Fragment$PaginatedProductResponse {
  Fragment$PaginatedCategoryDetailResponse$items$products(
      {required this.items,
      required this.hasMore,
      required this.total,
      required this.$__typename});

  @override
  factory Fragment$PaginatedCategoryDetailResponse$items$products.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedCategoryDetailResponse$items$productsFromJson(json);

  final List<Fragment$PaginatedCategoryDetailResponse$items$products$items>
      items;

  final bool hasMore;

  final int total;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedCategoryDetailResponse$items$productsToJson(this);
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
    if (!(other is Fragment$PaginatedCategoryDetailResponse$items$products) ||
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

extension UtilityExtension$Fragment$PaginatedCategoryDetailResponse$items$products
    on Fragment$PaginatedCategoryDetailResponse$items$products {
  Fragment$PaginatedCategoryDetailResponse$items$products copyWith(
          {List<Fragment$PaginatedCategoryDetailResponse$items$products$items>?
              items,
          bool? hasMore,
          int? total,
          String? $__typename}) =>
      Fragment$PaginatedCategoryDetailResponse$items$products(
          items: items == null ? this.items : items,
          hasMore: hasMore == null ? this.hasMore : hasMore,
          total: total == null ? this.total : total,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Fragment$PaginatedCategoryDetailResponse$items$products$items
    implements
        Fragment$CategoryDetail$products$items,
        Fragment$PaginatedProductResponse$items,
        Fragment$Product {
  Fragment$PaginatedCategoryDetailResponse$items$products$items(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.overview,
      required this.author,
      required this.categories,
      required this.$__typename});

  @override
  factory Fragment$PaginatedCategoryDetailResponse$items$products$items.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedCategoryDetailResponse$items$products$itemsFromJson(
          json);

  final String id;

  final String name;

  final double price;

  final String image;

  final String overview;

  final Fragment$PaginatedCategoryDetailResponse$items$products$items$author
      author;

  final List<
          Fragment$PaginatedCategoryDetailResponse$items$products$items$categories>
      categories;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedCategoryDetailResponse$items$products$itemsToJson(
          this);
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
    if (!(other
            is Fragment$PaginatedCategoryDetailResponse$items$products$items) ||
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

extension UtilityExtension$Fragment$PaginatedCategoryDetailResponse$items$products$items
    on Fragment$PaginatedCategoryDetailResponse$items$products$items {
  Fragment$PaginatedCategoryDetailResponse$items$products$items copyWith(
          {String? id,
          String? name,
          double? price,
          String? image,
          String? overview,
          Fragment$PaginatedCategoryDetailResponse$items$products$items$author?
              author,
          List<Fragment$PaginatedCategoryDetailResponse$items$products$items$categories>?
              categories,
          String? $__typename}) =>
      Fragment$PaginatedCategoryDetailResponse$items$products$items(
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
class Fragment$PaginatedCategoryDetailResponse$items$products$items$author
    implements
        Fragment$CategoryDetail$products$items$author,
        Fragment$PaginatedProductResponse$items$author,
        Fragment$Product$author,
        Fragment$Author {
  Fragment$PaginatedCategoryDetailResponse$items$products$items$author(
      {required this.id,
      required this.name,
      required this.image,
      required this.overview,
      required this.$__typename});

  @override
  factory Fragment$PaginatedCategoryDetailResponse$items$products$items$author.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedCategoryDetailResponse$items$products$items$authorFromJson(
          json);

  final String id;

  final String name;

  final String image;

  final String overview;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedCategoryDetailResponse$items$products$items$authorToJson(
          this);
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
    if (!(other
            is Fragment$PaginatedCategoryDetailResponse$items$products$items$author) ||
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

extension UtilityExtension$Fragment$PaginatedCategoryDetailResponse$items$products$items$author
    on Fragment$PaginatedCategoryDetailResponse$items$products$items$author {
  Fragment$PaginatedCategoryDetailResponse$items$products$items$author copyWith(
          {String? id,
          String? name,
          String? image,
          String? overview,
          String? $__typename}) =>
      Fragment$PaginatedCategoryDetailResponse$items$products$items$author(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          image: image == null ? this.image : image,
          overview: overview == null ? this.overview : overview,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Fragment$PaginatedCategoryDetailResponse$items$products$items$categories
    implements
        Fragment$CategoryDetail$products$items$categories,
        Fragment$PaginatedProductResponse$items$categories,
        Fragment$Product$categories,
        Fragment$Category {
  Fragment$PaginatedCategoryDetailResponse$items$products$items$categories(
      {required this.id, required this.name, required this.$__typename});

  @override
  factory Fragment$PaginatedCategoryDetailResponse$items$products$items$categories.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedCategoryDetailResponse$items$products$items$categoriesFromJson(
          json);

  final String id;

  final String name;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedCategoryDetailResponse$items$products$items$categoriesToJson(
          this);
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
            is Fragment$PaginatedCategoryDetailResponse$items$products$items$categories) ||
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

extension UtilityExtension$Fragment$PaginatedCategoryDetailResponse$items$products$items$categories
    on Fragment$PaginatedCategoryDetailResponse$items$products$items$categories {
  Fragment$PaginatedCategoryDetailResponse$items$products$items$categories
      copyWith({String? id, String? name, String? $__typename}) =>
          Fragment$PaginatedCategoryDetailResponse$items$products$items$categories(
              id: id == null ? this.id : id,
              name: name == null ? this.name : name,
              $__typename:
                  $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Fragment$Category {
  Fragment$Category(
      {required this.id, required this.name, required this.$__typename});

  @override
  factory Fragment$Category.fromJson(Map<String, dynamic> json) =>
      _$Fragment$CategoryFromJson(json);

  final String id;

  final String name;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Fragment$CategoryToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Fragment$Category) || runtimeType != other.runtimeType)
      return false;
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

extension UtilityExtension$Fragment$Category on Fragment$Category {
  Fragment$Category copyWith({String? id, String? name, String? $__typename}) =>
      Fragment$Category(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const fragmentDefinitionCategory = FragmentDefinitionNode(
    name: NameNode(value: 'Category'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(name: NameNode(value: 'Category'), isNonNull: false)),
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
    ]));
const queryDocumentCategory = DocumentNode(definitions: [
  fragmentDefinitionCategory,
]);

extension ClientExtension$Fragment$Category on graphql.GraphQLClient {
  void writeFragment$Category(
          {required Fragment$Category data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'Category', document: queryDocumentCategory)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$Category? readFragment$Category(
      {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'Category', document: queryDocumentCategory)),
        optimistic: optimistic);
    return result == null ? null : Fragment$Category.fromJson(result);
  }
}

@JsonSerializable(explicitToJson: true)
class Fragment$PaginatedCategoryResponse {
  Fragment$PaginatedCategoryResponse(
      {required this.items,
      required this.hasMore,
      required this.total,
      required this.$__typename});

  @override
  factory Fragment$PaginatedCategoryResponse.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedCategoryResponseFromJson(json);

  final List<Fragment$PaginatedCategoryResponse$items> items;

  final bool hasMore;

  final int total;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedCategoryResponseToJson(this);
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
    if (!(other is Fragment$PaginatedCategoryResponse) ||
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

extension UtilityExtension$Fragment$PaginatedCategoryResponse
    on Fragment$PaginatedCategoryResponse {
  Fragment$PaginatedCategoryResponse copyWith(
          {List<Fragment$PaginatedCategoryResponse$items>? items,
          bool? hasMore,
          int? total,
          String? $__typename}) =>
      Fragment$PaginatedCategoryResponse(
          items: items == null ? this.items : items,
          hasMore: hasMore == null ? this.hasMore : hasMore,
          total: total == null ? this.total : total,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const fragmentDefinitionPaginatedCategoryResponse = FragmentDefinitionNode(
    name: NameNode(value: 'PaginatedCategoryResponse'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
            name: NameNode(value: 'PaginatedCategoryResponse'),
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
                name: NameNode(value: 'Category'), directives: []),
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
const queryDocumentPaginatedCategoryResponse = DocumentNode(definitions: [
  fragmentDefinitionPaginatedCategoryResponse,
  fragmentDefinitionCategory,
]);

extension ClientExtension$Fragment$PaginatedCategoryResponse
    on graphql.GraphQLClient {
  void writeFragment$PaginatedCategoryResponse(
          {required Fragment$PaginatedCategoryResponse data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'PaginatedCategoryResponse',
                  document: queryDocumentPaginatedCategoryResponse)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$PaginatedCategoryResponse? readFragment$PaginatedCategoryResponse(
      {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'PaginatedCategoryResponse',
                document: queryDocumentPaginatedCategoryResponse)),
        optimistic: optimistic);
    return result == null
        ? null
        : Fragment$PaginatedCategoryResponse.fromJson(result);
  }
}

@JsonSerializable(explicitToJson: true)
class Fragment$PaginatedCategoryResponse$items implements Fragment$Category {
  Fragment$PaginatedCategoryResponse$items(
      {required this.id, required this.name, required this.$__typename});

  @override
  factory Fragment$PaginatedCategoryResponse$items.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedCategoryResponse$itemsFromJson(json);

  final String id;

  final String name;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedCategoryResponse$itemsToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Fragment$PaginatedCategoryResponse$items) ||
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

extension UtilityExtension$Fragment$PaginatedCategoryResponse$items
    on Fragment$PaginatedCategoryResponse$items {
  Fragment$PaginatedCategoryResponse$items copyWith(
          {String? id, String? name, String? $__typename}) =>
      Fragment$PaginatedCategoryResponse$items(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
