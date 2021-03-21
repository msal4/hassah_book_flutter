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
mixin PaginatedCategoryResponseMixin {
  List<PaginatedCategoryResponseMixin$Category> items;
  bool hasMore;
  int total;
}
mixin CategoryDetailMixin {
  String id;
  String name;
  CategoryDetailMixin$PaginatedProductResponse products;
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
    with EquatableMixin, PaginatedCategoryResponseMixin {
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
class PaginatedCategoryResponseMixin$Category extends JsonSerializable
    with EquatableMixin, CategoryDetailMixin {
  PaginatedCategoryResponseMixin$Category();

  factory PaginatedCategoryResponseMixin$Category.fromJson(
          Map<String, dynamic> json) =>
      _$PaginatedCategoryResponseMixin$CategoryFromJson(json);

  @override
  List<Object> get props => [id, name, products];
  Map<String, dynamic> toJson() =>
      _$PaginatedCategoryResponseMixin$CategoryToJson(this);
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
                    name: NameNode(value: 'PaginatedCategoryResponse'),
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
