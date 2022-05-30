import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:hassah_book_flutter/common/utils/coercers.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.fragment.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Fragment$User {
  Fragment$User(
      {required this.id,
      required this.name,
      required this.phone,
      this.province,
      this.address,
      required this.createdAt,
      required this.$__typename});

  @override
  factory Fragment$User.fromJson(Map<String, dynamic> json) =>
      _$Fragment$UserFromJson(json);

  final String id;

  final String name;

  final String phone;

  final String? province;

  final String? address;

  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime createdAt;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Fragment$UserToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$phone = phone;
    final l$province = province;
    final l$address = address;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$phone,
      l$province,
      l$address,
      l$createdAt,
      l$$__typename
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Fragment$User) || runtimeType != other.runtimeType)
      return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) return false;
    final l$province = province;
    final lOther$province = other.province;
    if (l$province != lOther$province) return false;
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) return false;
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Fragment$User on Fragment$User {
  Fragment$User copyWith(
          {String? id,
          String? name,
          String? phone,
          String? Function()? province,
          String? Function()? address,
          DateTime? createdAt,
          String? $__typename}) =>
      Fragment$User(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          phone: phone == null ? this.phone : phone,
          province: province == null ? this.province : province(),
          address: address == null ? this.address : address(),
          createdAt: createdAt == null ? this.createdAt : createdAt,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const fragmentDefinitionUser = FragmentDefinitionNode(
    name: NameNode(value: 'User'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(name: NameNode(value: 'User'), isNonNull: false)),
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
          name: NameNode(value: 'phone'),
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
const queryDocumentUser = DocumentNode(definitions: [
  fragmentDefinitionUser,
]);

extension ClientExtension$Fragment$User on graphql.GraphQLClient {
  void writeFragment$User(
          {required Fragment$User data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'User', document: queryDocumentUser)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$User? readFragment$User(
      {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'User', document: queryDocumentUser)),
        optimistic: optimistic);
    return result == null ? null : Fragment$User.fromJson(result);
  }
}
