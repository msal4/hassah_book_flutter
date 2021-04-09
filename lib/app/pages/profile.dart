import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/auth_provider.dart';
import 'package:hassah_book_flutter/app/pages/login.dart';
import 'package:hassah_book_flutter/app/pages/personal_information.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/widgets/loading_indicator.dart';
import 'package:hassah_book_flutter/common/widgets/retry.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = "/profile";

  final _meQuery = MeQuery();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = MediaQuery.of(context).padding;

    final auth = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: ListView(
        padding: EdgeInsets.all(kDefaultPadding).copyWith(bottom: padding.bottom + kDefaultPadding),
        children: [
          if (auth.isAuthenticated)
            Column(
              children: [
                Query(
                  options: QueryOptions(document: _meQuery.document),
                  builder: (result, {refetch, fetchMore}) {
                    if (result.hasException) {
                      return Retry(message: result.exception.toString(), onRetry: refetch);
                    }

                    if (result.isLoading) {
                      return LoadingIndicator();
                    }

                    final me = _meQuery.parse(result.data).me;

                    return Column(
                      children: [
                        CircleAvatar(
                          radius: kAvatarRadius,
                          backgroundColor: theme.scaffoldBackgroundColor,
                          backgroundImage: AssetImage("assets/images/product_placeholder.png"),
                        ),
                        SizedBox(height: kDefaultPadding),
                        Text(me.name, style: theme.textTheme.headline6),
                      ],
                    );
                  },
                ),
                SizedBox(height: kDefaultPadding),
                Material(
                  color: theme.backgroundColor,
                  borderRadius: BorderRadius.circular(9999),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(kDefaultBorderRadius * 2),
                                topRight: Radius.circular(kDefaultBorderRadius * 2),
                              ),
                              color: theme.scaffoldBackgroundColor,
                            ),
                            padding: const EdgeInsets.all(kDefaultPadding),
                            child: SafeArea(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Authentication is required to order products. Are you sure you want to logout?',
                                    style: theme.textTheme.subtitle1,
                                  ),
                                  SizedBox(height: kDefaultPadding),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Material(
                                          color: theme.accentColor,
                                          borderRadius: BorderRadius.circular(9999),
                                          clipBehavior: Clip.antiAlias,
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Ink(
                                              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding),
                                              child: Text(
                                                "CANCEL",
                                                textAlign: TextAlign.center,
                                                style: theme.textTheme.button.copyWith(color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: kDefaultPadding),
                                      Expanded(
                                        flex: 1,
                                        child: Material(
                                          color: theme.backgroundColor,
                                          borderRadius: BorderRadius.circular(9999),
                                          clipBehavior: Clip.antiAlias,
                                          child: InkWell(
                                            onTap: () {
                                              auth.logout();
                                              Navigator.pop(context);
                                            },
                                            child: Ink(
                                              // width: double.maxFinite,
                                              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding),
                                              child: Text(
                                                "YES",
                                                textAlign: TextAlign.center,
                                                style: theme.textTheme.button,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Ink(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding),
                      child: Text(
                        "LOGOUT",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.button,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: kDefaultPadding),
                ClipRRect(
                  borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                  child: ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kDefaultBorderRadius)),
                    tileColor: theme.backgroundColor,
                    contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
                    leading: CircleAvatar(
                      backgroundColor: theme.primaryColor.withOpacity(.2),
                      child: Icon(Icons.person_outline, color: theme.primaryColor),
                    ),
                    title: Text("Personal Information"),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.of(context).pushNamed(PersonalInformationPage.routeName);
                    },
                  ),
                ),
                SizedBox(height: kDefaultPadding),
                ClipRRect(
                  borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                  child: ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kDefaultBorderRadius)),
                    tileColor: theme.backgroundColor,
                    contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
                    leading: CircleAvatar(
                      backgroundColor: theme.primaryColor.withOpacity(.2),
                      child: Icon(Icons.shopping_bag_outlined, color: theme.primaryColor),
                    ),
                    title: Text("My Orders"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
              ],
            )
          else
            // TODO: design a simple header to lead the user to login or register.
            Column(
              children: [
                Text("Login to see your profile", style: theme.textTheme.subtitle1),
                SizedBox(height: kDefaultPadding),
                Material(
                  color: theme.accentColor,
                  borderRadius: BorderRadius.circular(9999),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(LoginPage.routeName);
                    },
                    child: Ink(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding),
                      child: Text(
                        "LOGIN",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.button.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          SizedBox(height: kDefaultPadding),
          ClipRRect(
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
            child: ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kDefaultBorderRadius)),
              tileColor: theme.backgroundColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
              leading: CircleAvatar(
                backgroundColor: theme.primaryColor.withOpacity(.2),
                child: Icon(Icons.translate_outlined, color: theme.primaryColor),
              ),
              title: Text("Language"),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          SizedBox(height: kDefaultPadding),
          ClipRRect(
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
            child: ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kDefaultBorderRadius)),
              tileColor: theme.backgroundColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
              leading: CircleAvatar(
                backgroundColor: theme.primaryColor.withOpacity(.2),
                child: Icon(Icons.notifications_outlined, color: theme.primaryColor),
              ),
              title: Text("Notifications"),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          SizedBox(height: kDefaultPadding),
          ClipRRect(
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
            child: ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kDefaultBorderRadius)),
              tileColor: theme.backgroundColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
              leading: CircleAvatar(
                backgroundColor: theme.primaryColor.withOpacity(.2),
                child: Icon(Icons.info_outline, color: theme.primaryColor),
              ),
              title: Text("Contact Us"),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          SizedBox(height: kDefaultPadding),
          ClipRRect(
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
            child: ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kDefaultBorderRadius)),
              tileColor: theme.backgroundColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
              leading: CircleAvatar(
                backgroundColor: theme.primaryColor.withOpacity(.2),
                child: Icon(Icons.privacy_tip_outlined, color: theme.primaryColor),
              ),
              title: Text("Privacy Policy"),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
        ],
      ),
    );
  }
}
