import 'package:flutter/material.dart';

class AuthorPage extends StatelessWidget {
  static const routeName = "/author";

  const AuthorPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(title: Text("Author Details"), floating: true, snap: true),
        ],
        body: ListView(
          children: [],
        ),
      ),
    );
  }
}
