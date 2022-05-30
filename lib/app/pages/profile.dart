import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/auth_provider.dart';
import 'package:hassah_book_flutter/app/pages/contact_us.dart';
import 'package:hassah_book_flutter/app/pages/login.dart';
import 'package:hassah_book_flutter/app/pages/orders.dart';
import 'package:hassah_book_flutter/app/pages/personal_information.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/utils/ext.dart';
import 'package:hassah_book_flutter/common/widgets/loading_indicator.dart';
import 'package:hassah_book_flutter/common/widgets/retry.dart';
import 'package:hassah_book_flutter/graphql/me.query.graphql.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = MediaQuery.of(context).padding;

    final auth = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(title: Text(context.loc!.profile)),
      body: ListView(
        padding: EdgeInsets.all(kDefaultPadding)
            .copyWith(bottom: padding.bottom + kDefaultPadding),
        children: [
          if (auth.isAuthenticated)
            Column(
              children: [
                Query(
                  options: QueryOptions(document: queryDocumentMe),
                  builder: (result, {refetch, fetchMore}) {
                    if (result.hasException) {
                      return Retry(
                        message: context.loc!.somethingWentWrong,
                        onRetry: refetch,
                      );
                    }

                    if (result.isLoading) {
                      return const LoadingIndicator();
                    }

                    final me = Query$Me.fromJson(result.data!).me;

                    return Column(
                      children: [
                        CircleAvatar(
                          radius: kAvatarRadius,
                          backgroundColor: theme.scaffoldBackgroundColor,
                          backgroundImage: AssetImage(
                              "assets/images/product_placeholder.png"),
                        ),
                        const SizedBox(height: kDefaultPadding),
                        Text(me.name, style: theme.textTheme.headline6),
                      ],
                    );
                  },
                ),
                const SizedBox(height: kDefaultPadding),
                Material(
                  color: theme.backgroundColor,
                  borderRadius: BorderRadius.circular(9999),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (context) => LogoutDialog(),
                      );
                    },
                    child: Ink(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding * 1.5,
                          vertical: kDefaultPadding),
                      child: Text(
                        context.loc!.logout.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: theme.textTheme.button,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
                ClipRRect(
                  borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(kDefaultBorderRadius)),
                    tileColor: theme.backgroundColor,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding,
                        vertical: kDefaultPadding / 2),
                    leading: CircleAvatar(
                      backgroundColor: theme.primaryColor.withOpacity(.2),
                      child: Icon(
                        Icons.person_outline,
                        color: theme.primaryColor,
                      ),
                    ),
                    title: Text(context.loc!.personalInformation),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(PersonalInformationPage.routeName);
                    },
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
                ClipRRect(
                  borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed(OrdersPage.routeName);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(kDefaultBorderRadius)),
                    tileColor: theme.backgroundColor,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding,
                        vertical: kDefaultPadding / 2),
                    leading: CircleAvatar(
                      backgroundColor: theme.primaryColor.withOpacity(.2),
                      child: Icon(Icons.shopping_bag_outlined,
                          color: theme.primaryColor),
                    ),
                    title: Text(context.loc!.myOrders),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
              ],
            )
          else
            Column(
              children: [
                Text(context.loc!.loginToSeeYourProfile,
                    style: theme.textTheme.subtitle1),
                const SizedBox(height: kDefaultPadding),
                Material(
                  color: theme.colorScheme.secondary,
                  borderRadius: BorderRadius.circular(9999),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(LoginPage.routeName);
                    },
                    child: Ink(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding * 1.5,
                          vertical: kDefaultPadding),
                      child: Text(
                        context.loc!.login.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: theme.textTheme.button!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          const SizedBox(height: kDefaultPadding),
          ClipRRect(
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kDefaultBorderRadius)),
              tileColor: theme.backgroundColor,
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
              leading: CircleAvatar(
                backgroundColor: theme.primaryColor.withOpacity(.2),
                child:
                    Icon(Icons.translate_outlined, color: theme.primaryColor),
              ),
              title: Text(context.loc!.language),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (context) => LanguageDialog(),
                );
              },
            ),
          ),
          const SizedBox(height: kDefaultPadding),
          ClipRRect(
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kDefaultBorderRadius)),
              tileColor: theme.backgroundColor,
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
              leading: CircleAvatar(
                backgroundColor: theme.primaryColor.withOpacity(.2),
                child: Icon(Icons.notifications_outlined,
                    color: theme.primaryColor),
              ),
              title: Text(context.loc!.notifications),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          const SizedBox(height: kDefaultPadding),
          ClipRRect(
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kDefaultBorderRadius)),
              tileColor: theme.backgroundColor,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding / 2,
              ),
              leading: CircleAvatar(
                backgroundColor: theme.primaryColor.withOpacity(.2),
                child: Icon(Icons.info_outline, color: theme.primaryColor),
              ),
              title: Text(context.loc!.contactUs),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(context, ContactUsPage.routeName);
              },
            ),
          ),
          const SizedBox(height: kDefaultPadding),
          ClipRRect(
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kDefaultBorderRadius)),
              tileColor: theme.backgroundColor,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding / 2,
              ),
              leading: CircleAvatar(
                backgroundColor: theme.primaryColor.withOpacity(.2),
                child:
                    Icon(Icons.privacy_tip_outlined, color: theme.primaryColor),
              ),
              title: Text(context.loc!.privacyPolicy),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                launch("https://hassah.netlify.app/privacy_policy");
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LanguageDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isArabic = context.loc!.localeName == "ar";

    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(kDefaultBorderRadius * 2),
            topRight: Radius.circular(kDefaultBorderRadius * 2),
          ),
          // color: theme.scaffoldBackgroundColor,
        ),
        padding: const EdgeInsets.all(kDefaultPadding),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                child: ListTile(
                  selected: isArabic,
                  selectedTileColor: theme.colorScheme.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                  ),
                  tileColor: isArabic
                      ? theme.colorScheme.secondary
                      : theme.backgroundColor,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                    vertical: kDefaultPadding / 2,
                  ),
                  title: Text(
                    "العربية",
                    style: isArabic
                        ? theme.textTheme.bodyText1!
                            .copyWith(color: Colors.white)
                        : null,
                  ),
                  trailing:
                      isArabic ? Icon(Icons.check, color: Colors.white) : null,
                  onTap: () {
                    context.setLocale(Locale("ar"));
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(height: kDefaultPadding),
              ClipRRect(
                borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                child: ListTile(
                  selected: !isArabic,
                  selectedTileColor: theme.accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                  ),
                  tileColor:
                      !isArabic ? theme.accentColor : theme.backgroundColor,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                    vertical: kDefaultPadding / 2,
                  ),
                  title: Text(
                    "English",
                    style: !isArabic
                        ? theme.textTheme.bodyText1!
                            .copyWith(color: Colors.white)
                        : null,
                  ),
                  trailing:
                      !isArabic ? Icon(Icons.check, color: Colors.white) : null,
                  onTap: () {
                    context.setLocale(Locale("en"));
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LogoutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final auth = context.watch<AuthProvider>();

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
              context.loc!.logoutConfirmation,
              style: theme.textTheme.subtitle1,
            ),
            const SizedBox(height: kDefaultPadding),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding * 1.5,
                            vertical: kDefaultPadding),
                        child: Text(
                          context.loc!.cancel.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: theme.textTheme.button!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: kDefaultPadding),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding * 1.5,
                            vertical: kDefaultPadding),
                        child: Text(
                          context.loc!.yes,
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
  }
}
