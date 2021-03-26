import 'package:flutter/material.dart';
import 'package:hassah_book_flutter/app/pages/personal_information.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: ListView(
        padding: EdgeInsets.all(kDefaultPadding).copyWith(bottom: padding.bottom + kDefaultPadding),
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: kAvatarRadius,
                backgroundColor: theme.scaffoldBackgroundColor,
                backgroundImage: AssetImage("assets/images/product_placeholder.png"),
              ),
              SizedBox(height: kDefaultPadding),
              Text("Ahmed Abdul Jabar", style: theme.textTheme.headline6),
            ],
          ),
          SizedBox(height: kDefaultPadding),
          ClipRRect(
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
            child: ListTile(
              tileColor: Colors.grey.shade100,
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
              tileColor: Colors.grey.shade100,
              contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
              leading: CircleAvatar(
                backgroundColor: theme.primaryColor.withOpacity(.2),
                child: Icon(Icons.shopping_bag_outlined, color: theme.primaryColor),
              ),
              title: Text("My Orders"),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          SizedBox(height: kDefaultPadding),
          ClipRRect(
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
            child: ListTile(
              tileColor: Colors.grey.shade100,
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
              tileColor: Colors.grey.shade100,
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
              tileColor: Colors.grey.shade100,
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
              tileColor: Colors.grey.shade100,
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
