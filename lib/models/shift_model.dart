import 'package:flutter/foundation.dart';

class ShiftModel {
  String cashier;
  String status;
  String initialTime;
  String finalTime;
  String startDate;
  String endDate;
  double initialCash;
  double finalCash;

  ShiftModel({
    @required this.cashier,
    @required this.status,
    @required this.initialTime,
    @required this.finalTime,
    @required this.startDate,
    @required this.endDate,
    @required this.initialCash,
    this.finalCash
  });
}
