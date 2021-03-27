import 'package:flutter/material.dart';
import 'package:hassah_book_flutter/app/widgets/round_container.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';

class PersonalInformationPage extends StatelessWidget {
  static const routeName = "/profile/personal_information";

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text("Personal Information")),
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding).copyWith(bottom: padding.bottom + kDefaultPadding),
        children: [
          Center(
            child: CircleAvatar(
              radius: kAvatarRadius,
              backgroundColor: theme.scaffoldBackgroundColor,
              backgroundImage: AssetImage("assets/images/product_placeholder.png"),
            ),
          ),
          SizedBox(height: kDefaultPadding),
          ClipRRect(
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
            child: TextField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding / 1.5),
                border: InputBorder.none,
                labelText: "Name",
                filled: true,
              ),
            ),
          ),
          SizedBox(height: kDefaultPadding),
          ClipRRect(
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
            child: TextField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding / 1.5),
                border: InputBorder.none,
                labelText: "Address",
                filled: true,
              ),
            ),
          ),
          SizedBox(height: kDefaultPadding),
          ClipRRect(
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding / 1.5),
                border: InputBorder.none,
                labelText: "Phone Number",
                filled: true,
              ),
            ),
          ),
          SizedBox(height: kDefaultPadding),
          RoundContainer(
            padding: const EdgeInsets.all(kDefaultPadding),
            color: theme.primaryColor,
            child: Text(
              "APPLY",
              textAlign: TextAlign.center,
              style: theme.textTheme.button.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
