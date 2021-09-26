import 'package:flutter/material.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/utils/ext.dart';

String humanizeOrderStatus(BuildContext context, OrderStatus status) {
  switch (status) {
    case OrderStatus.pending:
      return context.loc.pending;
    case OrderStatus.processed:
      return context.loc.processed;
    case OrderStatus.delivering:
      return context.loc.delivering;
    case OrderStatus.delivered:
      return context.loc.delivered;
    case OrderStatus.canceled:
      return context.loc.canceled;
    case OrderStatus.failed:
      return context.loc.failed;
    default:
      return "Unknown";
  }
}
