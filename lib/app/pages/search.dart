import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hassah_book_flutter/app/widgets/chips.dart';
import 'package:hassah_book_flutter/app/widgets/round_container.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/widgets/product_card.dart';

const _kAuthorAvatarRadius = 50.0;

class SearchPage extends HookWidget {
  static const routeName = "/search";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = MediaQuery.of(context).padding;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(kDefaultRadius * 2),
                topRight: Radius.circular(kDefaultRadius * 2),
              ),
            ),
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [_buildSliverAppBar(context)];
              },
              body: ListView.separated(
                padding: EdgeInsets.only(top: kDefaultPadding, bottom: kDefaultPadding + padding.top),
                itemBuilder: (context, idx) {
                  if (idx == 0) {
                    return _buildAuthorsRow(theme);
                  }

                  return RoundContainer(
                    color: theme.scaffoldBackgroundColor,
                    margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildImage(""),
                        SizedBox(width: kDefaultPadding),
                        Expanded(child: _buildProductInfo(theme.textTheme)),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, idx) => SizedBox(height: kDefaultPadding),
                itemCount: 50,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAuthorsRow(ThemeData theme) {
    return Container(
      height: _kAuthorAvatarRadius * 2 + 30,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, idx) => _buildAuthor(theme),
        separatorBuilder: (_, __) => SizedBox(width: kDefaultPadding),
      ),
    );
  }

  Widget _buildAuthor(ThemeData theme) {
    return Container(
      width: _kAuthorAvatarRadius * 2,
      child: Column(
        children: [
          CircleAvatar(
            radius: _kAuthorAvatarRadius,
            backgroundColor: Colors.grey.shade100,
            backgroundImage: AssetImage("assets/images/product_placeholder.png"),
            foregroundImage: NetworkImage(""),
          ),
          SizedBox(height: 5),
          Text(
            "Alfred Hitchcock",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyText1.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildProductInfo(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("This is a Test Name fsdf sd fs", style: textTheme.headline6, overflow: TextOverflow.ellipsis),
        Text("by John Wick", style: textTheme.bodyText2, overflow: TextOverflow.ellipsis),
        SizedBox(height: kDefaultPadding / 2),
        Chips(items: List<String>.generate(20, (idx) => "item $idx"), collapsable: false)
      ],
    );
  }

  Widget _buildImage(String url) {
    return Container(
      width: kDefaultImageWidth / 2,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(kDefaultRadius)),
      child: Image.network(
        url,
        fit: BoxFit.cover,
        frameBuilder: (ctx, child, _, __) => Image.asset("assets/images/product_placeholder.png"),
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SliverAppBar(
      floating: true,
      snap: true,
      toolbarHeight: kAppBarHeight,
      backgroundColor: Colors.grey.shade100,
      titleSpacing: 0,
      leading: SizedBox(),
      leadingWidth: 0,
      title: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Row(
          children: [
            _buildBackButton(context),
            SizedBox(width: kDefaultPadding),
            Expanded(
              child: TextField(
                autofocus: true,
                style: textTheme.headline6,
                decoration: InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(width: kDefaultPadding / 2),
            Icon(Icons.search),
            SizedBox(width: kDefaultPadding),
            Icon(Icons.filter_list),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Tooltip(
      message: MaterialLocalizations.of(context).backButtonTooltip,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
          color: Colors.grey.shade800,
        ),
      ),
    );
  }
}
