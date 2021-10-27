import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hassah_book_flutter/app/pages/product_detail.dart';
import 'package:hassah_book_flutter/app/pages/search.dart';
import 'package:hassah_book_flutter/app/widgets/chips.dart';
import 'package:hassah_book_flutter/app/widgets/round_container.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/utils/ext.dart';
import 'package:hassah_book_flutter/common/utils/rand.dart';
import "package:path/path.dart" as path;

const _kBookmarkIconWidth = 20.0;
const _kBookmarkIconHeight = 35.0;

class ProductDetailsCard extends HookWidget {
  const ProductDetailsCard({
    Key key,
    @required this.product,
    this.isBookmarked = false,
    this.onBookmarkTap,
  })  : assert(product != null),
        assert(isBookmarked != null),
        super(key: key);

  final ProductMixin product;
  final bool isBookmarked;
  final FutureOr<void> Function() onBookmarkTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLoading = useState(false);
    final heroTagPrefix = useMemoized(generateRandomString);

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              ProductDetailPage.routeName,
              arguments: ProductDetailPageArguments(
                product: product,
                heroTagPrefix: heroTagPrefix,
              ),
            );
          },
          child: RoundContainer(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: "image-$heroTagPrefix-${product.id}",
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                    ),
                    child: FadeInImage.assetNetwork(
                      placeholder: "assets/images/product_placeholder.png",
                      image:
                          path.join(kImageCDN, product.image) + "?w=200&h=200",
                      fit: BoxFit.cover,
                      width: kSmallProductImageWidth,
                      height: kSmallProductImageHeight,
                    ),
                  ),
                ),
                const SizedBox(width: kDefaultPadding),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.name,
                          style: theme.textTheme.headline6,
                          overflow: TextOverflow.ellipsis),
                      Text("${context.loc.by} ${product.author.name}",
                          style: theme.textTheme.bodyText2,
                          overflow: TextOverflow.ellipsis),
                      const SizedBox(height: kDefaultPadding / 2),
                      Chips(
                        onChipPressed: (item) => Navigator.pushNamed(
                          context,
                          SearchPage.routeName,
                          arguments: SearchPageArguments(categoryID: item.id),
                        ),
                        items: product.categories
                            .map((e) => ChipItem(id: e.id, label: e.name))
                            .toList(),
                        collapsable: false,
                        backgroundColor: theme.scaffoldBackgroundColor,
                        textColor: theme.textTheme.bodyText1.color,
                        maxNumChips: 2,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isBookmarked)
          Positioned(
            right: kDefaultPadding / 2,
            child: GestureDetector(
              onTap: () async {
                isLoading.value = true;
                await onBookmarkTap();
                isLoading.value = false;
              },
              child: Container(
                width: _kBookmarkIconWidth,
                height: _kBookmarkIconHeight,
                decoration: BoxDecoration(
                  color: isLoading.value
                      ? Colors.grey.shade800
                      : theme.accentColor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5)),
                ),
                padding: const EdgeInsets.only(top: _kBookmarkIconHeight / 4),
                child: const Icon(
                  Icons.bookmark_rounded,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
