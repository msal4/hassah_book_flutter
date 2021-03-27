import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hassah_book_flutter/app/widgets/round_container.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';

class CategoriesPage extends HookWidget {
  final categoriesList = List<String>.generate(20, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final padding = MediaQuery.of(context).padding;

    return ListView.separated(
      padding: EdgeInsets.all(kDefaultPadding).copyWith(
        top: padding.top + kAppBarHeight + kDefaultPadding,
        bottom: padding.bottom + kDefaultPadding,
      ),
      itemBuilder: (context, idx) {
        return _buildCategoryItem(idx, textTheme);
      },
      separatorBuilder: (context, idx) => SizedBox(height: kDefaultPadding),
      itemCount: categoriesList.length,
    );
  }

  GestureDetector _buildCategoryItem(int idx, TextTheme textTheme) {
    return GestureDetector(
      onTap: () {},
      child: RoundContainer(
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              categoriesList[idx],
              style: textTheme.subtitle1.copyWith(
                color: Colors.grey.shade800,
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey.shade800)
          ],
        ),
      ),
    );
  }
}
