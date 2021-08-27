import 'package:late_pos/models/transaction_list_model.dart';

class TransactionHistoryModel extends TransactionListModel {
  TransactionHistoryModel(
      {String code,
      String name,
      double grandTotal,
      String time,
      String note,
      String orders,
      String date})
      : super(
            code: code,
            name: name,
            grandTotal: grandTotal,
            time: time,
            note: note,
            orders: orders,
            date: date);
}
