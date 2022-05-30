import 'package:flutter/material.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/widgets/product_card.dart';

const _kDefaultRowHeight = 280.0;

class ProductsRow extends StatelessWidget {
  const ProductsRow({Key? key, required this.title, required this.items})
      : assert(title != null && items != null),
        super(key: key);

  final String title;
  final List<ProductMixin> items;

  @override
  Widget build(BuildContext context) {
    final leftPadding = MediaQuery.of(context).padding.left + kDefaultPadding;
    final rightPadding = MediaQuery.of(context).padding.right + kDefaultPadding;

    if (items.length == 0) {
      return const SizedBox();
    }

    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
          child: Text(title,
              style: textTheme.headline6!.copyWith(color: Colors.grey.shade800)),
        ),
        const SizedBox(height: kDefaultPadding / 2),
        Container(
          height: _kDefaultRowHeight,
          child: ListView.separated(
            padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final product = items[index];

              return ProductCard(product: product);
            },
            separatorBuilder: (_, __) => const SizedBox(width: kDefaultPadding),
          ),
        ),
      ],
    );
  }
}
