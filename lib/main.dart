import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/graphql_provider.dart';
import 'package:hassah_book_flutter/app/pages/home.dart';

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
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: "Dubai",
        ),
        routes: {
          '/': (context) => Main(),
        },
      ),
    );
  }
}

class Main extends HookWidget {
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
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentTab.value,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Categories and Collections',
              icon: Icon(Icons.menu_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Bookmarks',
              icon: Icon(Icons.bookmark_border_outlined),
            ),
          ],
          onTap: (index) => currentTab.value = index,
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
}
