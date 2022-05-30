import 'package:flutter/material.dart';
import 'package:hassah_book_flutter/common/utils/ext.dart';
import 'package:hassah_book_flutter/schema.graphql.dart';

String humanizeOrderStatus(BuildContext context, Enum$OrderStatus status) {
  switch (status) {
    case Enum$OrderStatus.Pending:
      return context.loc!.pending;
    case Enum$OrderStatus.Processed:
      return context.loc!.processed;
    case Enum$OrderStatus.Delivering:
      return context.loc!.delivering;
    case Enum$OrderStatus.Delivered:
      return context.loc!.delivered;
    case Enum$OrderStatus.Canceled:
      return context.loc!.canceled;
    case Enum$OrderStatus.Failed:
      return context.loc!.failed;
    default:
      return "Unknown";
  }
}
