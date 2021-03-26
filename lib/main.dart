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
import 'package:hassah_book_flutter/app/pages/profile.dart';
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

const _kOrangeColor = Color(0xFFFA784A);
const _kGreenColor = Color(0xFF45AE9E);

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData(
      primarySwatch: createMaterialColor(_kOrangeColor),
      accentColor: _kGreenColor,
      scaffoldBackgroundColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: "Dubai",
    );

    // configure the app bar
    theme = theme.copyWith(
      appBarTheme: theme.appBarTheme.copyWith(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
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
              case SearchPage.routeName:
                return createRouteWithFadeTransition(builder: (context, _, __) => SearchPage());
              case ProductDetailPage.routeName:
                return MaterialPageRoute(builder: (context) => ProductDetailPage(product: settings.arguments));
              default:
                return null;
            }
          },
          routes: {
            MainPage.routeName: (context) => MainPage(),
            ProfilePage.routeName: (context) => ProfilePage(),
          },
        ),
      ),
    );
  }
}

const _kMinVelocityToHideAppBar = 0.0;
const _kMaxVelocityToShowAdapter = -5.0;

class MainPage extends HookWidget {
  static const routeName = "/";

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
        bottomNavigationBar: _buildBottomNavigationBar(context, currentTab, appBarVisible),
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
            gradient: LinearGradient(
              colors: [bgColor, bgColor.withOpacity(0)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Row(
              children: [
                Spacer(),
                SvgPicture.asset("assets/svg/bag.svg"),
                SizedBox(width: kDefaultPadding),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(ProfilePage.routeName);
                  },
                  child: CircleAvatar(
                    radius: kAppBarHeight / 2,
                    backgroundImage: AssetImage("assets/images/avatar_placeholder.jpeg"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context, ValueNotifier<int> currentTab, ValueNotifier<bool> appBarVisible) {
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
