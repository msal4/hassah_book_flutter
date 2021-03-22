import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/graphql_provider.dart';
import 'package:hassah_book_flutter/app/pages/home.dart';
import 'package:hassah_book_flutter/common/utils/color.dart';

import 'app/pages/product_detail.dart';

const _kNavBarRadius = 30.0;

void main() async {
  await initHiveForFlutter();

  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return HassahGraphQLProvider(
      uri: 'http://localhost:4000/graphql',
      child: MaterialApp(
        title: 'Hassah Book',
        theme: ThemeData(
          primarySwatch: createMaterialColor(Color(0xFFFA784A)),
          accentColor: Color(0xFF45AE9E),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: "Dubai",
        ),
        routes: {
          '/': (context) => MainPage(),
          '/products': (context) => ProductDetailPage(),
        },
      ),
    );
  }
}

class MainPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final currentTab = useState(0);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            SvgPicture.asset("assets/svg/bag.svg"),
            CircleAvatar(
              maxRadius: kToolbarHeight,
              backgroundImage: AssetImage("assets/images/avatar_placeholder.jpeg"),
            ),
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(_kNavBarRadius), topRight: Radius.circular(_kNavBarRadius)),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
          ),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.grey.shade100,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentTab.value,
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: _buildIcon("home", 0, currentTab.value),
              ),
              BottomNavigationBarItem(
                label: 'Categories and Collections',
                icon: _buildIcon("categories", 1, currentTab.value),
              ),
              BottomNavigationBarItem(
                label: 'Bookmarks',
                icon: _buildIcon("bookmark", 2, currentTab.value),
              ),
            ],
            onTap: (index) => currentTab.value = index,
          ),
        ),
        body: IndexedStack(
          index: currentTab.value,
          children: [
            HomePage(),
            Text('Still working on categories'),
            Text('Bookmarks'),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(String name, int idx, int currentIdx) => SvgPicture.asset("assets/svg/$name${idx == currentIdx ? "_filled" : ""}.svg");
}
