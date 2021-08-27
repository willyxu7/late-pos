import 'package:flutter/foundation.dart';
class TransactionListModel {
  String code;
  String name;
  double grandTotal;
  String time;
  String note;
  String orders;
  String date;

  TransactionListModel({
    @required this.code,
    this.name,
    this.grandTotal,
    this.time,
    this.note,
    this.orders,
    this.date,
  });
}
