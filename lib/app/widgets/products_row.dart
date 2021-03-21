import 'package:flutter/material.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/widgets/product_card.dart';

const _kDefaultRowHeight = 300.0;

class ProductsRow extends StatelessWidget {
  const ProductsRow({Key key, @required this.title, @required this.items})
      : assert(title != null && items != null),
        super(key: key);

  final String title;
  final List<ProductMixin> items;

  @override
  Widget build(BuildContext context) {
    if (items.length == 0) {
      return SizedBox();
    }

    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: kDefaultPadding),
          child: Text(title, style: textTheme.headline6),
        ),
        SizedBox(height: 10),
        Container(
          height: _kDefaultRowHeight,
          child: ListView.separated(
            padding: const EdgeInsets.only(left: kDefaultPadding),
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final product = items[index];

              return ProductCard(product: product);
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 20);
            },
          ),
        ),
      ],
    );
  }
}
