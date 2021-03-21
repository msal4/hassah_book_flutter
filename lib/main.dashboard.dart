import 'package:flutter/material.dart';
import 'package:hassah_book_flutter/dashboard/graphql_provider.dart';
import 'package:hassah_book_flutter/dashboard/pages/login.dart';
import 'package:hassah_book_flutter/dashboard/pages/products.dart';
import 'package:hassah_book_flutter/dashboard/pages/root.dart';

void main() {
  runApp(Main());
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return DashboardGraphQLProvider(
      uri: 'http://localhost:4000/graphql',
      child: MaterialApp(
        routes: {
          RootPage.routeName: (context) => RootPage(),
          LoginPage.routeName: (context) => LoginPage(),
          ProductsPage.routeName: (context) => ProductsPage(),
        },
      ),
    );
  }
}
