import 'package:hassah_book_flutter/common/api/api.dart';

String humanizeOrderStatus(OrderStatus status) {
  switch (status) {
    case OrderStatus.pending:
      return "Pending";
    case OrderStatus.processed:
      return "Processed";
    case OrderStatus.delivering:
      return "Delivering";
    case OrderStatus.delivered:
      return "Delivered";
    case OrderStatus.canceled:
      return "Canceled";
    case OrderStatus.failed:
      return "Failed";
    default:
      return "Unknown";
  }
}
