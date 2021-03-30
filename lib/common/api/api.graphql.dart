// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:hassah_book_flutter/common/utils/coercers.dart';
part 'api.graphql.g.dart';

mixin PaginatedProductResponseMixin {
  List<PaginatedProductResponseMixin$Product> items;
  bool hasMore;
  int total;
}
mixin ProductMixin {
  String id;
  String name;
  double price;
  String image;
  ProductMixin$Author author;
  List<ProductMixin$Category> categories;
}
mixin PaginatedAuthorResponseMixin {
  List<PaginatedAuthorResponseMixin$Author> items;
  bool hasMore;
  int total;
}
mixin AuthorMixin {
  String id;
  String name;
  String image;
  String overview;
}
mixin PaginatedCategoryDetailResponseMixin {
  List<PaginatedCategoryDetailResponseMixin$Category> items;
  bool hasMore;
  int total;
}
mixin CategoryDetailMixin {
  String id;
  String name;
  CategoryDetailMixin$PaginatedProductResponse products;
}
mixin PaginatedCategoryResponseMixin {
  List<PaginatedCategoryResponseMixin$Category> items;
  bool hasMore;
  int total;
}
mixin CategoryMixin {
  String id;
  String name;
}
mixin PaginatedCollectionResponseMixin {
  List<PaginatedCollectionResponseMixin$Collection> items;
  bool hasMore;
  int total;
}
mixin CollectionMixin {
  String id;
  String image;
  String name;
}

@JsonSerializable(explicitToJson: true)
class Products$Query$PaginatedProductResponse extends JsonSerializable
    with EquatableMixin, PaginatedProductResponseMixin {
  Products$Query$PaginatedProductResponse();

  factory Products$Query$PaginatedProductResponse.fromJson(
          Map<String, dynamic> json) =>
      _$Products$Query$PaginatedProductResponseFromJson(json);

  @override
  List<Object> get props => [items, hasMore, total];
  Map<String, dynamic> toJson() =>
      _$Products$Query$PaginatedProductResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Products$Query extends JsonSerializable with EquatableMixin {
  Products$Query();

  factory Products$Query.fromJson(Map<String, dynamic> json) =>
      _$Products$QueryFromJson(json);

  Products$Query$PaginatedProductResponse products;

  @override
  List<Object> get props => [products];
  Map<String, dynamic> toJson() => _$Products$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PaginatedProductResponseMixin$Product extends JsonSerializable
    with EquatableMixin, ProductMixin {
  PaginatedProductResponseMixin$Product();

  factory PaginatedProductResponseMixin$Product.fromJson(
          Map<String, dynamic> json) =>
      _$PaginatedProductResponseMixin$ProductFromJson(json);

  @override
  List<Object> get props => [id, name, price, image, author, categories];
  Map<String, dynamic> toJson() =>
      _$PaginatedProductResponseMixin$ProductToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProductMixin$Author extends JsonSerializable with EquatableMixin {
  ProductMixin$Author();

  factory ProductMixin$Author.fromJson(Map<String, dynamic> json) =>
      _$ProductMixin$AuthorFromJson(json);

  String id;

  String name;

  @override
  List<Object> get props => [id, name];
  Map<String, dynamic> toJson() => _$ProductMixin$AuthorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProductMixin$Category extends JsonSerializable with EquatableMixin {
  ProductMixin$Category();

  factory ProductMixin$Category.fromJson(Map<String, dynamic> json) =>
      _$ProductMixin$CategoryFromJson(json);

  String id;

  String name;

  @override
  List<Object> get props => [id, name];
  Map<String, dynamic> toJson() => _$ProductMixin$CategoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AdminLogin$Mutation$LoginResponse extends JsonSerializable
    with EquatableMixin {
  AdminLogin$Mutation$LoginResponse();

  factory AdminLogin$Mutation$LoginResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AdminLogin$Mutation$LoginResponseFromJson(json);

  String accessToken;

  String refreshToken;

  @override
  List<Object> get props => [accessToken, refreshToken];
  Map<String, dynamic> toJson() =>
      _$AdminLogin$Mutation$LoginResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AdminLogin$Mutation extends JsonSerializable with EquatableMixin {
  AdminLogin$Mutation();

  factory AdminLogin$Mutation.fromJson(Map<String, dynamic> json) =>
      _$AdminLogin$MutationFromJson(json);

  AdminLogin$Mutation$LoginResponse adminLogin;

  @override
  List<Object> get props => [adminLogin];
  Map<String, dynamic> toJson() => _$AdminLogin$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AdminLoginInput extends JsonSerializable with EquatableMixin {
  AdminLoginInput({@required this.email, @required this.password});

  factory AdminLoginInput.fromJson(Map<String, dynamic> json) =>
      _$AdminLoginInputFromJson(json);

  String email;

  String password;

  @override
  List<Object> get props => [email, password];
  Map<String, dynamic> toJson() => _$AdminLoginInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Search$Query$PaginatedAuthorResponse extends JsonSerializable
    with EquatableMixin, PaginatedAuthorResponseMixin {
  Search$Query$PaginatedAuthorResponse();

  factory Search$Query$PaginatedAuthorResponse.fromJson(
          Map<String, dynamic> json) =>
      _$Search$Query$PaginatedAuthorResponseFromJson(json);

  @override
  List<Object> get props => [items, hasMore, total];
  Map<String, dynamic> toJson() =>
      _$Search$Query$PaginatedAuthorResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Search$Query$PaginatedProductResponse extends JsonSerializable
    with EquatableMixin, PaginatedProductResponseMixin {
  Search$Query$PaginatedProductResponse();

  factory Search$Query$PaginatedProductResponse.fromJson(
          Map<String, dynamic> json) =>
      _$Search$Query$PaginatedProductResponseFromJson(json);

  @override
  List<Object> get props => [items, hasMore, total];
  Map<String, dynamic> toJson() =>
      _$Search$Query$PaginatedProductResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Search$Query extends JsonSerializable with EquatableMixin {
  Search$Query();

  factory Search$Query.fromJson(Map<String, dynamic> json) =>
      _$Search$QueryFromJson(json);

  Search$Query$PaginatedAuthorResponse authors;

  Search$Query$PaginatedProductResponse products;

  @override
  List<Object> get props => [authors, products];
  Map<String, dynamic> toJson() => _$Search$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PaginatedAuthorResponseMixin$Author extends JsonSerializable
    with EquatableMixin, AuthorMixin {
  PaginatedAuthorResponseMixin$Author();

  factory PaginatedAuthorResponseMixin$Author.fromJson(
          Map<String, dynamic> json) =>
      _$PaginatedAuthorResponseMixin$AuthorFromJson(json);

  @override
  List<Object> get props => [id, name, image, overview];
  Map<String, dynamic> toJson() =>
      _$PaginatedAuthorResponseMixin$AuthorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OrderByMap extends JsonSerializable with EquatableMixin {
  OrderByMap({@required this.field, @required this.order});

  factory OrderByMap.fromJson(Map<String, dynamic> json) =>
      _$OrderByMapFromJson(json);

  String field;

  @JsonKey(unknownEnumValue: OrderBy.artemisUnknown)
  OrderBy order;

  @override
  List<Object> get props => [field, order];
  Map<String, dynamic> toJson() => _$OrderByMapToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Home$Query$LatestProducts extends JsonSerializable
    with EquatableMixin, PaginatedProductResponseMixin {
  Home$Query$LatestProducts();

  factory Home$Query$LatestProducts.fromJson(Map<String, dynamic> json) =>
      _$Home$Query$LatestProductsFromJson(json);

  @override
  List<Object> get props => [items, hasMore, total];
  Map<String, dynamic> toJson() => _$Home$Query$LatestProductsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Home$Query$PaginatedCategoryResponse extends JsonSerializable
    with EquatableMixin, PaginatedCategoryDetailResponseMixin {
  Home$Query$PaginatedCategoryResponse();

  factory Home$Query$PaginatedCategoryResponse.fromJson(
          Map<String, dynamic> json) =>
      _$Home$Query$PaginatedCategoryResponseFromJson(json);

  @override
  List<Object> get props => [items, hasMore, total];
  Map<String, dynamic> toJson() =>
      _$Home$Query$PaginatedCategoryResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Home$Query extends JsonSerializable with EquatableMixin {
  Home$Query();

  factory Home$Query.fromJson(Map<String, dynamic> json) =>
      _$Home$QueryFromJson(json);

  Home$Query$LatestProducts latestProducts;

  Home$Query$PaginatedCategoryResponse categories;

  @override
  List<Object> get props => [latestProducts, categories];
  Map<String, dynamic> toJson() => _$Home$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PaginatedCategoryDetailResponseMixin$Category extends JsonSerializable
    with EquatableMixin, CategoryDetailMixin {
  PaginatedCategoryDetailResponseMixin$Category();

  factory PaginatedCategoryDetailResponseMixin$Category.fromJson(
          Map<String, dynamic> json) =>
      _$PaginatedCategoryDetailResponseMixin$CategoryFromJson(json);

  @override
  List<Object> get props => [id, name, products];
  Map<String, dynamic> toJson() =>
      _$PaginatedCategoryDetailResponseMixin$CategoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CategoryDetailMixin$PaginatedProductResponse extends JsonSerializable
    with EquatableMixin, PaginatedProductResponseMixin {
  CategoryDetailMixin$PaginatedProductResponse();

  factory CategoryDetailMixin$PaginatedProductResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CategoryDetailMixin$PaginatedProductResponseFromJson(json);

  @override
  List<Object> get props => [items, hasMore, total];
  Map<String, dynamic> toJson() =>
      _$CategoryDetailMixin$PaginatedProductResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Categories$Query$PaginatedCategoryResponse extends JsonSerializable
    with EquatableMixin, PaginatedCategoryResponseMixin {
  Categories$Query$PaginatedCategoryResponse();

  factory Categories$Query$PaginatedCategoryResponse.fromJson(
          Map<String, dynamic> json) =>
      _$Categories$Query$PaginatedCategoryResponseFromJson(json);

  @override
  List<Object> get props => [items, hasMore, total];
  Map<String, dynamic> toJson() =>
      _$Categories$Query$PaginatedCategoryResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Categories$Query extends JsonSerializable with EquatableMixin {
  Categories$Query();

  factory Categories$Query.fromJson(Map<String, dynamic> json) =>
      _$Categories$QueryFromJson(json);

  Categories$Query$PaginatedCategoryResponse categories;

  @override
  List<Object> get props => [categories];
  Map<String, dynamic> toJson() => _$Categories$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PaginatedCategoryResponseMixin$Category extends JsonSerializable
    with EquatableMixin, CategoryMixin {
  PaginatedCategoryResponseMixin$Category();

  factory PaginatedCategoryResponseMixin$Category.fromJson(
          Map<String, dynamic> json) =>
      _$PaginatedCategoryResponseMixin$CategoryFromJson(json);

  @override
  List<Object> get props => [id, name];
  Map<String, dynamic> toJson() =>
      _$PaginatedCategoryResponseMixin$CategoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Collections$Query$PaginatedCollectionResponse extends JsonSerializable
    with EquatableMixin, PaginatedCollectionResponseMixin {
  Collections$Query$PaginatedCollectionResponse();

  factory Collections$Query$PaginatedCollectionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$Collections$Query$PaginatedCollectionResponseFromJson(json);

  @override
  List<Object> get props => [items, hasMore, total];
  Map<String, dynamic> toJson() =>
      _$Collections$Query$PaginatedCollectionResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Collections$Query extends JsonSerializable with EquatableMixin {
  Collections$Query();

  factory Collections$Query.fromJson(Map<String, dynamic> json) =>
      _$Collections$QueryFromJson(json);

  Collections$Query$PaginatedCollectionResponse collections;

  @override
  List<Object> get props => [collections];
  Map<String, dynamic> toJson() => _$Collections$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PaginatedCollectionResponseMixin$Collection extends JsonSerializable
    with EquatableMixin, CollectionMixin {
  PaginatedCollectionResponseMixin$Collection();

  factory PaginatedCollectionResponseMixin$Collection.fromJson(
          Map<String, dynamic> json) =>
      _$PaginatedCollectionResponseMixin$CollectionFromJson(json);

  @override
  List<Object> get props => [id, image, name];
  Map<String, dynamic> toJson() =>
      _$PaginatedCollectionResponseMixin$CollectionToJson(this);
}

enum OrderBy {
  @JsonValue('ASC')
  asc,
  @JsonValue('DESC')
  desc,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

class ProductsQuery extends GraphQLQuery<Products$Query, JsonSerializable> {
  ProductsQuery();

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'Products'),
        variableDefinitions: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'products'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FragmentSpreadNode(
                    name: NameNode(value: 'PaginatedProductResponse'),
                    directives: [])
              ]))
        ])),
    FragmentDefinitionNode(
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
                    name: NameNode(value: 'Product'), directives: [])
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
              selectionSet: null)
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'Product'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(
                name: NameNode(value: 'Product'), isNonNull: false)),
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
              name: NameNode(value: 'author'),
              alias: null,
              arguments: [],
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
                    selectionSet: null)
              ])),
          FieldNode(
              name: NameNode(value: 'categories'),
              alias: null,
              arguments: [],
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
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'Products';

  @override
  List<Object> get props => [document, operationName];
  @override
  Products$Query parse(Map<String, dynamic> json) =>
      Products$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class AdminLoginArguments extends JsonSerializable with EquatableMixin {
  AdminLoginArguments({@required this.data});

  @override
  factory AdminLoginArguments.fromJson(Map<String, dynamic> json) =>
      _$AdminLoginArgumentsFromJson(json);

  final AdminLoginInput data;

  @override
  List<Object> get props => [data];
  @override
  Map<String, dynamic> toJson() => _$AdminLoginArgumentsToJson(this);
}

class AdminLoginMutation
    extends GraphQLQuery<AdminLogin$Mutation, AdminLoginArguments> {
  AdminLoginMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'AdminLogin'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'data')),
              type: NamedTypeNode(
                  name: NameNode(value: 'AdminLoginInput'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'adminLogin'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'data'),
                    value: VariableNode(name: NameNode(value: 'data')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'accessToken'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'refreshToken'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'AdminLogin';

  @override
  final AdminLoginArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  AdminLogin$Mutation parse(Map<String, dynamic> json) =>
      AdminLogin$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class SearchArguments extends JsonSerializable with EquatableMixin {
  SearchArguments({this.searchQuery, this.order, this.skip, this.take});

  @override
  factory SearchArguments.fromJson(Map<String, dynamic> json) =>
      _$SearchArgumentsFromJson(json);

  final String searchQuery;

  final List<OrderByMap> order;

  final int skip;

  final int take;

  @override
  List<Object> get props => [searchQuery, order, skip, take];
  @override
  Map<String, dynamic> toJson() => _$SearchArgumentsToJson(this);
}

class SearchQuery extends GraphQLQuery<Search$Query, SearchArguments> {
  SearchQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'Search'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'searchQuery')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'order')),
              type: ListTypeNode(
                  type: NamedTypeNode(
                      name: NameNode(value: 'OrderByMap'), isNonNull: true),
                  isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'skip')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'take')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'authors'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'searchQuery'),
                    value: VariableNode(name: NameNode(value: 'searchQuery')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FragmentSpreadNode(
                    name: NameNode(value: 'PaginatedAuthorResponse'),
                    directives: [])
              ])),
          FieldNode(
              name: NameNode(value: 'products'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'searchQuery'),
                    value: VariableNode(name: NameNode(value: 'searchQuery'))),
                ArgumentNode(
                    name: NameNode(value: 'order'),
                    value: VariableNode(name: NameNode(value: 'order'))),
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
                    name: NameNode(value: 'PaginatedProductResponse'),
                    directives: [])
              ]))
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'PaginatedAuthorResponse'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(
                name: NameNode(value: 'PaginatedAuthorResponse'),
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
                    name: NameNode(value: 'Author'), directives: [])
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
              selectionSet: null)
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'Author'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(
                name: NameNode(value: 'Author'), isNonNull: false)),
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
              selectionSet: null)
        ])),
    FragmentDefinitionNode(
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
                    name: NameNode(value: 'Product'), directives: [])
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
              selectionSet: null)
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'Product'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(
                name: NameNode(value: 'Product'), isNonNull: false)),
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
              name: NameNode(value: 'author'),
              alias: null,
              arguments: [],
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
                    selectionSet: null)
              ])),
          FieldNode(
              name: NameNode(value: 'categories'),
              alias: null,
              arguments: [],
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
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'Search';

  @override
  final SearchArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  Search$Query parse(Map<String, dynamic> json) => Search$Query.fromJson(json);
}

class HomeQuery extends GraphQLQuery<Home$Query, JsonSerializable> {
  HomeQuery();

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'Home'),
        variableDefinitions: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'products'),
              alias: NameNode(value: 'latestProducts'),
              arguments: [
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
                    name: NameNode(value: 'PaginatedProductResponse'),
                    directives: [])
              ])),
          FieldNode(
              name: NameNode(value: 'categories'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FragmentSpreadNode(
                    name: NameNode(value: 'PaginatedCategoryDetailResponse'),
                    directives: [])
              ]))
        ])),
    FragmentDefinitionNode(
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
                    name: NameNode(value: 'Product'), directives: [])
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
              selectionSet: null)
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'Product'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(
                name: NameNode(value: 'Product'), isNonNull: false)),
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
              name: NameNode(value: 'author'),
              alias: null,
              arguments: [],
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
                    selectionSet: null)
              ])),
          FieldNode(
              name: NameNode(value: 'categories'),
              alias: null,
              arguments: [],
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
                    selectionSet: null)
              ]))
        ])),
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
                    name: NameNode(value: 'CategoryDetail'), directives: [])
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
              selectionSet: null)
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'CategoryDetail'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(
                name: NameNode(value: 'Category'), isNonNull: false)),
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
                    directives: [])
              ]))
        ]))
  ]);

  @override
  final String operationName = 'Home';

  @override
  List<Object> get props => [document, operationName];
  @override
  Home$Query parse(Map<String, dynamic> json) => Home$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CategoriesArguments extends JsonSerializable with EquatableMixin {
  CategoriesArguments({this.skip, this.take});

  @override
  factory CategoriesArguments.fromJson(Map<String, dynamic> json) =>
      _$CategoriesArgumentsFromJson(json);

  final int skip;

  final int take;

  @override
  List<Object> get props => [skip, take];
  @override
  Map<String, dynamic> toJson() => _$CategoriesArgumentsToJson(this);
}

class CategoriesQuery
    extends GraphQLQuery<Categories$Query, CategoriesArguments> {
  CategoriesQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'Categories'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'skip')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'take')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'categories'),
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
                    name: NameNode(value: 'PaginatedCategoryResponse'),
                    directives: [])
              ]))
        ])),
    FragmentDefinitionNode(
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
                    name: NameNode(value: 'Category'), directives: [])
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
              selectionSet: null)
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'Category'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(
                name: NameNode(value: 'Category'), isNonNull: false)),
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
              selectionSet: null)
        ]))
  ]);

  @override
  final String operationName = 'Categories';

  @override
  final CategoriesArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  Categories$Query parse(Map<String, dynamic> json) =>
      Categories$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CollectionsArguments extends JsonSerializable with EquatableMixin {
  CollectionsArguments({this.skip, this.take});

  @override
  factory CollectionsArguments.fromJson(Map<String, dynamic> json) =>
      _$CollectionsArgumentsFromJson(json);

  final int skip;

  final int take;

  @override
  List<Object> get props => [skip, take];
  @override
  Map<String, dynamic> toJson() => _$CollectionsArgumentsToJson(this);
}

class CollectionsQuery
    extends GraphQLQuery<Collections$Query, CollectionsArguments> {
  CollectionsQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'Collections'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'skip')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'take')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'collections'),
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
                    name: NameNode(value: 'PaginatedCollectionResponse'),
                    directives: [])
              ]))
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'PaginatedCollectionResponse'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(
                name: NameNode(value: 'PaginatedCollectionResponse'),
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
                    name: NameNode(value: 'Collection'), directives: [])
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
              selectionSet: null)
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'Collection'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(
                name: NameNode(value: 'Collection'), isNonNull: false)),
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'id'),
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
              name: NameNode(value: 'name'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null)
        ]))
  ]);

  @override
  final String operationName = 'Collections';

  @override
  final CollectionsArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  Collections$Query parse(Map<String, dynamic> json) =>
      Collections$Query.fromJson(json);
}
