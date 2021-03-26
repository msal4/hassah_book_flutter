import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/graphql_provider.dart';
import 'package:hassah_book_flutter/app/pages/bookmarks.dart';
import 'package:hassah_book_flutter/app/pages/categories.dart';
import 'package:hassah_book_flutter/app/pages/home.dart';
import 'package:hassah_book_flutter/app/pages/product_detail.dart';
import 'package:hassah_book_flutter/app/pages/search.dart';
import 'package:hassah_book_flutter/app/pages/transitions/fade.dart';
import 'package:hassah_book_flutter/common/utils/color.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';

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
    final theme = ThemeData(
      primarySwatch: createMaterialColor(Color(0xFFFA784A)),
      accentColor: Color(0xFF45AE9E),
      scaffoldBackgroundColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: "Dubai",
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: theme.scaffoldBackgroundColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: HassahGraphQLProvider(
        uri: 'http://100.93.34.121:4000/graphql',
        child: MaterialApp(
          title: 'Hassah Book',
          theme: theme,
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case "/search":
                return createRouteWithFadeTransition(builder: (context, _, __) => SearchPage());
              case '/products':
                return MaterialPageRoute(builder: (context) => ProductDetailPage(product: settings.arguments));
              default:
                return null;
            }
          },
          routes: {
            '/': (context) => MainPage(),
          },
        ),
      ),
    );
  }
}

const _kMinVelocityToHideAppBar = 0.0;
const _kMaxVelocityToShowAdapter = -5.0;

class MainPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final currentTab = useState(0);
    final appBarVisible = useState(true);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        bottomNavigationBar: _buildBottomNavigationBar(currentTab, appBarVisible),
        body: Stack(
          children: [
            NotificationListener<ScrollNotification>(
              onNotification: (notification) => _onScrollNotification(notification, appBarVisible),
              child: IndexedStack(
                index: currentTab.value,
                children: [HomePage(), CategoriesPage(), BookmarksPage()],
              ),
            ),
            _buildAppBar(context, appBarVisible.value),
          ],
        ),
      ),
    );
  }

  bool _onScrollNotification(ScrollNotification notification, ValueNotifier<bool> appBarVisible) {
    if (notification.metrics.axis != Axis.vertical) return true;

    // when the scroll has settled on the scroll extent then always show the app bar.
    if (notification.metrics.atEdge) {
      appBarVisible.value = true;
      return true;
    }

    // only hide/show the app bar if the user is scrolling to ignore the scroll animation as
    // it causes issues when switching between tabs.
    if (notification is ScrollUpdateNotification && notification.dragDetails != null) {
      if (notification.scrollDelta > _kMinVelocityToHideAppBar && notification.metrics.pixels > kAppBarHeight / 2) {
        appBarVisible.value = false;
      } else if (notification.scrollDelta < _kMaxVelocityToShowAdapter) {
        appBarVisible.value = true;
      }
    }
    return true;
  }

  Widget _buildAppBar(BuildContext context, bool isVisible) {
    final padding = MediaQuery.of(context).padding;
    final bgColor = Theme.of(context).scaffoldBackgroundColor;

    return AnimatedOpacity(
      opacity: isVisible ? 1 : 0,
      duration: Duration(milliseconds: 300),
      child: IgnorePointer(
        ignoring: !isVisible,
        child: Container(
          height: kAppBarHeight + padding.top,
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [bgColor, bgColor.withOpacity(0)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: SafeArea(
            child: Row(
              children: [
                Spacer(),
                SvgPicture.asset("assets/svg/bag.svg"),
                SizedBox(width: kDefaultPadding),
                CircleAvatar(
                  radius: kAppBarHeight / 2,
                  backgroundImage: AssetImage("assets/images/avatar_placeholder.jpeg"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildBottomNavigationBar(ValueNotifier<int> currentTab, ValueNotifier<bool> appBarVisible) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(_kNavBarRadius), topRight: Radius.circular(_kNavBarRadius)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: BottomNavigationBar(
        elevation: 0,
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
        onTap: (index) {
          appBarVisible.value = true;
          currentTab.value = index;
        },
      ),
    );
  }

  Widget _buildIcon(String name, int idx, int currentIdx) => SvgPicture.asset("assets/svg/$name${idx == currentIdx ? "_filled" : ""}.svg");
}
