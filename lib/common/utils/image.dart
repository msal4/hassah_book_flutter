import "package:path/path.dart";

import 'const.dart';

String imageURL(String image, int width) =>
    join(kImageCDN, image) + "?w=$width";
