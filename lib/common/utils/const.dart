import 'dart:ui';

const kDefaultPadding = 20.0;
const kDefaultBorderRadius = 10.0;
const kAppBarHeight = 80.0;
const kAvatarRadius = 70.0;
const kSlidableActionExtentRatio = .25;
const kDefaultIconSize = 20.0;
const kCartBoxName = "cartStore";
const kAuthBoxName = "authStore";
const kLocaleBoxName = "localeStore";
const kDangerColor = Color(0xFFF06F6F);

const kDefaultImageWidth = 140.0;
const kDefaultImageHeight = 220.0;

const kSmallProductImageWidth = kDefaultImageWidth / 2;
const kSmallProductImageHeight = kDefaultImageHeight / 2;
const kCoverAspectRatio = 6 / 9;

const kImageCDN = String.fromEnvironment(
  "CDN_URL",
  defaultValue: "https://hassahbook.imgix.net",
);
const kApiURLPrefix = String.fromEnvironment(
  "API_URL",
  defaultValue: "https://book.hassah.me",
);
