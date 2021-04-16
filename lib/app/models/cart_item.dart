import 'package:hive/hive.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 4)
class CartItem extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String image;

  @HiveField(3)
  int quantity;
}
