import 'package:flutter/material.dart';
import 'package:hassah_book_flutter/common/utils/ext.dart';

class Retry extends StatelessWidget {
  const Retry({
    Key key,
    @required this.message,
    this.onRetry,
  })  : assert(message != null, 'a message must be provided'),
        super(key: key);

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            child: Text(context.loc.retry),
            onPressed: onRetry,
          ),
          Text(message),
        ],
      ),
    );
  }
}
