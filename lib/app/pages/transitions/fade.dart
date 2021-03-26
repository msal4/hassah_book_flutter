import 'package:flutter/material.dart';

PageRouteBuilder createRouteWithFadeTransition({@required RoutePageBuilder builder}) {
  return PageRouteBuilder(
    pageBuilder: builder,
    transitionsBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) {
      return FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(animation),
        child: child,
      );
    },
  );
}
