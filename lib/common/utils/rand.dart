import 'dart:convert';
import 'dart:math';

String generateRandomString([len = 5]) {
  var random = Random();
  var values = List<int>.generate(len, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}
