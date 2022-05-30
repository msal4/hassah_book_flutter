import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hassah_book_flutter/app/pages/product_detail.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/utils/ext.dart';
import 'package:hassah_book_flutter/common/utils/image.dart';
import 'package:hassah_book_flutter/common/utils/rand.dart';

class ProductCard extends HookWidget {
  const ProductCard(
      {Key? key, required this.product, this.width = kDefaultImageWidth})
      : super(key: key);

  final ProductMixin product;
  final double width;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final heroTagPrefix = useMemoized(generateRandomString);

    return Tooltip(
      message: "${product.name} ${context.loc!.by} ${product.author.name}",
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () async {
            final page = await Future.microtask(
              () => ProductDetailPage(
                product: product,
                heroTagPrefix: heroTagPrefix,
              ),
            );

            Navigator.push(context, MaterialPageRoute(builder: (_) => page));

            // Navigator.pushNamed(
            //   context,
            //   ProductDetailPage.routeName,
            //   arguments: ProductDetailPageArguments(
            //     product: product,
            //     heroTagPrefix: heroTagPrefix,
            //   ),
            // );
          },
          child: Container(
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: "image-$heroTagPrefix-${product.id}",
                  child: ProductCoverImage(
                    image: product.image,
                    width: width,
                    resolution: 300,
                  ),
                ),
                Text(
                  product.name,
                  style: textTheme.headline6,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "${product.author.name}",
                  style: textTheme.bodyText2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCoverImage extends StatelessWidget {
  const ProductCoverImage(
      {Key? key,
      required this.image,
      this.width = kDefaultImageWidth,
      this.resolution = 500})
      : super(key: key);

  final String image;
  final double width;
  final int resolution;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      ),
      child: AspectRatio(
        aspectRatio: kCoverAspectRatio,
        child: FadeInImage.assetNetwork(
          imageErrorBuilder: (ctx, obj, trace) {
            return Image.asset(
              "assets/images/product_placeholder.png",
              fit: BoxFit.cover,
            );
          },
          placeholder: "assets/images/product_placeholder.png",
          image: imageURL(image, resolution),
          fit: BoxFit.cover,
          width: width,
        ),
      ),
    );
  }
}
