import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/utils/ext.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key key}) : super(key: key);

  static const routeName = "/contact_us";

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
      appBar: AppBar(title: Text(context.loc.contactUs)),
      body: ListView(
        padding: EdgeInsets.only(
          top: kDefaultPadding,
          bottom: kDefaultPadding + padding.bottom,
          right: kDefaultPadding + padding.right,
          left: kDefaultPadding + padding.left,
        ),
        children: [
          _buildLinkItem(
            context,
            name: context.loc.facebook,
            icon: "assets/svg/facebook.svg",
            url: "https://facebook.com/hassahbook",
            color: Colors.blue,
          ),
          const SizedBox(height: kDefaultPadding),
          _buildLinkItem(
            context,
            name: context.loc.instagram,
            icon: "assets/svg/instagram.svg",
            url: "https://instagram.com/hassahbook",
            color: Colors.red,
          ),
          const SizedBox(height: kDefaultPadding),
          _buildLinkItem(
            context,
            name: context.loc.twitter,
            icon: "assets/svg/twitter.svg",
            url: "https://twitter.com/hassahbook",
            color: Colors.cyan,
          ),
          const SizedBox(height: kDefaultPadding),
          _buildLinkItem(
            context,
            name: context.loc.email,
            icon: "assets/svg/email.svg",
            url: "mailto:sal@hassah.me",
            color: Colors.amber,
          ),
        ],
      ),
    );
  }

  ClipRRect _buildLinkItem(BuildContext context,
      {@required String name,
      @required String icon,
      @required String url,
      @required Color color}) {
    final theme = Theme.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefaultBorderRadius),
        ),
        tileColor: theme.backgroundColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding / 2,
        ),
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(.2),
          child: SvgPicture.asset(
            icon,
            width: 25,
          ),
        ),
        title: Text(name),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          launch(url);
        },
      ),
    );
  }
}
