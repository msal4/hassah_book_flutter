import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/auth_provider.dart';
import 'package:hassah_book_flutter/app/bookmarks_provider.dart';
import 'package:hassah_book_flutter/app/graphql_provider.dart';
import 'package:hassah_book_flutter/app/models/cart_item.dart';
import 'package:hassah_book_flutter/app/pages/author.dart';
import 'package:hassah_book_flutter/app/pages/bookmarks.dart';
import 'package:hassah_book_flutter/app/pages/captcha.dart';
import 'package:hassah_book_flutter/app/pages/cart.dart';
import 'package:hassah_book_flutter/app/pages/categories.dart';
import 'package:hassah_book_flutter/app/pages/contact_us.dart';
import 'package:hassah_book_flutter/app/pages/home.dart';
import 'package:hassah_book_flutter/app/pages/login.dart';
import 'package:hassah_book_flutter/app/pages/order_detail.dart';
import 'package:hassah_book_flutter/app/pages/orders.dart';
import 'package:hassah_book_flutter/app/pages/otp.dart';
import 'package:hassah_book_flutter/app/pages/personal_information.dart';
import 'package:hassah_book_flutter/app/pages/product_detail.dart';
import 'package:hassah_book_flutter/app/pages/profile.dart';
import 'package:hassah_book_flutter/app/pages/search.dart';
import 'package:hassah_book_flutter/app/pages/signup.dart';
import 'package:hassah_book_flutter/app/pages/transitions/fade.dart';
import 'package:hassah_book_flutter/common/auth/auth.dart';
import 'package:hassah_book_flutter/common/utils/color.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/utils/ext.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as path;

void main() async {
  await initHiveForFlutter();
  // Cart Box
  Hive.registerAdapter(CartItemAdapter());

  await Hive.openBox(kAuthBoxName);
  await Hive.openBox(kLocaleBoxName);
  await Hive.openBox<CartItem>(kCartBoxName);

  final isAuthenticated = Auth.getToken(TokenType.Access) != null;
  String? locale = Hive.box(kLocaleBoxName).get("locale");
  if (locale == null || locale.isEmpty) {
    locale = (Platform.localeName.startsWith("ar")) ? "ar" : "en";
  }

  runApp(App(isAuthenticated: isAuthenticated, locale: Locale(locale)));
}

class App extends StatefulWidget {
  const App({required this.isAuthenticated, required this.locale});

  final bool isAuthenticated;
  final Locale locale;

  @override
  _AppState createState() => _AppState();

  static _AppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_AppState>();
}

const _kOrangeColor = Color(0xFFFA784A);
const _kGreenColor = Color(0xFF45AE9E);

class _AppState extends State<App> {
  Locale? _locale;

  @override
  void initState() {
    _locale = widget.locale;
    super.initState();
  }

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
      Hive.box(kLocaleBoxName).put("locale", _locale!.languageCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = _buildTheme();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: theme.backgroundColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: HassahGraphQLProvider(
        uri: path.join(kApiURLPrefix, "graphql"),
        builder: (context, client) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) {
                  final provider = AuthProvider(
                    client: client,
                    isAuthenticated: widget.isAuthenticated,
                  );
                  Auth.provider = provider;
                  return provider;
                },
              ),
              ChangeNotifierProvider(
                  create: (context) => BookmarksProvider(client: client)),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateTitle: (context) {
                return context.loc!.appTitle;
              },
              theme: theme,
              locale: _locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              onGenerateRoute: (settings) {
                // The reason I'm declaring the routes in two places is because some routes require a custom
                // transition or arguments. I could've passed the arguments in the `routes` part as well but
                // I wanted it to be clearer and it's also easier to write this way.
                switch (settings.name) {
                  case SearchPage.routeName:
                    final arguments =
                        settings.arguments as SearchPageArguments?;
                    return createRouteWithFadeTransition(
                      builder: (context, _, __) => SearchPage(
                        categoryID: arguments?.categoryID,
                        searchQuery: arguments?.searchQuery,
                      ),
                    );
                  case CaptchaPage.routeName:
                    final arguments =
                        settings.arguments as CaptchaPageArguments?;
                    return createRouteWithFadeTransition(
                      builder: (context, _, __) =>
                          CaptchaPage(onMessage: arguments!.onMessage),
                    );
                  case OTPPage.routeName:
                    final arguments = settings.arguments as SignupForm?;
                    return MaterialPageRoute(
                      builder: (context) => OTPPage(form: arguments!),
                    );
                  case ProductDetailPage.routeName:
                    final arguments =
                        settings.arguments as ProductDetailPageArguments?;
                    return MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                          product: arguments!.product,
                          id: arguments.id,
                          heroTagPrefix: arguments.heroTagPrefix),
                    );
                  case OrderDetailPage.routeName:
                    final arguments =
                        settings.arguments as OrderDetailPageArguments?;
                    return MaterialPageRoute(
                      builder: (context) =>
                          OrderDetailPage(orderId: arguments!.orderId),
                    );
                  case AuthorPage.routeName:
                    final arguments =
                        settings.arguments as AuthorPageArguments?;
                    return MaterialPageRoute(
                      builder: (context) => AuthorPage(id: arguments!.id),
                    );
                  default:
                    return null;
                }
              },
              initialRoute: widget.isAuthenticated
                  ? MainPage.routeName
                  : LoginPage.routeName,
              routes: {
                MainPage.routeName: (context) => MainPage(),
                LoginPage.routeName: (context) => LoginPage(),
                SignupPage.routeName: (context) => SignupPage(),
                ProfilePage.routeName: (context) => ProfilePage(),
                ContactUsPage.routeName: (context) => ContactUsPage(),
                PersonalInformationPage.routeName: (context) =>
                    PersonalInformationPage(),
                OrdersPage.routeName: (context) => OrdersPage(),
                CartPage.routeName: (context) => CartPage(),
              },
            ),
          );
        },
      ),
    );
  }

  final _theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: "Dubai",
    splashColor: Colors.transparent,
    backgroundColor: const Color(0xFFF7F7F7),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: createMaterialColor(_kOrangeColor),
    ).copyWith(secondary: _kGreenColor),
  );

  ThemeData _buildTheme() {
    final theme = _theme.copyWith(
      tooltipTheme: _theme.tooltipTheme.copyWith(
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(kDefaultBorderRadius),
        ),
      ),
      highlightColor: Colors.grey.withOpacity(.1),
      bottomSheetTheme: _theme.bottomSheetTheme.copyWith(
        backgroundColor: Colors.transparent,
      ),
      textTheme: _theme.textTheme.copyWith(
        button: _theme.textTheme.button!.copyWith(
          color: Colors.grey.shade800,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        headline6: _theme.textTheme.headline6!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        bodyText1: _theme.textTheme.bodyText1!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );

    return theme.copyWith(
      appBarTheme: theme.appBarTheme.copyWith(
        backgroundColor: _theme.scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        toolbarTextStyle: theme.textTheme.bodyText2,
        titleTextStyle: theme.textTheme.headline6,
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
        bottomNavigationBar:
            _buildBottomNavigationBar(context, currentTab, appBarVisible),
        body: Stack(
          children: [
            NotificationListener<ScrollNotification>(
              onNotification: (notification) =>
                  _onScrollNotification(notification, appBarVisible),
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

  bool _onScrollNotification(
      ScrollNotification notification, ValueNotifier<bool> appBarVisible) {
    if (notification.metrics.axis != Axis.vertical) return true;

    // when the scroll has settled on the scroll extent then always show the app bar.
    if (notification.metrics.atEdge) {
      appBarVisible.value = true;
      return true;
    }

    // only hide/show the app bar if the user is scrolling to ignore the scroll animation as
    // it causes issues when switching between tabs.
    if (notification is ScrollUpdateNotification &&
        notification.dragDetails != null) {
      if (notification.scrollDelta! > _kMinVelocityToHideAppBar &&
          notification.metrics.pixels > kAppBarHeight / 2) {
        appBarVisible.value = false;
      } else if (notification.scrollDelta! < _kMaxVelocityToShowAdapter) {
        appBarVisible.value = true;
      }
    }
    return true;
  }

  Widget _buildAppBar(BuildContext context, bool isVisible) {
    final padding = MediaQuery.of(context).padding;
    final theme = Theme.of(context);

    final isAuthed = context.watch<AuthProvider>().isAuthenticated;

    return AnimatedOpacity(
      opacity: isVisible ? 1 : 0,
      duration: Duration(milliseconds: 300),
      child: IgnorePointer(
        ignoring: !isVisible,
        child: Container(
          height: kAppBarHeight + padding.top,
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                theme.backgroundColor,
                theme.backgroundColor.withOpacity(0)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Row(
              children: [
                Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartPage.routeName);
                  },
                  tooltip: context.loc!.cart,
                  icon: SvgPicture.asset("assets/svg/bag.svg",
                      color: Colors.grey.shade800),
                ),
                const SizedBox(width: kDefaultPadding),
                IconButton(
                  padding: const EdgeInsets.only(),
                  onPressed: () {
                    Navigator.of(context).pushNamed(ProfilePage.routeName);
                  },
                  tooltip: context.loc!.profile,
                  icon: CircleAvatar(
                    radius: kAppBarHeight / 2,
                    child: !isAuthed
                        ? SvgPicture.asset(
                            "assets/svg/person.svg",
                            width: 15,
                            color: Colors.white,
                          )
                        : null,
                    backgroundColor:
                        !isAuthed ? theme.primaryColor : theme.backgroundColor,
                    backgroundImage: isAuthed
                        ? AssetImage("assets/images/product_placeholder.png")
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context,
      ValueNotifier<int> currentTab, ValueNotifier<bool> appBarVisible) {
    final theme = Theme.of(context);

    return Container(
      clipBehavior: Clip.antiAlias,
      padding:
          EdgeInsets.all(kDefaultPadding).copyWith(bottom: kDefaultPadding / 2),
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        boxShadow: const [
          const BoxShadow(color: Colors.black12, blurRadius: 10),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildIcon(
              context,
              name: "home",
              description: context.loc!.home,
              idx: 0,
              currentIdx: currentTab,
              appBarVisible: appBarVisible,
            ),
            _buildIcon(
              context,
              name: "categories",
              description: context.loc!.categoriesAndCollections,
              idx: 1,
              currentIdx: currentTab,
              appBarVisible: appBarVisible,
            ),
            _buildIcon(
              context,
              name: "bookmark",
              description: context.loc!.bookmarks,
              idx: 2,
              currentIdx: currentTab,
              appBarVisible: appBarVisible,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(
    BuildContext context, {
    required String name,
    required String description,
    required int idx,
    required ValueNotifier<int> currentIdx,
    required ValueNotifier<bool> appBarVisible,
  }) {
    final theme = Theme.of(context);
    final selected = idx == currentIdx.value;
    return IconButton(
      onPressed: () {
        currentIdx.value = idx;
        appBarVisible.value = true;
      },
      tooltip: description,
      icon: SvgPicture.asset(
        "assets/svg/$name${idx == currentIdx.value ? "_filled" : ""}.svg",
        color: selected ? theme.colorScheme.secondary : null,
      ),
    );
  }
}
