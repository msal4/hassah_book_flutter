import 'package:hassah_book_flutter/common/utils/coercers.dart';
import 'package:json_annotation/json_annotation.dart';
part 'schema.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Input$CreateAdminInput {
  Input$CreateAdminInput(
      {required this.email, required this.name, required this.password});

  @override
  factory Input$CreateAdminInput.fromJson(Map<String, dynamic> json) =>
      _$Input$CreateAdminInputFromJson(json);

  final String email;

  final String name;

  final String password;

  Map<String, dynamic> toJson() => _$Input$CreateAdminInputToJson(this);
  int get hashCode {
    final l$email = email;
    final l$name = name;
    final l$password = password;
    return Object.hashAll([l$email, l$name, l$password]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$CreateAdminInput) || runtimeType != other.runtimeType)
      return false;
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$CreateAuthorInput {
  Input$CreateAuthorInput({required this.name, required this.overview});

  @override
  factory Input$CreateAuthorInput.fromJson(Map<String, dynamic> json) =>
      _$Input$CreateAuthorInputFromJson(json);

  final String name;

  final String overview;

  Map<String, dynamic> toJson() => _$Input$CreateAuthorInputToJson(this);
  int get hashCode {
    final l$name = name;
    final l$overview = overview;
    return Object.hashAll([l$name, l$overview]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$CreateAuthorInput) || runtimeType != other.runtimeType)
      return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$overview = overview;
    final lOther$overview = other.overview;
    if (l$overview != lOther$overview) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$CreateCategoryInput {
  Input$CreateCategoryInput({required this.name});

  @override
  factory Input$CreateCategoryInput.fromJson(Map<String, dynamic> json) =>
      _$Input$CreateCategoryInputFromJson(json);

  final String name;

  Map<String, dynamic> toJson() => _$Input$CreateCategoryInputToJson(this);
  int get hashCode {
    final l$name = name;
    return Object.hashAll([l$name]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$CreateCategoryInput) ||
        runtimeType != other.runtimeType) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$CreateCollectionInput {
  Input$CreateCollectionInput({required this.name});

  @override
  factory Input$CreateCollectionInput.fromJson(Map<String, dynamic> json) =>
      _$Input$CreateCollectionInputFromJson(json);

  final String name;

  Map<String, dynamic> toJson() => _$Input$CreateCollectionInputToJson(this);
  int get hashCode {
    final l$name = name;
    return Object.hashAll([l$name]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$CreateCollectionInput) ||
        runtimeType != other.runtimeType) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$CreateProductInput {
  Input$CreateProductInput(
      {required this.author,
      required this.categories,
      required this.collections,
      this.language,
      required this.name,
      required this.overview,
      this.pages,
      required this.price,
      this.publishedAt,
      this.publisher,
      required this.status});

  @override
  factory Input$CreateProductInput.fromJson(Map<String, dynamic> json) =>
      _$Input$CreateProductInputFromJson(json);

  final Input$ObjectIdInput author;

  final List<Input$ObjectIdInput> categories;

  final List<Input$ObjectIdInput> collections;

  final String? language;

  final String name;

  final String overview;

  final int? pages;

  final double price;

  @JsonKey(
      fromJson: _nullable$dateTimeFromJson, toJson: _nullable$dateTimeToJson)
  final DateTime? publishedAt;

  final Input$ObjectIdInput? publisher;

  final String status;

  Map<String, dynamic> toJson() => _$Input$CreateProductInputToJson(this);
  int get hashCode {
    final l$author = author;
    final l$categories = categories;
    final l$collections = collections;
    final l$language = language;
    final l$name = name;
    final l$overview = overview;
    final l$pages = pages;
    final l$price = price;
    final l$publishedAt = publishedAt;
    final l$publisher = publisher;
    final l$status = status;
    return Object.hashAll([
      l$author,
      Object.hashAll(l$categories.map((v) => v)),
      Object.hashAll(l$collections.map((v) => v)),
      l$language,
      l$name,
      l$overview,
      l$pages,
      l$price,
      l$publishedAt,
      l$publisher,
      l$status
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$CreateProductInput) ||
        runtimeType != other.runtimeType) return false;
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

    final l$collections = collections;
    final lOther$collections = other.collections;
    if (l$collections.length != lOther$collections.length) return false;
    for (int i = 0; i < l$collections.length; i++) {
      final l$collections$entry = l$collections[i];
      final lOther$collections$entry = lOther$collections[i];
      if (l$collections$entry != lOther$collections$entry) return false;
    }

    final l$language = language;
    final lOther$language = other.language;
    if (l$language != lOther$language) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$overview = overview;
    final lOther$overview = other.overview;
    if (l$overview != lOther$overview) return false;
    final l$pages = pages;
    final lOther$pages = other.pages;
    if (l$pages != lOther$pages) return false;
    final l$price = price;
    final lOther$price = other.price;
    if (l$price != lOther$price) return false;
    final l$publishedAt = publishedAt;
    final lOther$publishedAt = other.publishedAt;
    if (l$publishedAt != lOther$publishedAt) return false;
    final l$publisher = publisher;
    final lOther$publisher = other.publisher;
    if (l$publisher != lOther$publisher) return false;
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$CreatePublisherInput {
  Input$CreatePublisherInput({required this.name});

  @override
  factory Input$CreatePublisherInput.fromJson(Map<String, dynamic> json) =>
      _$Input$CreatePublisherInputFromJson(json);

  final String name;

  Map<String, dynamic> toJson() => _$Input$CreatePublisherInputToJson(this);
  int get hashCode {
    final l$name = name;
    return Object.hashAll([l$name]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$CreatePublisherInput) ||
        runtimeType != other.runtimeType) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$CreateUserInput {
  Input$CreateUserInput(
      {this.address,
      this.confirmed,
      required this.name,
      required this.password,
      required this.phone,
      this.province});

  @override
  factory Input$CreateUserInput.fromJson(Map<String, dynamic> json) =>
      _$Input$CreateUserInputFromJson(json);

  final String? address;

  final bool? confirmed;

  final String name;

  final String password;

  final String phone;

  final String? province;

  Map<String, dynamic> toJson() => _$Input$CreateUserInputToJson(this);
  int get hashCode {
    final l$address = address;
    final l$confirmed = confirmed;
    final l$name = name;
    final l$password = password;
    final l$phone = phone;
    final l$province = province;
    return Object.hashAll(
        [l$address, l$confirmed, l$name, l$password, l$phone, l$province]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$CreateUserInput) || runtimeType != other.runtimeType)
      return false;
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) return false;
    final l$confirmed = confirmed;
    final lOther$confirmed = other.confirmed;
    if (l$confirmed != lOther$confirmed) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) return false;
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) return false;
    final l$province = province;
    final lOther$province = other.province;
    if (l$province != lOther$province) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$CreateUserRequestInput {
  Input$CreateUserRequestInput({required this.content});

  @override
  factory Input$CreateUserRequestInput.fromJson(Map<String, dynamic> json) =>
      _$Input$CreateUserRequestInputFromJson(json);

  final String content;

  Map<String, dynamic> toJson() => _$Input$CreateUserRequestInputToJson(this);
  int get hashCode {
    final l$content = content;
    return Object.hashAll([l$content]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$CreateUserRequestInput) ||
        runtimeType != other.runtimeType) return false;
    final l$content = content;
    final lOther$content = other.content;
    if (l$content != lOther$content) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$LoginAdminInput {
  Input$LoginAdminInput({required this.email, required this.password});

  @override
  factory Input$LoginAdminInput.fromJson(Map<String, dynamic> json) =>
      _$Input$LoginAdminInputFromJson(json);

  final String email;

  final String password;

  Map<String, dynamic> toJson() => _$Input$LoginAdminInputToJson(this);
  int get hashCode {
    final l$email = email;
    final l$password = password;
    return Object.hashAll([l$email, l$password]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$LoginAdminInput) || runtimeType != other.runtimeType)
      return false;
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) return false;
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$LoginInput {
  Input$LoginInput({required this.password, required this.phone});

  @override
  factory Input$LoginInput.fromJson(Map<String, dynamic> json) =>
      _$Input$LoginInputFromJson(json);

  final String password;

  final String phone;

  Map<String, dynamic> toJson() => _$Input$LoginInputToJson(this);
  int get hashCode {
    final l$password = password;
    final l$phone = phone;
    return Object.hashAll([l$password, l$phone]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$LoginInput) || runtimeType != other.runtimeType)
      return false;
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) return false;
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$ObjectIdInput {
  Input$ObjectIdInput({required this.id});

  @override
  factory Input$ObjectIdInput.fromJson(Map<String, dynamic> json) =>
      _$Input$ObjectIdInputFromJson(json);

  final String id;

  Map<String, dynamic> toJson() => _$Input$ObjectIdInputToJson(this);
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$ObjectIdInput) || runtimeType != other.runtimeType)
      return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$OrderByMap {
  Input$OrderByMap({required this.field, required this.order});

  @override
  factory Input$OrderByMap.fromJson(Map<String, dynamic> json) =>
      _$Input$OrderByMapFromJson(json);

  final String field;

  @JsonKey(unknownEnumValue: Enum$OrderBy.$unknown)
  final Enum$OrderBy order;

  Map<String, dynamic> toJson() => _$Input$OrderByMapToJson(this);
  int get hashCode {
    final l$field = field;
    final l$order = order;
    return Object.hashAll([l$field, l$order]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$OrderByMap) || runtimeType != other.runtimeType)
      return false;
    final l$field = field;
    final lOther$field = other.field;
    if (l$field != lOther$field) return false;
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != lOther$order) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$PlaceOrderInput {
  Input$PlaceOrderInput(
      {required this.address,
      required this.phone,
      required this.province,
      required this.purchases});

  @override
  factory Input$PlaceOrderInput.fromJson(Map<String, dynamic> json) =>
      _$Input$PlaceOrderInputFromJson(json);

  final String address;

  final String phone;

  final String province;

  final List<Input$PurchasePartialInput> purchases;

  Map<String, dynamic> toJson() => _$Input$PlaceOrderInputToJson(this);
  int get hashCode {
    final l$address = address;
    final l$phone = phone;
    final l$province = province;
    final l$purchases = purchases;
    return Object.hashAll([
      l$address,
      l$phone,
      l$province,
      Object.hashAll(l$purchases.map((v) => v))
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$PlaceOrderInput) || runtimeType != other.runtimeType)
      return false;
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) return false;
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) return false;
    final l$province = province;
    final lOther$province = other.province;
    if (l$province != lOther$province) return false;
    final l$purchases = purchases;
    final lOther$purchases = other.purchases;
    if (l$purchases.length != lOther$purchases.length) return false;
    for (int i = 0; i < l$purchases.length; i++) {
      final l$purchases$entry = l$purchases[i];
      final lOther$purchases$entry = lOther$purchases[i];
      if (l$purchases$entry != lOther$purchases$entry) return false;
    }

    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$PurchasePartialInput {
  Input$PurchasePartialInput({required this.product, required this.quantity});

  @override
  factory Input$PurchasePartialInput.fromJson(Map<String, dynamic> json) =>
      _$Input$PurchasePartialInputFromJson(json);

  final Input$ObjectIdInput product;

  final int quantity;

  Map<String, dynamic> toJson() => _$Input$PurchasePartialInputToJson(this);
  int get hashCode {
    final l$product = product;
    final l$quantity = quantity;
    return Object.hashAll([l$product, l$quantity]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$PurchasePartialInput) ||
        runtimeType != other.runtimeType) return false;
    final l$product = product;
    final lOther$product = other.product;
    if (l$product != lOther$product) return false;
    final l$quantity = quantity;
    final lOther$quantity = other.quantity;
    if (l$quantity != lOther$quantity) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$RegisterInput {
  Input$RegisterInput(
      {this.address,
      required this.code,
      required this.name,
      required this.password,
      this.province,
      required this.sessionInfo});

  @override
  factory Input$RegisterInput.fromJson(Map<String, dynamic> json) =>
      _$Input$RegisterInputFromJson(json);

  final String? address;

  final String code;

  final String name;

  final String password;

  final String? province;

  final String sessionInfo;

  Map<String, dynamic> toJson() => _$Input$RegisterInputToJson(this);
  int get hashCode {
    final l$address = address;
    final l$code = code;
    final l$name = name;
    final l$password = password;
    final l$province = province;
    final l$sessionInfo = sessionInfo;
    return Object.hashAll(
        [l$address, l$code, l$name, l$password, l$province, l$sessionInfo]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$RegisterInput) || runtimeType != other.runtimeType)
      return false;
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) return false;
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) return false;
    final l$province = province;
    final lOther$province = other.province;
    if (l$province != lOther$province) return false;
    final l$sessionInfo = sessionInfo;
    final lOther$sessionInfo = other.sessionInfo;
    if (l$sessionInfo != lOther$sessionInfo) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$SendVerificationCodeInput {
  Input$SendVerificationCodeInput(
      {required this.phoneNumber, required this.recaptchaToken});

  @override
  factory Input$SendVerificationCodeInput.fromJson(Map<String, dynamic> json) =>
      _$Input$SendVerificationCodeInputFromJson(json);

  final String phoneNumber;

  final String recaptchaToken;

  Map<String, dynamic> toJson() =>
      _$Input$SendVerificationCodeInputToJson(this);
  int get hashCode {
    final l$phoneNumber = phoneNumber;
    final l$recaptchaToken = recaptchaToken;
    return Object.hashAll([l$phoneNumber, l$recaptchaToken]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$SendVerificationCodeInput) ||
        runtimeType != other.runtimeType) return false;
    final l$phoneNumber = phoneNumber;
    final lOther$phoneNumber = other.phoneNumber;
    if (l$phoneNumber != lOther$phoneNumber) return false;
    final l$recaptchaToken = recaptchaToken;
    final lOther$recaptchaToken = other.recaptchaToken;
    if (l$recaptchaToken != lOther$recaptchaToken) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$UpdateAdminInput {
  Input$UpdateAdminInput({this.email, this.id, this.name, this.password});

  @override
  factory Input$UpdateAdminInput.fromJson(Map<String, dynamic> json) =>
      _$Input$UpdateAdminInputFromJson(json);

  final String? email;

  final String? id;

  final String? name;

  final String? password;

  Map<String, dynamic> toJson() => _$Input$UpdateAdminInputToJson(this);
  int get hashCode {
    final l$email = email;
    final l$id = id;
    final l$name = name;
    final l$password = password;
    return Object.hashAll([l$email, l$id, l$name, l$password]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$UpdateAdminInput) || runtimeType != other.runtimeType)
      return false;
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$UpdateAuthorInput {
  Input$UpdateAuthorInput(
      {required this.id, required this.name, required this.overview});

  @override
  factory Input$UpdateAuthorInput.fromJson(Map<String, dynamic> json) =>
      _$Input$UpdateAuthorInputFromJson(json);

  final String id;

  final String name;

  final String overview;

  Map<String, dynamic> toJson() => _$Input$UpdateAuthorInputToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$overview = overview;
    return Object.hashAll([l$id, l$name, l$overview]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$UpdateAuthorInput) || runtimeType != other.runtimeType)
      return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$overview = overview;
    final lOther$overview = other.overview;
    if (l$overview != lOther$overview) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$UpdateCategoryInput {
  Input$UpdateCategoryInput({required this.id, required this.name});

  @override
  factory Input$UpdateCategoryInput.fromJson(Map<String, dynamic> json) =>
      _$Input$UpdateCategoryInputFromJson(json);

  final String id;

  final String name;

  Map<String, dynamic> toJson() => _$Input$UpdateCategoryInputToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    return Object.hashAll([l$id, l$name]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$UpdateCategoryInput) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$UpdateCollectionInput {
  Input$UpdateCollectionInput({required this.id, required this.name});

  @override
  factory Input$UpdateCollectionInput.fromJson(Map<String, dynamic> json) =>
      _$Input$UpdateCollectionInputFromJson(json);

  final String id;

  final String name;

  Map<String, dynamic> toJson() => _$Input$UpdateCollectionInputToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    return Object.hashAll([l$id, l$name]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$UpdateCollectionInput) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$UpdateOrderInput {
  Input$UpdateOrderInput({required this.id, required this.status});

  @override
  factory Input$UpdateOrderInput.fromJson(Map<String, dynamic> json) =>
      _$Input$UpdateOrderInputFromJson(json);

  final String id;

  @JsonKey(unknownEnumValue: Enum$OrderStatus.$unknown)
  final Enum$OrderStatus status;

  Map<String, dynamic> toJson() => _$Input$UpdateOrderInputToJson(this);
  int get hashCode {
    final l$id = id;
    final l$status = status;
    return Object.hashAll([l$id, l$status]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$UpdateOrderInput) || runtimeType != other.runtimeType)
      return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$UpdatePasswordInput {
  Input$UpdatePasswordInput(
      {required this.code, required this.password, required this.sessionInfo});

  @override
  factory Input$UpdatePasswordInput.fromJson(Map<String, dynamic> json) =>
      _$Input$UpdatePasswordInputFromJson(json);

  final String code;

  final String password;

  final String sessionInfo;

  Map<String, dynamic> toJson() => _$Input$UpdatePasswordInputToJson(this);
  int get hashCode {
    final l$code = code;
    final l$password = password;
    final l$sessionInfo = sessionInfo;
    return Object.hashAll([l$code, l$password, l$sessionInfo]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$UpdatePasswordInput) ||
        runtimeType != other.runtimeType) return false;
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) return false;
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) return false;
    final l$sessionInfo = sessionInfo;
    final lOther$sessionInfo = other.sessionInfo;
    if (l$sessionInfo != lOther$sessionInfo) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$UpdateProductInput {
  Input$UpdateProductInput(
      {required this.author,
      required this.categories,
      required this.collections,
      required this.id,
      this.language,
      required this.name,
      required this.overview,
      this.pages,
      required this.price,
      this.publishedAt,
      this.publisher,
      required this.status});

  @override
  factory Input$UpdateProductInput.fromJson(Map<String, dynamic> json) =>
      _$Input$UpdateProductInputFromJson(json);

  final Input$ObjectIdInput author;

  final List<Input$ObjectIdInput> categories;

  final List<Input$ObjectIdInput> collections;

  final String id;

  final String? language;

  final String name;

  final String overview;

  final int? pages;

  final double price;

  @JsonKey(
      fromJson: _nullable$dateTimeFromJson, toJson: _nullable$dateTimeToJson)
  final DateTime? publishedAt;

  final Input$ObjectIdInput? publisher;

  final String status;

  Map<String, dynamic> toJson() => _$Input$UpdateProductInputToJson(this);
  int get hashCode {
    final l$author = author;
    final l$categories = categories;
    final l$collections = collections;
    final l$id = id;
    final l$language = language;
    final l$name = name;
    final l$overview = overview;
    final l$pages = pages;
    final l$price = price;
    final l$publishedAt = publishedAt;
    final l$publisher = publisher;
    final l$status = status;
    return Object.hashAll([
      l$author,
      Object.hashAll(l$categories.map((v) => v)),
      Object.hashAll(l$collections.map((v) => v)),
      l$id,
      l$language,
      l$name,
      l$overview,
      l$pages,
      l$price,
      l$publishedAt,
      l$publisher,
      l$status
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$UpdateProductInput) ||
        runtimeType != other.runtimeType) return false;
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

    final l$collections = collections;
    final lOther$collections = other.collections;
    if (l$collections.length != lOther$collections.length) return false;
    for (int i = 0; i < l$collections.length; i++) {
      final l$collections$entry = l$collections[i];
      final lOther$collections$entry = lOther$collections[i];
      if (l$collections$entry != lOther$collections$entry) return false;
    }

    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$language = language;
    final lOther$language = other.language;
    if (l$language != lOther$language) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$overview = overview;
    final lOther$overview = other.overview;
    if (l$overview != lOther$overview) return false;
    final l$pages = pages;
    final lOther$pages = other.pages;
    if (l$pages != lOther$pages) return false;
    final l$price = price;
    final lOther$price = other.price;
    if (l$price != lOther$price) return false;
    final l$publishedAt = publishedAt;
    final lOther$publishedAt = other.publishedAt;
    if (l$publishedAt != lOther$publishedAt) return false;
    final l$publisher = publisher;
    final lOther$publisher = other.publisher;
    if (l$publisher != lOther$publisher) return false;
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$UpdateProfileInput {
  Input$UpdateProfileInput(
      {required this.address, required this.name, required this.province});

  @override
  factory Input$UpdateProfileInput.fromJson(Map<String, dynamic> json) =>
      _$Input$UpdateProfileInputFromJson(json);

  final String address;

  final String name;

  final String province;

  Map<String, dynamic> toJson() => _$Input$UpdateProfileInputToJson(this);
  int get hashCode {
    final l$address = address;
    final l$name = name;
    final l$province = province;
    return Object.hashAll([l$address, l$name, l$province]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$UpdateProfileInput) ||
        runtimeType != other.runtimeType) return false;
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$province = province;
    final lOther$province = other.province;
    if (l$province != lOther$province) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$UpdatePublisherInput {
  Input$UpdatePublisherInput({required this.id, required this.name});

  @override
  factory Input$UpdatePublisherInput.fromJson(Map<String, dynamic> json) =>
      _$Input$UpdatePublisherInputFromJson(json);

  final String id;

  final String name;

  Map<String, dynamic> toJson() => _$Input$UpdatePublisherInputToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    return Object.hashAll([l$id, l$name]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$UpdatePublisherInput) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$UpdateUserInput {
  Input$UpdateUserInput(
      {this.address,
      this.confirmed,
      required this.id,
      required this.name,
      this.password,
      required this.phone,
      this.province});

  @override
  factory Input$UpdateUserInput.fromJson(Map<String, dynamic> json) =>
      _$Input$UpdateUserInputFromJson(json);

  final String? address;

  final bool? confirmed;

  final String id;

  final String name;

  final String? password;

  final String phone;

  final String? province;

  Map<String, dynamic> toJson() => _$Input$UpdateUserInputToJson(this);
  int get hashCode {
    final l$address = address;
    final l$confirmed = confirmed;
    final l$id = id;
    final l$name = name;
    final l$password = password;
    final l$phone = phone;
    final l$province = province;
    return Object.hashAll([
      l$address,
      l$confirmed,
      l$id,
      l$name,
      l$password,
      l$phone,
      l$province
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$UpdateUserInput) || runtimeType != other.runtimeType)
      return false;
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) return false;
    final l$confirmed = confirmed;
    final lOther$confirmed = other.confirmed;
    if (l$confirmed != lOther$confirmed) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) return false;
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) return false;
    final l$province = province;
    final lOther$province = other.province;
    if (l$province != lOther$province) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$UpdateUserRequestInput {
  Input$UpdateUserRequestInput(
      {required this.content, required this.id, required this.status});

  @override
  factory Input$UpdateUserRequestInput.fromJson(Map<String, dynamic> json) =>
      _$Input$UpdateUserRequestInputFromJson(json);

  final String content;

  final String id;

  @JsonKey(unknownEnumValue: Enum$UserRequestStatus.$unknown)
  final Enum$UserRequestStatus status;

  Map<String, dynamic> toJson() => _$Input$UpdateUserRequestInputToJson(this);
  int get hashCode {
    final l$content = content;
    final l$id = id;
    final l$status = status;
    return Object.hashAll([l$content, l$id, l$status]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$UpdateUserRequestInput) ||
        runtimeType != other.runtimeType) return false;
    final l$content = content;
    final lOther$content = other.content;
    if (l$content != lOther$content) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$VerificationInput {
  Input$VerificationInput({required this.code, required this.sessionInfo});

  @override
  factory Input$VerificationInput.fromJson(Map<String, dynamic> json) =>
      _$Input$VerificationInputFromJson(json);

  final String code;

  final String sessionInfo;

  Map<String, dynamic> toJson() => _$Input$VerificationInputToJson(this);
  int get hashCode {
    final l$code = code;
    final l$sessionInfo = sessionInfo;
    return Object.hashAll([l$code, l$sessionInfo]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$VerificationInput) || runtimeType != other.runtimeType)
      return false;
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) return false;
    final l$sessionInfo = sessionInfo;
    final lOther$sessionInfo = other.sessionInfo;
    if (l$sessionInfo != lOther$sessionInfo) return false;
    return true;
  }
}

enum Enum$OrderBy {
  @JsonValue('ASC')
  ASC,
  @JsonValue('DESC')
  DESC,
  $unknown
}

enum Enum$OrderStatus {
  @JsonValue('Canceled')
  Canceled,
  @JsonValue('Delivered')
  Delivered,
  @JsonValue('Delivering')
  Delivering,
  @JsonValue('Failed')
  Failed,
  @JsonValue('Pending')
  Pending,
  @JsonValue('Processed')
  Processed,
  $unknown
}

enum Enum$ProductStatus {
  @JsonValue('Available')
  Available,
  @JsonValue('ComingSoon')
  ComingSoon,
  @JsonValue('OnSale')
  OnSale,
  @JsonValue('SoldOut')
  SoldOut,
  $unknown
}

enum Enum$UserRequestStatus {
  @JsonValue('Failed')
  Failed,
  @JsonValue('Pending')
  Pending,
  @JsonValue('Processing')
  Processing,
  @JsonValue('Success')
  Success,
  $unknown
}

const possibleTypesMap = {};
DateTime? _nullable$dateTimeFromJson(dynamic data) =>
    data == null ? null : dateTimeFromJson(data);
dynamic _nullable$dateTimeToJson(DateTime? data) =>
    data == null ? null : dateTimeToJson(data);
