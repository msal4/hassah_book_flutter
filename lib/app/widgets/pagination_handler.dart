import 'package:flutter/cupertino.dart';

const _kFetchMoreThreshold = 100.0;

/// PaginationHandler is a widget that handles pagination if the provided child is scrollable.
/// Make sure to disable the widget when the pagination is not needed anymore using the `enabled` option.
class PaginationHandler extends StatelessWidget {
  PaginationHandler({
    @required this.child,
    this.bottomThreshold = _kFetchMoreThreshold,
    this.enabled = true,
    @required this.fetchMore,
  }) : assert(child != null, "child is required");

  final Widget child;

  /// The distance from the bottom on which to load more data if its exceeded.
  final double bottomThreshold;

  /// Enables pagination handler.
  final bool enabled;

  /// Called when the threshold is exceeded.
  final VoidCallback fetchMore;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollUpdateNotification && enabled && scrollNotification.metrics.pixels + _kFetchMoreThreshold >= scrollNotification.metrics.maxScrollExtent) {
          fetchMore();
        }
        return true;
      },
      child: child,
    );
  }
}
