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
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/products');
          },
          child: Container(
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(kDefaultRadius),
                  child: Image.network(
                    product.image,
                    fit: BoxFit.cover,
                    frameBuilder: (ctx, child, _, __) => Image.asset("assets/images/product_placeholder.png"),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  product.name,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.headline6,
                ),
                SizedBox(height: 5),
                Text(
                  "by ${product.author.name}",
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyText2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
