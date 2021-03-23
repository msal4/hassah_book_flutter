import 'package:flutter/material.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';

class CategoriesPage extends StatelessWidget {
  final categoriesList = List<String>.generate(20, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, idx) {
        return ListTile(title: Text(categoriesList[idx]));
      },
      separatorBuilder: (context, idx) => SizedBox(height: kDefaultPadding),
      itemCount: categoriesList.length,
    );
  }
}
