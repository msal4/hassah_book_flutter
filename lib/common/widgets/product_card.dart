import 'package:flutter/material.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';

const _kDefaultImageWidth = 150.0;

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    @required this.product,
    this.width = _kDefaultImageWidth,
  }) : super(key: key);

  final ProductMixin product;
  final double width;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Tooltip(
      message: "${product.name} by ${product.author.name}",
      child: Material(
        borderRadius: BorderRadius.circular(kDefaultRadius),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/products', arguments: product);
          },
          child: Container(
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: "image-${product.id}",
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kDefaultRadius),
                    ),
                    child: Image.network(
                      product.image,
                      fit: BoxFit.cover,
                      frameBuilder: (ctx, child, _, __) => Image.asset("assets/images/product_placeholder.png"),
                    ),
                  ),
                ),
                Text(product.name, style: textTheme.headline6, overflow: TextOverflow.ellipsis),
                Text("by ${product.author.name}", style: textTheme.bodyText2, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
