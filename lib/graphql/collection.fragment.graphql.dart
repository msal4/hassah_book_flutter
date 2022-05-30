import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:json_annotation/json_annotation.dart';
part 'collection.fragment.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Fragment$Collection {
  Fragment$Collection(
      {required this.id,
      required this.image,
      required this.name,
      required this.$__typename});

  @override
  factory Fragment$Collection.fromJson(Map<String, dynamic> json) =>
      _$Fragment$CollectionFromJson(json);

  final String id;

  final String image;

  final String name;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Fragment$CollectionToJson(this);
  int get hashCode {
    final l$id = id;
    final l$image = image;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$image, l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Fragment$Collection) || runtimeType != other.runtimeType)
      return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Fragment$Collection on Fragment$Collection {
  Fragment$Collection copyWith(
          {String? id, String? image, String? name, String? $__typename}) =>
      Fragment$Collection(
          id: id == null ? this.id : id,
          image: image == null ? this.image : image,
          name: name == null ? this.name : name,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const fragmentDefinitionCollection = FragmentDefinitionNode(
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
          selectionSet: null),
      FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null)
    ]));
const queryDocumentCollection = DocumentNode(definitions: [
  fragmentDefinitionCollection,
]);

extension ClientExtension$Fragment$Collection on graphql.GraphQLClient {
  void writeFragment$Collection(
          {required Fragment$Collection data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'Collection',
                  document: queryDocumentCollection)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$Collection? readFragment$Collection(
      {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'Collection', document: queryDocumentCollection)),
        optimistic: optimistic);
    return result == null ? null : Fragment$Collection.fromJson(result);
  }
}

@JsonSerializable(explicitToJson: true)
class Fragment$PaginatedCollectionResponse {
  Fragment$PaginatedCollectionResponse(
      {required this.items,
      required this.hasMore,
      required this.total,
      required this.$__typename});

  @override
  factory Fragment$PaginatedCollectionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedCollectionResponseFromJson(json);

  final List<Fragment$PaginatedCollectionResponse$items> items;

  final bool hasMore;

  final int total;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedCollectionResponseToJson(this);
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
    if (!(other is Fragment$PaginatedCollectionResponse) ||
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

extension UtilityExtension$Fragment$PaginatedCollectionResponse
    on Fragment$PaginatedCollectionResponse {
  Fragment$PaginatedCollectionResponse copyWith(
          {List<Fragment$PaginatedCollectionResponse$items>? items,
          bool? hasMore,
          int? total,
          String? $__typename}) =>
      Fragment$PaginatedCollectionResponse(
          items: items == null ? this.items : items,
          hasMore: hasMore == null ? this.hasMore : hasMore,
          total: total == null ? this.total : total,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const fragmentDefinitionPaginatedCollectionResponse = FragmentDefinitionNode(
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
                name: NameNode(value: 'Collection'), directives: []),
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
const queryDocumentPaginatedCollectionResponse = DocumentNode(definitions: [
  fragmentDefinitionPaginatedCollectionResponse,
  fragmentDefinitionCollection,
]);

extension ClientExtension$Fragment$PaginatedCollectionResponse
    on graphql.GraphQLClient {
  void writeFragment$PaginatedCollectionResponse(
          {required Fragment$PaginatedCollectionResponse data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'PaginatedCollectionResponse',
                  document: queryDocumentPaginatedCollectionResponse)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$PaginatedCollectionResponse?
      readFragment$PaginatedCollectionResponse(
          {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'PaginatedCollectionResponse',
                document: queryDocumentPaginatedCollectionResponse)),
        optimistic: optimistic);
    return result == null
        ? null
        : Fragment$PaginatedCollectionResponse.fromJson(result);
  }
}

@JsonSerializable(explicitToJson: true)
class Fragment$PaginatedCollectionResponse$items
    implements Fragment$Collection {
  Fragment$PaginatedCollectionResponse$items(
      {required this.id,
      required this.image,
      required this.name,
      required this.$__typename});

  @override
  factory Fragment$PaginatedCollectionResponse$items.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$PaginatedCollectionResponse$itemsFromJson(json);

  final String id;

  final String image;

  final String name;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$PaginatedCollectionResponse$itemsToJson(this);
  int get hashCode {
    final l$id = id;
    final l$image = image;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$image, l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Fragment$PaginatedCollectionResponse$items) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Fragment$PaginatedCollectionResponse$items
    on Fragment$PaginatedCollectionResponse$items {
  Fragment$PaginatedCollectionResponse$items copyWith(
          {String? id, String? image, String? name, String? $__typename}) =>
      Fragment$PaginatedCollectionResponse$items(
          id: id == null ? this.id : id,
          image: image == null ? this.image : image,
          name: name == null ? this.name : name,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
