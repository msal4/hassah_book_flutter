import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 4)
class CartItem extends HiveObject {
  CartItem({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.quantity,
    @required this.price,
    @required this.authorName,
  });

  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String image;

  @HiveField(3)
  int quantity;

  @HiveField(4)
  double price;

  @HiveField(5)
  String authorName;

  @override
  String toString() => "{id: $id, name: $name, quantity: $quantity, price: $price, image: $image}";
}
