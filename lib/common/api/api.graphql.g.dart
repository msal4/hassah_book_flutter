// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products$Query$PaginatedProductResponse
    _$Products$Query$PaginatedProductResponseFromJson(
        Map<String, dynamic> json) {
  return Products$Query$PaginatedProductResponse()
    ..items = (json['items'] as List)
        ?.map((e) => e == null
            ? null
            : PaginatedProductResponseMixin$Product.fromJson(
                e as Map<String, dynamic>))
        ?.toList()
    ..hasMore = json['hasMore'] as bool
    ..total = json['total'] as int;
}

Map<String, dynamic> _$Products$Query$PaginatedProductResponseToJson(
        Products$Query$PaginatedProductResponse instance) =>
    <String, dynamic>{
      'items': instance.items?.map((e) => e?.toJson())?.toList(),
      'hasMore': instance.hasMore,
      'total': instance.total,
    };

Products$Query _$Products$QueryFromJson(Map<String, dynamic> json) {
  return Products$Query()
    ..products = json['products'] == null
        ? null
        : Products$Query$PaginatedProductResponse.fromJson(
            json['products'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Products$QueryToJson(Products$Query instance) =>
    <String, dynamic>{
      'products': instance.products?.toJson(),
    };

PaginatedProductResponseMixin$Product
    _$PaginatedProductResponseMixin$ProductFromJson(Map<String, dynamic> json) {
  return PaginatedProductResponseMixin$Product()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..price = (json['price'] as num)?.toDouble()
    ..image = json['image'] as String
    ..author = json['author'] == null
        ? null
        : ProductMixin$Author.fromJson(json['author'] as Map<String, dynamic>)
    ..categories = (json['categories'] as List)
        ?.map((e) => e == null
            ? null
            : ProductMixin$Category.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PaginatedProductResponseMixin$ProductToJson(
        PaginatedProductResponseMixin$Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'image': instance.image,
      'author': instance.author?.toJson(),
      'categories': instance.categories?.map((e) => e?.toJson())?.toList(),
    };

ProductMixin$Author _$ProductMixin$AuthorFromJson(Map<String, dynamic> json) {
  return ProductMixin$Author()
    ..id = json['id'] as String
    ..name = json['name'] as String;
}

Map<String, dynamic> _$ProductMixin$AuthorToJson(
        ProductMixin$Author instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ProductMixin$Category _$ProductMixin$CategoryFromJson(
    Map<String, dynamic> json) {
  return ProductMixin$Category()
    ..id = json['id'] as String
    ..name = json['name'] as String;
}

Map<String, dynamic> _$ProductMixin$CategoryToJson(
        ProductMixin$Category instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

AdminLogin$Mutation$LoginResponse _$AdminLogin$Mutation$LoginResponseFromJson(
    Map<String, dynamic> json) {
  return AdminLogin$Mutation$LoginResponse()
    ..accessToken = json['accessToken'] as String
    ..refreshToken = json['refreshToken'] as String;
}

Map<String, dynamic> _$AdminLogin$Mutation$LoginResponseToJson(
        AdminLogin$Mutation$LoginResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

AdminLogin$Mutation _$AdminLogin$MutationFromJson(Map<String, dynamic> json) {
  return AdminLogin$Mutation()
    ..adminLogin = json['adminLogin'] == null
        ? null
        : AdminLogin$Mutation$LoginResponse.fromJson(
            json['adminLogin'] as Map<String, dynamic>);
}

Map<String, dynamic> _$AdminLogin$MutationToJson(
        AdminLogin$Mutation instance) =>
    <String, dynamic>{
      'adminLogin': instance.adminLogin?.toJson(),
    };

AdminLoginInput _$AdminLoginInputFromJson(Map<String, dynamic> json) {
  return AdminLoginInput(
    email: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$AdminLoginInputToJson(AdminLoginInput instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

Home$Query$LatestProducts _$Home$Query$LatestProductsFromJson(
    Map<String, dynamic> json) {
  return Home$Query$LatestProducts()
    ..items = (json['items'] as List)
        ?.map((e) => e == null
            ? null
            : PaginatedProductResponseMixin$Product.fromJson(
                e as Map<String, dynamic>))
        ?.toList()
    ..hasMore = json['hasMore'] as bool
    ..total = json['total'] as int;
}

Map<String, dynamic> _$Home$Query$LatestProductsToJson(
        Home$Query$LatestProducts instance) =>
    <String, dynamic>{
      'items': instance.items?.map((e) => e?.toJson())?.toList(),
      'hasMore': instance.hasMore,
      'total': instance.total,
    };

Home$Query$PaginatedCategoryResponse
    _$Home$Query$PaginatedCategoryResponseFromJson(Map<String, dynamic> json) {
  return Home$Query$PaginatedCategoryResponse()
    ..items = (json['items'] as List)
        ?.map((e) => e == null
            ? null
            : PaginatedCategoryResponseMixin$Category.fromJson(
                e as Map<String, dynamic>))
        ?.toList()
    ..hasMore = json['hasMore'] as bool
    ..total = json['total'] as int;
}

Map<String, dynamic> _$Home$Query$PaginatedCategoryResponseToJson(
        Home$Query$PaginatedCategoryResponse instance) =>
    <String, dynamic>{
      'items': instance.items?.map((e) => e?.toJson())?.toList(),
      'hasMore': instance.hasMore,
      'total': instance.total,
    };

Home$Query _$Home$QueryFromJson(Map<String, dynamic> json) {
  return Home$Query()
    ..latestProducts = json['latestProducts'] == null
        ? null
        : Home$Query$LatestProducts.fromJson(
            json['latestProducts'] as Map<String, dynamic>)
    ..categories = json['categories'] == null
        ? null
        : Home$Query$PaginatedCategoryResponse.fromJson(
            json['categories'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Home$QueryToJson(Home$Query instance) =>
    <String, dynamic>{
      'latestProducts': instance.latestProducts?.toJson(),
      'categories': instance.categories?.toJson(),
    };

PaginatedCategoryResponseMixin$Category
    _$PaginatedCategoryResponseMixin$CategoryFromJson(
        Map<String, dynamic> json) {
  return PaginatedCategoryResponseMixin$Category()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..products = json['products'] == null
        ? null
        : CategoryDetailMixin$PaginatedProductResponse.fromJson(
            json['products'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PaginatedCategoryResponseMixin$CategoryToJson(
        PaginatedCategoryResponseMixin$Category instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'products': instance.products?.toJson(),
    };

CategoryDetailMixin$PaginatedProductResponse
    _$CategoryDetailMixin$PaginatedProductResponseFromJson(
        Map<String, dynamic> json) {
  return CategoryDetailMixin$PaginatedProductResponse()
    ..items = (json['items'] as List)
        ?.map((e) => e == null
            ? null
            : PaginatedProductResponseMixin$Product.fromJson(
                e as Map<String, dynamic>))
        ?.toList()
    ..hasMore = json['hasMore'] as bool
    ..total = json['total'] as int;
}

Map<String, dynamic> _$CategoryDetailMixin$PaginatedProductResponseToJson(
        CategoryDetailMixin$PaginatedProductResponse instance) =>
    <String, dynamic>{
      'items': instance.items?.map((e) => e?.toJson())?.toList(),
      'hasMore': instance.hasMore,
      'total': instance.total,
    };

AdminLoginArguments _$AdminLoginArgumentsFromJson(Map<String, dynamic> json) {
  return AdminLoginArguments(
    data: json['data'] == null
        ? null
        : AdminLoginInput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AdminLoginArgumentsToJson(
        AdminLoginArguments instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };
