import 'package:flutter/material.dart';
import 'package:hassah_book_flutter/app/auth_provider.dart';
import 'package:hassah_book_flutter/app/pages/login.dart';
import 'package:hassah_book_flutter/app/pages/personal_information.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = "/profile";

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
                CircleAvatar(
                  radius: kAvatarRadius,
                  backgroundColor: theme.scaffoldBackgroundColor,
                  backgroundImage: AssetImage("assets/images/product_placeholder.png"),
                ),
                SizedBox(height: kDefaultPadding),
                Text("Ahmed Abdul Jabar", style: theme.textTheme.headline6),
                // TODO: design a simple logout button.
                ElevatedButton(
                  onPressed: () {
                    auth.logout();
                  },
                  child: Text("Logout"),
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
                Text("Login To View Profile"),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(LoginPage.routeName);
                  },
                  child: Text("Login"),
                )
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
