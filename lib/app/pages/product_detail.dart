import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hassah_book_flutter/app/widgets/chips.dart';
import 'package:hassah_book_flutter/app/widgets/round_container.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';

class ProductDetailPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context).settings.arguments as ProductMixin;
    final theme = Theme.of(context);
    final overviewClipped = useState(true);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(product.name),
            centerTitle: true,
            floating: true,
            backgroundColor: theme.scaffoldBackgroundColor,
            snap: true,
          ),
          SliverToBoxAdapter(
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  children: [
                    _buildProductImage(product),
                    SizedBox(height: kDefaultPadding),
                    Chips(items: product.categories.map((e) => e.name)),
                    SizedBox(height: kDefaultPadding * 2),
                    _buildProductHeader(product, theme),
                    SizedBox(height: kDefaultPadding),
                    RoundContainer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildInfoColumn(title: "Rating", value: "3.2", theme: theme),
                          _buildDivider(),
                          _buildInfoColumn(title: "Pages", value: "150", theme: theme),
                          _buildDivider(),
                          _buildInfoColumn(title: "Language", value: "English", theme: theme)
                        ],
                      ),
                    ),
                    SizedBox(height: kDefaultPadding),
                    GestureDetector(
                      onTap: () {
                        overviewClipped.value = !overviewClipped.value;
                      },
                      child: Text(
                        "Movember Nostrilis tickler magnum pi Louis xiii professor plum graeme souness sweat irrigator,, ding-dong Louis xiii socially mobile Louis xiii movember graeme souness magnum pi sweat irrigator, Nostrilis tickler professor",
                        style: theme.textTheme.bodyText1.copyWith(color: Colors.grey.shade800),
                        overflow: overviewClipped.value ? TextOverflow.ellipsis : null,
                      ),
                    ),
                    SizedBox(height: kDefaultPadding),
                    Row(
                      children: [
                        Expanded(
                          child: RoundContainer(
                            child: Row(
                              children: [
                                Text("QTY"),
                                Spacer(),
                                Icon(Icons.remove),
                                SizedBox(width: kDefaultPadding),
                                Text("2", style: theme.textTheme.subtitle1.copyWith(color: theme.accentColor, fontWeight: FontWeight.bold)),
                                SizedBox(width: kDefaultPadding),
                                Icon(Icons.add),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: kDefaultPadding),
                        RoundContainer(
                          color: theme.primaryColor,
                          child: Text(
                            "Add to Cart",
                            style: theme.textTheme.button.copyWith(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _buildProductHeader(ProductMixin product, ThemeData theme) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("\$${product.price}", style: theme.textTheme.headline5.copyWith(fontWeight: FontWeight.bold, color: theme.accentColor)),
              Text(product.name, style: theme.textTheme.headline6),
              Text("by ${product.author.name}", style: theme.textTheme.bodyText2),
            ],
          ),
        ),
        SizedBox(width: kDefaultPadding),
        Container(
          padding: const EdgeInsets.all(kDefaultPadding / 2),
          decoration: BoxDecoration(color: theme.accentColor, borderRadius: BorderRadius.circular(9999)),
          child: Icon(Icons.bookmark, color: Colors.white, size: 20),
        )
      ],
    );
  }

  Center _buildProductImage(ProductMixin product) {
    return Center(
      child: Hero(
        tag: "image-${product.id}",
        child: Container(
          width: 200,
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
    );
  }

  Column _buildInfoColumn({@required String title, @required String value, @required ThemeData theme}) {
    return Column(
      children: [
        Text(title, style: theme.textTheme.bodyText1.copyWith(color: Colors.grey.shade800)),
        Text(value, style: theme.textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Center _buildDivider() {
    return Center(
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(width: 1, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
