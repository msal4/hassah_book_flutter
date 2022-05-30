import 'package:flutter/material.dart';

const _kDefaultFetchMoreThreshold = 100.0;

/// PaginationHandler is a widget that handles pagination if the provided [child] is scrollable or has a scrollable in it's tree.
///
/// Make sure to disable the widget when the pagination is not needed anymore using the [enabled] option.
class PaginationHandler extends StatelessWidget {
  PaginationHandler({
    required this.child,
    required this.fetchMore,
    this.bottomThreshold = _kDefaultFetchMoreThreshold,
    this.axis = Axis.vertical,
    this.enabled = true,
  })  : assert(child != null, "child is required"),
        assert(fetchMore != null),
        assert(bottomThreshold != null),
        assert(axis != null),
        assert(enabled != null);

  // The widget that is a scrollable or has a scrollable descendant.
  final Widget child;

  /// Called when the [bottomThreshold] is exceeded.
  final VoidCallback fetchMore;

  /// The distance from the bottom on which to load more data if its exceeded.
  final double bottomThreshold;

  /// The scroll direction.
  final Axis axis;

  /// Enables pagination handler.
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: enabled
          ? (scrollNotification) {
              if (enabled &&
                  scrollNotification is ScrollUpdateNotification &&
                  scrollNotification.metrics.axis == axis &&
                  scrollNotification.metrics.pixels +
                          _kDefaultFetchMoreThreshold >=
                      scrollNotification.metrics.maxScrollExtent) {
                fetchMore();
              }
              return false;
            }
          : null,
      child: child,
    );
  }
}
